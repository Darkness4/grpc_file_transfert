import 'dart:io';

import 'package:grpc_file_transfer/src/client.dart';

Future<void> main(List<String> args) async {
  await Client().main(args);
  exit(0);
}
