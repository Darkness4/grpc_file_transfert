///
//  Generated code. Do not modify.
//  source: grpc_file_transfer.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'grpc_file_transfer.pbenum.dart';

export 'grpc_file_transfer.pbenum.dart';

class Chunk extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Chunk', package: const $pb.PackageName('grpcfiletransfert'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, 'data', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  Chunk._() : super();
  factory Chunk() => create();
  factory Chunk.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Chunk.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Chunk clone() => Chunk()..mergeFromMessage(this);
  Chunk copyWith(void Function(Chunk) updates) => super.copyWith((message) => updates(message as Chunk));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Chunk create() => Chunk._();
  Chunk createEmptyInstance() => create();
  static $pb.PbList<Chunk> createRepeated() => $pb.PbList<Chunk>();
  @$core.pragma('dart2js:noInline')
  static Chunk getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Chunk>(create);
  static Chunk _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get data => $_getN(0);
  @$pb.TagNumber(1)
  set data($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasData() => $_has(0);
  @$pb.TagNumber(1)
  void clearData() => clearField(1);
}

class Metadata extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Metadata', package: const $pb.PackageName('grpcfiletransfert'), createEmptyInstance: create)
    ..aOS(1, 'auth')
    ..aOS(2, 'fileName')
    ..a<$core.int>(3, 'fileSize', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  Metadata._() : super();
  factory Metadata() => create();
  factory Metadata.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Metadata.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Metadata clone() => Metadata()..mergeFromMessage(this);
  Metadata copyWith(void Function(Metadata) updates) => super.copyWith((message) => updates(message as Metadata));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Metadata create() => Metadata._();
  Metadata createEmptyInstance() => create();
  static $pb.PbList<Metadata> createRepeated() => $pb.PbList<Metadata>();
  @$core.pragma('dart2js:noInline')
  static Metadata getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Metadata>(create);
  static Metadata _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get auth => $_getSZ(0);
  @$pb.TagNumber(1)
  set auth($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAuth() => $_has(0);
  @$pb.TagNumber(1)
  void clearAuth() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get fileName => $_getSZ(1);
  @$pb.TagNumber(2)
  set fileName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFileName() => $_has(1);
  @$pb.TagNumber(2)
  void clearFileName() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get fileSize => $_getIZ(2);
  @$pb.TagNumber(3)
  set fileSize($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasFileSize() => $_has(2);
  @$pb.TagNumber(3)
  void clearFileSize() => clearField(3);
}

enum PutRequest_Value {
  metadata, 
  chunk, 
  notSet
}

class PutRequest extends $pb.GeneratedMessage {
  static const $core.Map<$core.int, PutRequest_Value> _PutRequest_ValueByTag = {
    1 : PutRequest_Value.metadata,
    2 : PutRequest_Value.chunk,
    0 : PutRequest_Value.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('PutRequest', package: const $pb.PackageName('grpcfiletransfert'), createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOM<Metadata>(1, 'metadata', subBuilder: Metadata.create)
    ..aOM<Chunk>(2, 'chunk', subBuilder: Chunk.create)
    ..hasRequiredFields = false
  ;

  PutRequest._() : super();
  factory PutRequest() => create();
  factory PutRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PutRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  PutRequest clone() => PutRequest()..mergeFromMessage(this);
  PutRequest copyWith(void Function(PutRequest) updates) => super.copyWith((message) => updates(message as PutRequest));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PutRequest create() => PutRequest._();
  PutRequest createEmptyInstance() => create();
  static $pb.PbList<PutRequest> createRepeated() => $pb.PbList<PutRequest>();
  @$core.pragma('dart2js:noInline')
  static PutRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PutRequest>(create);
  static PutRequest _defaultInstance;

  PutRequest_Value whichValue() => _PutRequest_ValueByTag[$_whichOneof(0)];
  void clearValue() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  Metadata get metadata => $_getN(0);
  @$pb.TagNumber(1)
  set metadata(Metadata v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasMetadata() => $_has(0);
  @$pb.TagNumber(1)
  void clearMetadata() => clearField(1);
  @$pb.TagNumber(1)
  Metadata ensureMetadata() => $_ensure(0);

  @$pb.TagNumber(2)
  Chunk get chunk => $_getN(1);
  @$pb.TagNumber(2)
  set chunk(Chunk v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasChunk() => $_has(1);
  @$pb.TagNumber(2)
  void clearChunk() => clearField(2);
  @$pb.TagNumber(2)
  Chunk ensureChunk() => $_ensure(1);
}

class UploadStatus extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('UploadStatus', package: const $pb.PackageName('grpcfiletransfert'), createEmptyInstance: create)
    ..aOS(1, 'Message', protoName: 'Message')
    ..e<UploadStatusCode>(2, 'Code', $pb.PbFieldType.OE, protoName: 'Code', defaultOrMaker: UploadStatusCode.Unknown, valueOf: UploadStatusCode.valueOf, enumValues: UploadStatusCode.values)
    ..hasRequiredFields = false
  ;

  UploadStatus._() : super();
  factory UploadStatus() => create();
  factory UploadStatus.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UploadStatus.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  UploadStatus clone() => UploadStatus()..mergeFromMessage(this);
  UploadStatus copyWith(void Function(UploadStatus) updates) => super.copyWith((message) => updates(message as UploadStatus));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static UploadStatus create() => UploadStatus._();
  UploadStatus createEmptyInstance() => create();
  static $pb.PbList<UploadStatus> createRepeated() => $pb.PbList<UploadStatus>();
  @$core.pragma('dart2js:noInline')
  static UploadStatus getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UploadStatus>(create);
  static UploadStatus _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get message => $_getSZ(0);
  @$pb.TagNumber(1)
  set message($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => clearField(1);

  @$pb.TagNumber(2)
  UploadStatusCode get code => $_getN(1);
  @$pb.TagNumber(2)
  set code(UploadStatusCode v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearCode() => clearField(2);
}

