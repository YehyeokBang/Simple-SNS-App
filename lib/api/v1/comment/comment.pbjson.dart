//
//  Generated code. Do not modify.
//  source: lib/api/v1/comment/comment.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use commentDescriptor instead')
const Comment$json = {
  '1': 'Comment',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 13, '10': 'id'},
    {'1': 'post_id', '3': 2, '4': 1, '5': 13, '10': 'postId'},
    {'1': 'user_name', '3': 3, '4': 1, '5': 9, '10': 'userName'},
    {'1': 'content', '3': 4, '4': 1, '5': 9, '10': 'content'},
    {'1': 'created_at', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    {'1': 'updated_at', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updatedAt'},
  ],
};

/// Descriptor for `Comment`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List commentDescriptor = $convert.base64Decode(
    'CgdDb21tZW50Eg4KAmlkGAEgASgNUgJpZBIXCgdwb3N0X2lkGAIgASgNUgZwb3N0SWQSGwoJdX'
    'Nlcl9uYW1lGAMgASgJUgh1c2VyTmFtZRIYCgdjb250ZW50GAQgASgJUgdjb250ZW50EjkKCmNy'
    'ZWF0ZWRfYXQYBSABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgljcmVhdGVkQXQSOQ'
    'oKdXBkYXRlZF9hdBgGIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCXVwZGF0ZWRB'
    'dA==');

@$core.Deprecated('Use writeCommentRequestDescriptor instead')
const WriteCommentRequest$json = {
  '1': 'WriteCommentRequest',
  '2': [
    {'1': 'post_id', '3': 1, '4': 1, '5': 13, '10': 'postId'},
    {'1': 'content', '3': 2, '4': 1, '5': 9, '10': 'content'},
  ],
};

/// Descriptor for `WriteCommentRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List writeCommentRequestDescriptor = $convert.base64Decode(
    'ChNXcml0ZUNvbW1lbnRSZXF1ZXN0EhcKB3Bvc3RfaWQYASABKA1SBnBvc3RJZBIYCgdjb250ZW'
    '50GAIgASgJUgdjb250ZW50');

@$core.Deprecated('Use writeCommentResponseDescriptor instead')
const WriteCommentResponse$json = {
  '1': 'WriteCommentResponse',
  '2': [
    {'1': 'comment', '3': 1, '4': 1, '5': 11, '6': '.v1.comment.Comment', '10': 'comment'},
  ],
};

/// Descriptor for `WriteCommentResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List writeCommentResponseDescriptor = $convert.base64Decode(
    'ChRXcml0ZUNvbW1lbnRSZXNwb25zZRItCgdjb21tZW50GAEgASgLMhMudjEuY29tbWVudC5Db2'
    '1tZW50Ugdjb21tZW50');

@$core.Deprecated('Use writeReplyRequestDescriptor instead')
const WriteReplyRequest$json = {
  '1': 'WriteReplyRequest',
  '2': [
    {'1': 'post_id', '3': 1, '4': 1, '5': 13, '10': 'postId'},
    {'1': 'parent_comment_id', '3': 2, '4': 1, '5': 13, '10': 'parentCommentId'},
    {'1': 'content', '3': 3, '4': 1, '5': 9, '10': 'content'},
  ],
};

/// Descriptor for `WriteReplyRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List writeReplyRequestDescriptor = $convert.base64Decode(
    'ChFXcml0ZVJlcGx5UmVxdWVzdBIXCgdwb3N0X2lkGAEgASgNUgZwb3N0SWQSKgoRcGFyZW50X2'
    'NvbW1lbnRfaWQYAiABKA1SD3BhcmVudENvbW1lbnRJZBIYCgdjb250ZW50GAMgASgJUgdjb250'
    'ZW50');

@$core.Deprecated('Use writeReplyResponseDescriptor instead')
const WriteReplyResponse$json = {
  '1': 'WriteReplyResponse',
  '2': [
    {'1': 'reply', '3': 1, '4': 1, '5': 11, '6': '.v1.comment.Comment', '10': 'reply'},
  ],
};

/// Descriptor for `WriteReplyResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List writeReplyResponseDescriptor = $convert.base64Decode(
    'ChJXcml0ZVJlcGx5UmVzcG9uc2USKQoFcmVwbHkYASABKAsyEy52MS5jb21tZW50LkNvbW1lbn'
    'RSBXJlcGx5');

@$core.Deprecated('Use updateCommentRequestDescriptor instead')
const UpdateCommentRequest$json = {
  '1': 'UpdateCommentRequest',
  '2': [
    {'1': 'comment_id', '3': 1, '4': 1, '5': 13, '10': 'commentId'},
    {'1': 'content', '3': 2, '4': 1, '5': 9, '10': 'content'},
  ],
};

/// Descriptor for `UpdateCommentRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateCommentRequestDescriptor = $convert.base64Decode(
    'ChRVcGRhdGVDb21tZW50UmVxdWVzdBIdCgpjb21tZW50X2lkGAEgASgNUgljb21tZW50SWQSGA'
    'oHY29udGVudBgCIAEoCVIHY29udGVudA==');

@$core.Deprecated('Use updateCommentResponseDescriptor instead')
const UpdateCommentResponse$json = {
  '1': 'UpdateCommentResponse',
  '2': [
    {'1': 'comment', '3': 1, '4': 1, '5': 11, '6': '.v1.comment.Comment', '10': 'comment'},
  ],
};

/// Descriptor for `UpdateCommentResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateCommentResponseDescriptor = $convert.base64Decode(
    'ChVVcGRhdGVDb21tZW50UmVzcG9uc2USLQoHY29tbWVudBgBIAEoCzITLnYxLmNvbW1lbnQuQ2'
    '9tbWVudFIHY29tbWVudA==');

@$core.Deprecated('Use deleteCommentRequestDescriptor instead')
const DeleteCommentRequest$json = {
  '1': 'DeleteCommentRequest',
  '2': [
    {'1': 'comment_id', '3': 1, '4': 1, '5': 13, '10': 'commentId'},
  ],
};

/// Descriptor for `DeleteCommentRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteCommentRequestDescriptor = $convert.base64Decode(
    'ChREZWxldGVDb21tZW50UmVxdWVzdBIdCgpjb21tZW50X2lkGAEgASgNUgljb21tZW50SWQ=');

@$core.Deprecated('Use deleteCommentResponseDescriptor instead')
const DeleteCommentResponse$json = {
  '1': 'DeleteCommentResponse',
  '2': [
    {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `DeleteCommentResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteCommentResponseDescriptor = $convert.base64Decode(
    'ChVEZWxldGVDb21tZW50UmVzcG9uc2USGAoHbWVzc2FnZRgBIAEoCVIHbWVzc2FnZQ==');

