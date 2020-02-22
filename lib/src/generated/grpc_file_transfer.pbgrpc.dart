///
//  Generated code. Do not modify.
//  source: grpc_file_transfer.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'grpc_file_transfer.pb.dart' as $0;
export 'grpc_file_transfer.pb.dart';

class GrpcFileTransferClient extends $grpc.Client {
  static final _$upload = $grpc.ClientMethod<$0.PutRequest, $0.UploadStatus>(
      '/grpcfiletransfert.GrpcFileTransfer/Upload',
      ($0.PutRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.UploadStatus.fromBuffer(value));

  GrpcFileTransferClient($grpc.ClientChannel channel,
      {$grpc.CallOptions options})
      : super(channel, options: options);

  $grpc.ResponseFuture<$0.UploadStatus> upload(
      $async.Stream<$0.PutRequest> request,
      {$grpc.CallOptions options}) {
    final call = $createCall(_$upload, request, options: options);
    return $grpc.ResponseFuture(call);
  }
}

abstract class GrpcFileTransferServiceBase extends $grpc.Service {
  $core.String get $name => 'grpcfiletransfert.GrpcFileTransfer';

  GrpcFileTransferServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.PutRequest, $0.UploadStatus>(
        'Upload',
        upload,
        true,
        false,
        ($core.List<$core.int> value) => $0.PutRequest.fromBuffer(value),
        ($0.UploadStatus value) => value.writeToBuffer()));
  }

  $async.Future<$0.UploadStatus> upload(
      $grpc.ServiceCall call, $async.Stream<$0.PutRequest> request);
}
