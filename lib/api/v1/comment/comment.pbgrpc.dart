//
//  Generated code. Do not modify.
//  source: lib/api/v1/comment/comment.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'comment.pb.dart' as $0;

export 'comment.pb.dart';

@$pb.GrpcServiceName('v1.comment.CommentService')
class CommentServiceClient extends $grpc.Client {
  static final _$writeComment = $grpc.ClientMethod<$0.WriteCommentRequest, $0.WriteCommentResponse>(
      '/v1.comment.CommentService/WriteComment',
      ($0.WriteCommentRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.WriteCommentResponse.fromBuffer(value));
  static final _$writeReply = $grpc.ClientMethod<$0.WriteReplyRequest, $0.WriteReplyResponse>(
      '/v1.comment.CommentService/WriteReply',
      ($0.WriteReplyRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.WriteReplyResponse.fromBuffer(value));
  static final _$updateComment = $grpc.ClientMethod<$0.UpdateCommentRequest, $0.UpdateCommentResponse>(
      '/v1.comment.CommentService/UpdateComment',
      ($0.UpdateCommentRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.UpdateCommentResponse.fromBuffer(value));
  static final _$deleteComment = $grpc.ClientMethod<$0.DeleteCommentRequest, $0.DeleteCommentResponse>(
      '/v1.comment.CommentService/DeleteComment',
      ($0.DeleteCommentRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.DeleteCommentResponse.fromBuffer(value));

  CommentServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.WriteCommentResponse> writeComment($0.WriteCommentRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$writeComment, request, options: options);
  }

  $grpc.ResponseFuture<$0.WriteReplyResponse> writeReply($0.WriteReplyRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$writeReply, request, options: options);
  }

  $grpc.ResponseFuture<$0.UpdateCommentResponse> updateComment($0.UpdateCommentRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateComment, request, options: options);
  }

  $grpc.ResponseFuture<$0.DeleteCommentResponse> deleteComment($0.DeleteCommentRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deleteComment, request, options: options);
  }
}

@$pb.GrpcServiceName('v1.comment.CommentService')
abstract class CommentServiceBase extends $grpc.Service {
  $core.String get $name => 'v1.comment.CommentService';

  CommentServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.WriteCommentRequest, $0.WriteCommentResponse>(
        'WriteComment',
        writeComment_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.WriteCommentRequest.fromBuffer(value),
        ($0.WriteCommentResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.WriteReplyRequest, $0.WriteReplyResponse>(
        'WriteReply',
        writeReply_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.WriteReplyRequest.fromBuffer(value),
        ($0.WriteReplyResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateCommentRequest, $0.UpdateCommentResponse>(
        'UpdateComment',
        updateComment_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UpdateCommentRequest.fromBuffer(value),
        ($0.UpdateCommentResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeleteCommentRequest, $0.DeleteCommentResponse>(
        'DeleteComment',
        deleteComment_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DeleteCommentRequest.fromBuffer(value),
        ($0.DeleteCommentResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.WriteCommentResponse> writeComment_Pre($grpc.ServiceCall call, $async.Future<$0.WriteCommentRequest> request) async {
    return writeComment(call, await request);
  }

  $async.Future<$0.WriteReplyResponse> writeReply_Pre($grpc.ServiceCall call, $async.Future<$0.WriteReplyRequest> request) async {
    return writeReply(call, await request);
  }

  $async.Future<$0.UpdateCommentResponse> updateComment_Pre($grpc.ServiceCall call, $async.Future<$0.UpdateCommentRequest> request) async {
    return updateComment(call, await request);
  }

  $async.Future<$0.DeleteCommentResponse> deleteComment_Pre($grpc.ServiceCall call, $async.Future<$0.DeleteCommentRequest> request) async {
    return deleteComment(call, await request);
  }

  $async.Future<$0.WriteCommentResponse> writeComment($grpc.ServiceCall call, $0.WriteCommentRequest request);
  $async.Future<$0.WriteReplyResponse> writeReply($grpc.ServiceCall call, $0.WriteReplyRequest request);
  $async.Future<$0.UpdateCommentResponse> updateComment($grpc.ServiceCall call, $0.UpdateCommentRequest request);
  $async.Future<$0.DeleteCommentResponse> deleteComment($grpc.ServiceCall call, $0.DeleteCommentRequest request);
}
