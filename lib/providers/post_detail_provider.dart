import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:grpc/grpc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_sns_app/api/v1/post/post.pb.dart';
import 'package:simple_sns_app/api/v1/post/post.pbgrpc.dart';

class PostDetailProvider {
  Future<Post> getPostById(int postId) async {
    final channel = ClientChannel(
      dotenv.env['API_SERVER']!,
      port: int.parse(dotenv.env['PORT']!),
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    final client = PostServiceClient(channel);

    final request = GetPostByIdRequest()..id = postId;

    try {
      final token = await SharedPreferences.getInstance().then((prefs) {
        return prefs.getString('token');
      });

      final metadata = {
        'authorization': 'Bearer $token',
      };
      final callOptions = CallOptions(metadata: metadata);

      final response = await client.getPostById(request, options: callOptions);

      await channel.shutdown();

      return response.post;
    } catch (error) {
      log('포스트 디테일 불러오기 중 오류 발생: $error');
      rethrow;
    }
  }
}
