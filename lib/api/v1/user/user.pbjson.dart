//
//  Generated code. Do not modify.
//  source: lib/api/v1/user/user.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use signUpRequestDescriptor instead')
const SignUpRequest$json = {
  '1': 'SignUpRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    {'1': 'age', '3': 4, '4': 1, '5': 13, '10': 'age'},
    {'1': 'sex', '3': 5, '4': 1, '5': 9, '10': 'sex'},
    {'1': 'birthday', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'birthday'},
    {'1': 'introduce', '3': 7, '4': 1, '5': 9, '10': 'introduce'},
  ],
};

/// Descriptor for `SignUpRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signUpRequestDescriptor = $convert.base64Decode(
    'Cg1TaWduVXBSZXF1ZXN0EhcKB3VzZXJfaWQYASABKAlSBnVzZXJJZBIaCghwYXNzd29yZBgCIA'
    'EoCVIIcGFzc3dvcmQSEgoEbmFtZRgDIAEoCVIEbmFtZRIQCgNhZ2UYBCABKA1SA2FnZRIQCgNz'
    'ZXgYBSABKAlSA3NleBI2CghiaXJ0aGRheRgGIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3'
    'RhbXBSCGJpcnRoZGF5EhwKCWludHJvZHVjZRgHIAEoCVIJaW50cm9kdWNl');

@$core.Deprecated('Use signUpResponseDescriptor instead')
const SignUpResponse$json = {
  '1': 'SignUpResponse',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
  ],
};

/// Descriptor for `SignUpResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List signUpResponseDescriptor = $convert.base64Decode(
    'Cg5TaWduVXBSZXNwb25zZRIXCgd1c2VyX2lkGAEgASgJUgZ1c2VySWQ=');

@$core.Deprecated('Use logInRequestDescriptor instead')
const LogInRequest$json = {
  '1': 'LogInRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `LogInRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List logInRequestDescriptor = $convert.base64Decode(
    'CgxMb2dJblJlcXVlc3QSFwoHdXNlcl9pZBgBIAEoCVIGdXNlcklkEhoKCHBhc3N3b3JkGAIgAS'
    'gJUghwYXNzd29yZA==');

@$core.Deprecated('Use logInResponseDescriptor instead')
const LogInResponse$json = {
  '1': 'LogInResponse',
  '2': [
    {'1': 'jwt_token', '3': 1, '4': 1, '5': 9, '10': 'jwtToken'},
  ],
};

/// Descriptor for `LogInResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List logInResponseDescriptor = $convert.base64Decode(
    'Cg1Mb2dJblJlc3BvbnNlEhsKCWp3dF90b2tlbhgBIAEoCVIIand0VG9rZW4=');

@$core.Deprecated('Use getUserRequestDescriptor instead')
const GetUserRequest$json = {
  '1': 'GetUserRequest',
};

/// Descriptor for `GetUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserRequestDescriptor = $convert.base64Decode(
    'Cg5HZXRVc2VyUmVxdWVzdA==');

@$core.Deprecated('Use getUserResponseDescriptor instead')
const GetUserResponse$json = {
  '1': 'GetUserResponse',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'age', '3': 3, '4': 1, '5': 13, '10': 'age'},
    {'1': 'sex', '3': 4, '4': 1, '5': 9, '10': 'sex'},
    {'1': 'birthday', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'birthday'},
    {'1': 'introduce', '3': 6, '4': 1, '5': 9, '10': 'introduce'},
  ],
};

/// Descriptor for `GetUserResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserResponseDescriptor = $convert.base64Decode(
    'Cg9HZXRVc2VyUmVzcG9uc2USFwoHdXNlcl9pZBgBIAEoCVIGdXNlcklkEhIKBG5hbWUYAiABKA'
    'lSBG5hbWUSEAoDYWdlGAMgASgNUgNhZ2USEAoDc2V4GAQgASgJUgNzZXgSNgoIYmlydGhkYXkY'
    'BSABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUghiaXJ0aGRheRIcCglpbnRyb2R1Y2'
    'UYBiABKAlSCWludHJvZHVjZQ==');

