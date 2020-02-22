///
//  Generated code. Do not modify.
//  source: grpc_file_transfer.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const UploadStatusCode$json = const {
  '1': 'UploadStatusCode',
  '2': const [
    const {'1': 'Unknown', '2': 0},
    const {'1': 'Ok', '2': 1},
    const {'1': 'Failed', '2': 2},
  ],
};

const Chunk$json = const {
  '1': 'Chunk',
  '2': const [
    const {'1': 'data', '3': 1, '4': 1, '5': 12, '10': 'data'},
  ],
};

const Metadata$json = const {
  '1': 'Metadata',
  '2': const [
    const {'1': 'auth', '3': 1, '4': 1, '5': 9, '10': 'auth'},
    const {'1': 'file_name', '3': 2, '4': 1, '5': 9, '10': 'fileName'},
    const {'1': 'file_size', '3': 3, '4': 1, '5': 5, '10': 'fileSize'},
  ],
};

const PutRequest$json = const {
  '1': 'PutRequest',
  '2': const [
    const {'1': 'metadata', '3': 1, '4': 1, '5': 11, '6': '.grpcfiletransfert.Metadata', '9': 0, '10': 'metadata'},
    const {'1': 'chunk', '3': 2, '4': 1, '5': 11, '6': '.grpcfiletransfert.Chunk', '9': 0, '10': 'chunk'},
  ],
  '8': const [
    const {'1': 'value'},
  ],
};

const UploadStatus$json = const {
  '1': 'UploadStatus',
  '2': const [
    const {'1': 'Message', '3': 1, '4': 1, '5': 9, '10': 'Message'},
    const {'1': 'Code', '3': 2, '4': 1, '5': 14, '6': '.grpcfiletransfert.UploadStatusCode', '10': 'Code'},
  ],
};

