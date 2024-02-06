// ignore_for_file: library_private_types_in_public_api

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:simple_sns_app/widgets/bottom_navigation_bar.dart';
import 'package:simple_sns_app/api/v1/post/post.pb.dart';
import 'package:simple_sns_app/api/v1/post/post.pbgrpc.dart';
import 'package:simple_sns_app/screens/post_detail_screen.dart';
import 'package:simple_sns_app/providers/home_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<PostSummary> postSummaries = [];
  int page = 1;
  int limit = 10;
  bool isLoading = false;
  final _homeProvider = HomeProvider();

  @override
  void initState() {
    super.initState();
    getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('게시글'),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : RefreshIndicator(
              onRefresh: getPosts,
              child: ListView.builder(
                itemCount: postSummaries.length,
                itemBuilder: (context, index) {
                  final postSummary = postSummaries[index];
                  return ListTile(
                    title: Text(
                      postSummary.title,
                      style: const TextStyle(fontSize: 20),
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('작성자: ${postSummary.userName}'),
                        Text('댓글 수: ${postSummary.commentCount}'),
                      ],
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              PostDetailScreen(postId: postSummary.id),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
      bottomNavigationBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: BottomNavigationBarWidget(
          onTap: (index) => log('Tapped on index $index'),
        ),
      ),
    );
  }

  Future<void> getPosts() async {
    if (isLoading) return;
    setState(() {
      isLoading = true;
    });

    try {
      postSummaries.clear();
      page = 1;

      final response = await _homeProvider.getPosts(page, limit);
      setState(() {
        postSummaries.addAll(response.postSummaries);
        page++;
        isLoading = false;
      });
    } catch (error) {
      setState(() {
        isLoading = false;
      });
      log('Error: $error');
    }
  }
}
