import 'dart:async';
import 'dart:io';

import 'package:grpc/grpc.dart' as grpc;

import 'common.dart';
import 'generated/grpc_file_transfer.pb.dart';
import 'generated/grpc_file_transfer.pbgrpc.dart';

class GrpcFileTransferService extends GrpcFileTransferServiceBase {
  final FileManager fileManager;

  GrpcFileTransferService(this.fileManager);

  @override
  Future<UploadStatus> upload(
      grpc.ServiceCall call, Stream<PutRequest> request) async {
    final StreamController<Chunk> streamController = StreamController<Chunk>();
    final broadcast = request.asBroadcastStream();
    final first = await broadcast.first;

    // Check for packet metadata
    Metadata metadata;
    if (first.hasMetadata()) {
      metadata = first.metadata;
    } else {
      return UploadStatus()
        ..code = UploadStatusCode.Failed
        ..message = "No metadata found.";
    }

    // Check metadata validity
    if (metadata.fileSize > 5e9) {
      print("File ${metadata.fileName} is too big. Connection refused.");
      return UploadStatus()
        ..code = UploadStatusCode.Failed
        ..message = "File is too big: ${metadata.fileSize} > 5MB";
    }

    // Start uploading
    final response = fileManager.upload(
      streamController.stream,
      metadata.fileName,
      metadata.fileSize,
    );

    final chunks = broadcast
        .where((data) => data.hasChunk())
        .map((data) => data.chunk)
        .asBroadcastStream();

    final firstChunk = await chunks.first;
    final signature = firstChunk.data.sublist(0, 8);

    // Check for image metadata
    if (!isPNG(signature) && !isJPEG(signature)) {
      await streamController.close();
      await response;
      await fileManager.remove(metadata.fileName);
      return UploadStatus()
        ..code = UploadStatusCode.Failed
        ..message = "Format refused. Must be PNG or JPEG.";
    }

    // Uploading
    streamController.add(firstChunk);
    await chunks.forEach(streamController.add);
    await streamController.close();

    print("StatusCode: ${(await response).code}");
    print("Message: ${(await response).message}");
    return response;
  }

  bool isPNG(List<int> signature) {
    return signature[0] == 0x89 &&
        signature[1] == 0x50 &&
        signature[2] == 0x4E &&
        signature[3] == 0x47 &&
        signature[4] == 0x0D &&
        signature[5] == 0x0A &&
        signature[6] == 0x1A &&
        signature[7] == 0x0A;
  }

  bool isJPEG(List<int> signature) {
    return signature[0] == 0xFF && signature[1] == 0xD8 && signature[2] == 0xFF;
  }
}

class Server {
  Future<void> main(List<String> args) async {
    final FileManager fileManager = FileManagerImpl();
    final server = grpc.Server([GrpcFileTransferService(fileManager)]);
    await server.serve(address: '127.0.0.1', port: 8080);
    print('Server listening on port ${server.port}...');

    ProcessSignal.sigint.watch().listen((ProcessSignal signal) async {
      print("Exiting...");
      await server.shutdown().then((_) => print("Server shutdown."));
      exit(0);
    });
  }
}
