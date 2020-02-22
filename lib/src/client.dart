import 'dart:async';
import 'dart:io';

import 'package:grpc/grpc.dart';

import 'generated/grpc_file_transfer.pbgrpc.dart';

class Client {
  ClientChannel channel;
  GrpcFileTransferClient stub;
  GrpcFileTransferClientService service;

  Future<void> main(List<String> args) async {
    // Setup

    final List<int> trustedRoot = File('ca.crt').readAsBytesSync();
    final ChannelCredentials creds = ChannelCredentials.secure(
      certificates: trustedRoot,
      authority: 'localhost',
    );
    channel = ClientChannel(
      'localhost',
      port: 8443,
      options: ChannelOptions(credentials: creds),
    );
    stub = GrpcFileTransferClient(
      channel,
      options: CallOptions(timeout: const Duration(seconds: 60)),
    );
    service = GrpcFileTransferClientService(stub);

    // DO
    try {
      final file = File("input.png");
      final datas = file.openRead();
      await service.upload(
        datas,
        "../../../etc/passwd/output.png",
        file.lengthSync(),
      );
    } catch (e, s) {
      print('Caught error: $e. Stacktrace:\n$s');
    }

    // Shutdown
    await channel.shutdown();
  }
}

class GrpcFileTransferClientService {
  final GrpcFileTransferClient grpcFileTransferClient;

  GrpcFileTransferClientService(this.grpcFileTransferClient);

  Future<UploadStatus> upload(
      Stream<List<int>> datas, String fileName, int fileSize) async {
    final StreamController<PutRequest> streamController =
        StreamController<PutRequest>();
    final response = grpcFileTransferClient.upload(streamController.stream);

    // Send metadata first
    final request = PutRequest()
      ..metadata = (Metadata()
        ..auth = "Auth"
        ..fileName = fileName
        ..fileSize = fileSize);
    streamController.add(request);

    // Then, send all the chunks
    final chunks =
        datas.map((data) => PutRequest()..chunk = (Chunk()..data = data));

    await chunks.forEach(streamController.add);
    await streamController.close();
    print("StatusCode: ${(await response).code}");
    print("Message: ${(await response).message}");
    return response;
  }
}
