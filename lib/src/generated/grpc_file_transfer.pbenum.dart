///
//  Generated code. Do not modify.
//  source: grpc_file_transfer.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

// ignore_for_file: UNDEFINED_SHOWN_NAME,UNUSED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class UploadStatusCode extends $pb.ProtobufEnum {
  static const UploadStatusCode Unknown = UploadStatusCode._(0, 'Unknown');
  static const UploadStatusCode Ok = UploadStatusCode._(1, 'Ok');
  static const UploadStatusCode Failed = UploadStatusCode._(2, 'Failed');

  static const $core.List<UploadStatusCode> values = <UploadStatusCode> [
    Unknown,
    Ok,
    Failed,
  ];

  static final $core.Map<$core.int, UploadStatusCode> _byValue = $pb.ProtobufEnum.initByValue(values);
  static UploadStatusCode valueOf($core.int value) => _byValue[value];

  const UploadStatusCode._($core.int v, $core.String n) : super(v, n);
}

