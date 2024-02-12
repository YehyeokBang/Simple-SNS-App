//
//  Generated code. Do not modify.
//  source: lib/api/v1/post/post.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use postSummaryDescriptor instead')
const PostSummary$json = {
  '1': 'PostSummary',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 13, '10': 'id'},
    {'1': 'user_name', '3': 2, '4': 1, '5': 9, '10': 'userName'},
    {'1': 'title', '3': 3, '4': 1, '5': 9, '10': 'title'},
    {'1': 'comment_count', '3': 4, '4': 1, '5': 13, '10': 'commentCount'},
    {'1': 'created_at', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    {'1': 'updated_at', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updatedAt'},
  ],
};

/// Descriptor for `PostSummary`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List postSummaryDescriptor = $convert.base64Decode(
    'CgtQb3N0U3VtbWFyeRIOCgJpZBgBIAEoDVICaWQSGwoJdXNlcl9uYW1lGAIgASgJUgh1c2VyTm'
    'FtZRIUCgV0aXRsZRgDIAEoCVIFdGl0bGUSIwoNY29tbWVudF9jb3VudBgEIAEoDVIMY29tbWVu'
    'dENvdW50EjkKCmNyZWF0ZWRfYXQYBSABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUg'
    'ljcmVhdGVkQXQSOQoKdXBkYXRlZF9hdBgGIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3Rh'
    'bXBSCXVwZGF0ZWRBdA==');

@$core.Deprecated('Use postDescriptor instead')
const Post$json = {
  '1': 'Post',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 13, '10': 'id'},
    {'1': 'user_name', '3': 2, '4': 1, '5': 9, '10': 'userName'},
    {'1': 'title', '3': 3, '4': 1, '5': 9, '10': 'title'},
    {'1': 'content', '3': 4, '4': 1, '5': 9, '10': 'content'},
    {'1': 'comments', '3': 5, '4': 3, '5': 11, '6': '.v1.post.Comment', '10': 'comments'},
    {'1': 'created_at', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    {'1': 'updated_at', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updatedAt'},
  ],
};

/// Descriptor for `Post`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List postDescriptor = $convert.base64Decode(
    'CgRQb3N0Eg4KAmlkGAEgASgNUgJpZBIbCgl1c2VyX25hbWUYAiABKAlSCHVzZXJOYW1lEhQKBX'
    'RpdGxlGAMgASgJUgV0aXRsZRIYCgdjb250ZW50GAQgASgJUgdjb250ZW50EiwKCGNvbW1lbnRz'
    'GAUgAygLMhAudjEucG9zdC5Db21tZW50Ughjb21tZW50cxI5CgpjcmVhdGVkX2F0GAYgASgLMh'
    'ouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJY3JlYXRlZEF0EjkKCnVwZGF0ZWRfYXQYByAB'
    'KAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgl1cGRhdGVkQXQ=');

@$core.Deprecated('Use commentDescriptor instead')
const Comment$json = {
  '1': 'Comment',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 13, '10': 'id'},
    {'1': 'post_id', '3': 2, '4': 1, '5': 13, '10': 'postId'},
    {'1': 'has_parent', '3': 3, '4': 1, '5': 8, '10': 'hasParent'},
    {'1': 'parent_id', '3': 4, '4': 1, '5': 13, '10': 'parentId'},
    {'1': 'user_id', '3': 5, '4': 1, '5': 13, '10': 'userId'},
    {'1': 'user_name', '3': 6, '4': 1, '5': 9, '10': 'userName'},
    {'1': 'content', '3': 7, '4': 1, '5': 9, '10': 'content'},
    {'1': 'created_at', '3': 8, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    {'1': 'updated_at', '3': 9, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updatedAt'},
  ],
};

/// Descriptor for `Comment`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List commentDescriptor = $convert.base64Decode(
    'CgdDb21tZW50Eg4KAmlkGAEgASgNUgJpZBIXCgdwb3N0X2lkGAIgASgNUgZwb3N0SWQSHQoKaG'
    'FzX3BhcmVudBgDIAEoCFIJaGFzUGFyZW50EhsKCXBhcmVudF9pZBgEIAEoDVIIcGFyZW50SWQS'
    'FwoHdXNlcl9pZBgFIAEoDVIGdXNlcklkEhsKCXVzZXJfbmFtZRgGIAEoCVIIdXNlck5hbWUSGA'
    'oHY29udGVudBgHIAEoCVIHY29udGVudBI5CgpjcmVhdGVkX2F0GAggASgLMhouZ29vZ2xlLnBy'
    'b3RvYnVmLlRpbWVzdGFtcFIJY3JlYXRlZEF0EjkKCnVwZGF0ZWRfYXQYCSABKAsyGi5nb29nbG'
    'UucHJvdG9idWYuVGltZXN0YW1wUgl1cGRhdGVkQXQ=');

@$core.Deprecated('Use writePostRequestDescriptor instead')
const WritePostRequest$json = {
  '1': 'WritePostRequest',
  '2': [
    {'1': 'title', '3': 1, '4': 1, '5': 9, '10': 'title'},
    {'1': 'content', '3': 2, '4': 1, '5': 9, '10': 'content'},
  ],
};

/// Descriptor for `WritePostRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List writePostRequestDescriptor = $convert.base64Decode(
    'ChBXcml0ZVBvc3RSZXF1ZXN0EhQKBXRpdGxlGAEgASgJUgV0aXRsZRIYCgdjb250ZW50GAIgAS'
    'gJUgdjb250ZW50');

