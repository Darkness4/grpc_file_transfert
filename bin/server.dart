import 'package:grpc_file_transfer/src/server.dart';

Future<void> main(List<String> args) async {
  await Server().main(args);
}
