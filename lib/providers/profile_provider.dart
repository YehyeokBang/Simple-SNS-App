import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:grpc/grpc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_sns_app/api/v1/user/user.pbgrpc.dart';

class ProfileProvider {
  late UserServiceClient _client;

  ProfileProvider() {
    final channel = ClientChannel(
      dotenv.env['API_SERVER']!,
      port: int.parse(dotenv.env['PORT']!),
      options: const ChannelOptions(
        credentials: ChannelCredentials.insecure(),
      ),
    );

    _client = UserServiceClient(channel);
  }

  Future<GetUserResponse> getUser() async {
    final request = GetUserRequest();

    // SharedPreferences에서 토큰을 가져옵니다.
    final token = await SharedPreferences.getInstance().then((prefs) {
      return prefs.getString('token');
    });

    // 토큰을 메타데이터에 포함시킵니다.
    final metadata = {
      'authorization': 'Bearer $token',
    };
    final callOptions = CallOptions(metadata: metadata);

    try {
      return await _client.getUser(request, options: callOptions);
    } catch (error) {
      log('사용자 정보를 가져오는 중 오류 발생: $error');
      rethrow;
    }
  }
}
