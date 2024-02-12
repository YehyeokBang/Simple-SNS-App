import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:grpc/grpc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:simple_sns_app/api/v1/post/post.pbgrpc.dart';

class PostSearchProvider {
  Future<GetPostsResponse> searchPostsByTitle(String keyword) async {
    final channel = ClientChannel(
      dotenv.env['API_SERVER']!,
      port: int.parse(dotenv.env['PORT']!),
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    final stub = PostServiceClient(channel);

    final request = SearchPostsRequest();
    request.keyword = keyword;

    try {
      final token = await SharedPreferences.getInstance().then((prefs) {
        return prefs.getString('token');
      });

      final metadata = {
        'authorization': 'Bearer $token',
      };
      final callOptions = CallOptions(metadata: metadata);

      final response =
          await stub.searchPostsByTitle(request, options: callOptions);

      await channel.shutdown();

      return response;
    } catch (error) {
      log('포스트 검색 중 오류 발생: $error');
      rethrow;
    }
  }

  Future<GetPostsResponse> searchPostsByWriter(String keyword) async {
    final channel = ClientChannel(
      dotenv.env['API_SERVER']!,
      port: int.parse(dotenv.env['PORT']!),
      options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
    );
    final stub = PostServiceClient(channel);

    final request = SearchPostsRequest();
    request.keyword = keyword;

    try {
      final token = await SharedPreferences.getInstance().then((prefs) {
        return prefs.getString('token');
      });

      final metadata = {
        'authorization': 'Bearer $token',
      };
      final callOptions = CallOptions(metadata: metadata);

      final response =
          await stub.searchPostsByWriter(request, options: callOptions);

      await channel.shutdown();

      return response;
    } catch (error) {
      log('포스트 검색 중 오류 발생: $error');
      rethrow;
    }
  }
}
