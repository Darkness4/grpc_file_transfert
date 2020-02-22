import 'dart:io';

import 'package:path/path.dart';

import 'generated/grpc_file_transfer.pb.dart';

abstract class FileManager {
  Future<void> remove(String fileName);
  Future<UploadStatus> upload(
      Stream<Chunk> chunks, String fileName, int fileSize);
}

class FileManagerImpl implements FileManager {
  static FileManagerImpl _instance;

  factory FileManagerImpl() {
    return _instance ??= const FileManagerImpl._internal();
  }

  const FileManagerImpl._internal();

  @override
  Future<void> remove(String fileName) async {
    final path = "images/" + basename(fileName);
    final file = File(path);
    if (file.existsSync()) {
      return file.delete();
    }
  }

  @override
  Future<UploadStatus> upload(
      Stream<Chunk> chunks, String fileName, int fileSize) async {
    final path = "images/" + basename(fileName);
    final File file = await File(path).create(recursive: true);
    final IOSink sink = file.openWrite();
    int size = 0;
    try {
      await chunks.forEach((chunk) {
        size += chunk.data.length;
        print("${(size / fileSize * 100).round()}%");
        if (size > fileSize) {
          throw Exception(
              "File received does not correspond to received metadata: File : $size > Metadata : $fileSize");
        }

        sink.add(chunk.data);
      });
    } catch (e) {
      await sink.close();
      await remove(fileName);
      return UploadStatus()
        ..message = "Failed unexpectedly while reading chunks from stream. $e"
        ..code = UploadStatusCode.Failed;
    }

    await sink.close();

    final localFileSize = file.lengthSync();

    print("Written ${localFileSize} bytes in ${path}");

    // Server-Sided file size check.
    if (localFileSize > 5e9) {
      await remove(fileName);
      print("Deleted ${path}. File is too big.");
    } else if (localFileSize != fileSize) {
      print("Deleted ${path}. File received does not correspond to received"
          " metadata. File : $localFileSize != Metadata : $fileSize");
    }
    return UploadStatus()
      ..message = "Upload received with success."
      ..code = UploadStatusCode.Ok;
  }
}
