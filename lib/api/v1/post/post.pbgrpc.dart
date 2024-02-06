//
//  Generated code. Do not modify.
//  source: lib/api/v1/post/post.proto
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

import 'post.pb.dart' as $0;

export 'post.pb.dart';

@$pb.GrpcServiceName('v1.post.PostService')
class PostServiceClient extends $grpc.Client {
  static final _$writePost = $grpc.ClientMethod<$0.WritePostRequest, $0.WritePostResponse>(
      '/v1.post.PostService/WritePost',
      ($0.WritePostRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.WritePostResponse.fromBuffer(value));
  static final _$getPosts = $grpc.ClientMethod<$0.GetPostsRequest, $0.GetPostsResponse>(
      '/v1.post.PostService/GetPosts',
      ($0.GetPostsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetPostsResponse.fromBuffer(value));
  static final _$getPostById = $grpc.ClientMethod<$0.GetPostByIdRequest, $0.GetPostByIdResponse>(
      '/v1.post.PostService/GetPostById',
      ($0.GetPostByIdRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetPostByIdResponse.fromBuffer(value));
  static final _$updatePost = $grpc.ClientMethod<$0.UpdatePostRequest, $0.UpdatePostResponse>(
      '/v1.post.PostService/UpdatePost',
      ($0.UpdatePostRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.UpdatePostResponse.fromBuffer(value));
  static final _$deletePost = $grpc.ClientMethod<$0.DeletePostRequest, $0.DeletePostResponse>(
      '/v1.post.PostService/DeletePost',
      ($0.DeletePostRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.DeletePostResponse.fromBuffer(value));

  PostServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.WritePostResponse> writePost($0.WritePostRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$writePost, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetPostsResponse> getPosts($0.GetPostsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getPosts, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetPostByIdResponse> getPostById($0.GetPostByIdRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getPostById, request, options: options);
  }

  $grpc.ResponseFuture<$0.UpdatePostResponse> updatePost($0.UpdatePostRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updatePost, request, options: options);
  }

  $grpc.ResponseFuture<$0.DeletePostResponse> deletePost($0.DeletePostRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$deletePost, request, options: options);
  }
}

@$pb.GrpcServiceName('v1.post.PostService')
abstract class PostServiceBase extends $grpc.Service {
  $core.String get $name => 'v1.post.PostService';

  PostServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.WritePostRequest, $0.WritePostResponse>(
        'WritePost',
        writePost_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.WritePostRequest.fromBuffer(value),
        ($0.WritePostResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetPostsRequest, $0.GetPostsResponse>(
        'GetPosts',
        getPosts_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetPostsRequest.fromBuffer(value),
        ($0.GetPostsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetPostByIdRequest, $0.GetPostByIdResponse>(
        'GetPostById',
        getPostById_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetPostByIdRequest.fromBuffer(value),
        ($0.GetPostByIdResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdatePostRequest, $0.UpdatePostResponse>(
        'UpdatePost',
        updatePost_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UpdatePostRequest.fromBuffer(value),
        ($0.UpdatePostResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.DeletePostRequest, $0.DeletePostResponse>(
        'DeletePost',
        deletePost_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.DeletePostRequest.fromBuffer(value),
        ($0.DeletePostResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.WritePostResponse> writePost_Pre($grpc.ServiceCall call, $async.Future<$0.WritePostRequest> request) async {
    return writePost(call, await request);
  }

  $async.Future<$0.GetPostsResponse> getPosts_Pre($grpc.ServiceCall call, $async.Future<$0.GetPostsRequest> request) async {
    return getPosts(call, await request);
  }

  $async.Future<$0.GetPostByIdResponse> getPostById_Pre($grpc.ServiceCall call, $async.Future<$0.GetPostByIdRequest> request) async {
    return getPostById(call, await request);
  }

  $async.Future<$0.UpdatePostResponse> updatePost_Pre($grpc.ServiceCall call, $async.Future<$0.UpdatePostRequest> request) async {
    return updatePost(call, await request);
  }

  $async.Future<$0.DeletePostResponse> deletePost_Pre($grpc.ServiceCall call, $async.Future<$0.DeletePostRequest> request) async {
    return deletePost(call, await request);
  }

  $async.Future<$0.WritePostResponse> writePost($grpc.ServiceCall call, $0.WritePostRequest request);
  $async.Future<$0.GetPostsResponse> getPosts($grpc.ServiceCall call, $0.GetPostsRequest request);
  $async.Future<$0.GetPostByIdResponse> getPostById($grpc.ServiceCall call, $0.GetPostByIdRequest request);
  $async.Future<$0.UpdatePostResponse> updatePost($grpc.ServiceCall call, $0.UpdatePostRequest request);
  $async.Future<$0.DeletePostResponse> deletePost($grpc.ServiceCall call, $0.DeletePostRequest request);
}
