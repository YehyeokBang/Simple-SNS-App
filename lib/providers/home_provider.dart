import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:grpc/grpc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_sns_app/api/v1/post/post.pb.dart';
import 'package:simple_sns_app/api/v1/post/post.pbgrpc.dart';

class HomeProvider {
  Future<GetPostsResponse> getPosts(int page, int limit) async {
    final channel = ClientChannel(
      dotenv.env['API_SERVER']!,
      port: int.parse(dotenv.env['PORT']!),
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    final client = PostServiceClient(channel);

    final request = GetPostsRequest()
      ..page = page
      ..limit = limit;

    try {
      final token = await SharedPreferences.getInstance().then((prefs) {
        return prefs.getString('token');
      });

      final metadata = {
        'authorization': 'Bearer $token',
      };
      final callOptions = CallOptions(metadata: metadata);

      final response = await client.getPosts(request, options: callOptions);

      await channel.shutdown();

      return response;
    } catch (error) {
      log('포스트 불러오기 중 오류 발생: $error');
      rethrow;
    }
  }
}