@$core.Deprecated('Use writePostResponseDescriptor instead')
const WritePostResponse$json = {
  '1': 'WritePostResponse',
  '2': [
    {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `WritePostResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List writePostResponseDescriptor = $convert.base64Decode(
    'ChFXcml0ZVBvc3RSZXNwb25zZRIYCgdtZXNzYWdlGAEgASgJUgdtZXNzYWdl');

@$core.Deprecated('Use getPostsRequestDescriptor instead')
const GetPostsRequest$json = {
  '1': 'GetPostsRequest',
  '2': [
    {'1': 'page', '3': 1, '4': 1, '5': 13, '10': 'page'},
    {'1': 'limit', '3': 2, '4': 1, '5': 13, '10': 'limit'},
  ],
};

/// Descriptor for `GetPostsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPostsRequestDescriptor = $convert.base64Decode(
    'Cg9HZXRQb3N0c1JlcXVlc3QSEgoEcGFnZRgBIAEoDVIEcGFnZRIUCgVsaW1pdBgCIAEoDVIFbG'
    'ltaXQ=');

@$core.Deprecated('Use getPostsResponseDescriptor instead')
const GetPostsResponse$json = {
  '1': 'GetPostsResponse',
  '2': [
    {'1': 'post_summaries', '3': 1, '4': 3, '5': 11, '6': '.v1.post.PostSummary', '10': 'postSummaries'},
  ],
};

/// Descriptor for `GetPostsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPostsResponseDescriptor = $convert.base64Decode(
    'ChBHZXRQb3N0c1Jlc3BvbnNlEjsKDnBvc3Rfc3VtbWFyaWVzGAEgAygLMhQudjEucG9zdC5Qb3'
    'N0U3VtbWFyeVINcG9zdFN1bW1hcmllcw==');

@$core.Deprecated('Use searchPostsRequestDescriptor instead')
const SearchPostsRequest$json = {
  '1': 'SearchPostsRequest',
  '2': [
    {'1': 'keyword', '3': 1, '4': 1, '5': 9, '10': 'keyword'},
    {'1': 'page', '3': 2, '4': 1, '5': 13, '10': 'page'},
    {'1': 'limit', '3': 3, '4': 1, '5': 13, '10': 'limit'},
  ],
};

/// Descriptor for `SearchPostsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List searchPostsRequestDescriptor = $convert.base64Decode(
    'ChJTZWFyY2hQb3N0c1JlcXVlc3QSGAoHa2V5d29yZBgBIAEoCVIHa2V5d29yZBISCgRwYWdlGA'
    'IgASgNUgRwYWdlEhQKBWxpbWl0GAMgASgNUgVsaW1pdA==');

@$core.Deprecated('Use getPostByIdRequestDescriptor instead')
const GetPostByIdRequest$json = {
  '1': 'GetPostByIdRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 13, '10': 'id'},
  ],
};

/// Descriptor for `GetPostByIdRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPostByIdRequestDescriptor = $convert.base64Decode(
    'ChJHZXRQb3N0QnlJZFJlcXVlc3QSDgoCaWQYASABKA1SAmlk');

@$core.Deprecated('Use getPostByIdResponseDescriptor instead')
const GetPostByIdResponse$json = {
  '1': 'GetPostByIdResponse',
  '2': [
    {'1': 'post', '3': 1, '4': 1, '5': 11, '6': '.v1.post.Post', '10': 'post'},
  ],
};

/// Descriptor for `GetPostByIdResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPostByIdResponseDescriptor = $convert.base64Decode(
    'ChNHZXRQb3N0QnlJZFJlc3BvbnNlEiEKBHBvc3QYASABKAsyDS52MS5wb3N0LlBvc3RSBHBvc3'
    'Q=');

@$core.Deprecated('Use updatePostRequestDescriptor instead')
const UpdatePostRequest$json = {
  '1': 'UpdatePostRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 13, '10': 'id'},
    {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    {'1': 'content', '3': 3, '4': 1, '5': 9, '10': 'content'},
  ],
};

/// Descriptor for `UpdatePostRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updatePostRequestDescriptor = $convert.base64Decode(
    'ChFVcGRhdGVQb3N0UmVxdWVzdBIOCgJpZBgBIAEoDVICaWQSFAoFdGl0bGUYAiABKAlSBXRpdG'
    'xlEhgKB2NvbnRlbnQYAyABKAlSB2NvbnRlbnQ=');

@$core.Deprecated('Use updatePostResponseDescriptor instead')
const UpdatePostResponse$json = {
  '1': 'UpdatePostResponse',
  '2': [
    {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `UpdatePostResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updatePostResponseDescriptor = $convert.base64Decode(
    'ChJVcGRhdGVQb3N0UmVzcG9uc2USGAoHbWVzc2FnZRgBIAEoCVIHbWVzc2FnZQ==');

@$core.Deprecated('Use deletePostRequestDescriptor instead')
const DeletePostRequest$json = {
  '1': 'DeletePostRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 13, '10': 'id'},
  ],
};

/// Descriptor for `DeletePostRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deletePostRequestDescriptor = $convert.base64Decode(
    'ChFEZWxldGVQb3N0UmVxdWVzdBIOCgJpZBgBIAEoDVICaWQ=');

@$core.Deprecated('Use deletePostResponseDescriptor instead')
const DeletePostResponse$json = {
  '1': 'DeletePostResponse',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 8, '10': 'status'},
  ],
};

/// Descriptor for `DeletePostResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deletePostResponseDescriptor = $convert.base64Decode(
    'ChJEZWxldGVQb3N0UmVzcG9uc2USFgoGc3RhdHVzGAEgASgIUgZzdGF0dXM=');

