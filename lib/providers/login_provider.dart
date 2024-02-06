import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:grpc/grpc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_sns_app/api/v1/user/user.pb.dart';
import 'package:simple_sns_app/api/v1/user/user.pbgrpc.dart';

class LoginProvider {
  Future<LogInResponse> login(String userId, String password) async {
    final channel = ClientChannel(
      dotenv.env['API_SERVER']!,
      port: int.parse(dotenv.env['PORT']!),
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    final stub = UserServiceClient(channel);

    final request = LogInRequest()
      ..userId = userId
      ..password = password;

    try {
      final response = await stub.logIn(request);
      // 시큐어 스토리지에 토큰 저장
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', response.jwtToken);
      await channel.shutdown();
      return response;
    } catch (e) {
      await channel.shutdown();
      rethrow;
    }
  }
}
