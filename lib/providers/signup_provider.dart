import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:grpc/grpc.dart';
import 'package:simple_sns_app/api/v1/user/user.pb.dart';
import 'package:simple_sns_app/api/v1/user/user.pbgrpc.dart';
import 'package:simple_sns_app/google/protobuf/timestamp.pb.dart';

class SignUpProvider {
  Future<SignUpResponse> signUpUser({
    required String userId,
    required String password,
    required String name,
    required int age,
    required String sex,
    required String birthday,
    required String introduce,
  }) async {
    final channel = ClientChannel(
      dotenv.env['API_SERVER']!,
      port: int.parse(dotenv.env['PORT']!),
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    final client = UserServiceClient(channel);

    final request = SignUpRequest()
      ..userId = userId
      ..password = password
      ..name = name
      ..age = age
      ..sex = sex
      ..birthday = Timestamp.fromDateTime(DateTime.parse(birthday))
      ..introduce = introduce;

    try {
      final response = await client.signUp(request);
      await channel.shutdown();
      return response;
    } catch (error) {
      log('회원 가입 중 오류 발생: $error');
      rethrow;
    }
  }
}
