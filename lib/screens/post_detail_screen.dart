// ignore_for_file: library_private_types_in_public_api, unnecessary_string_interpolations

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:simple_sns_app/api/v1/post/post.pb.dart';
import 'package:simple_sns_app/api/v1/post/post.pbgrpc.dart';
import 'package:simple_sns_app/providers/post_detail_provider.dart';

class PostDetailScreen extends StatefulWidget {
  final int postId;
  const PostDetailScreen({super.key, required this.postId});
  @override
  _PostDetailScreenState createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  Post? post;
  bool isLoading = false;
  final _postDetailProvider = PostDetailProvider();

  @override
  void initState() {
    super.initState();
    getPostById();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 0.0),
            child: Text(post == null ? '게시글을 불러오지 못했습니다.' : post!.title),
          ),
        ),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : RefreshIndicator(
              onRefresh: getPostById,
              child: LayoutBuilder(
                builder:
                    (BuildContext context, BoxConstraints viewportConstraints) {
                  return SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: viewportConstraints.maxHeight,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  '글쓴이: ${post!.userName}',
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  DateFormat('yyyy/MM/dd HH:mm').format(
                                    DateTime.fromMillisecondsSinceEpoch(
                                      post!.createdAt.seconds.toInt() * 1000 +
                                          post!.createdAt.nanos ~/ 1000000,
                                    ),
                                  ),
                                  style: const TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Text(
                              post!.content,
                              style: const TextStyle(fontSize: 18),
                            ),
                            const SizedBox(height: 40),
                            const Text(
                              '댓글',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                            buildCommentList(),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }

  Widget buildCommentList() {
    var comments = post!.comments.where((c) => !c.hasParent).toList();
    comments.sort((a, b) => a.id.compareTo(b.id));

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: comments.length,
      itemBuilder: (context, index) {
        var comment = comments[index];
        var childComments =
            post!.comments.where((c) => c.parentId == comment.id).toList();
        childComments.sort((a, b) => a.id.compareTo(b.id));

        return Container(
          alignment: Alignment.centerLeft,
          child: Column(
            children: <Widget>[
              buildComment(comment, 0),
              for (var child in childComments) buildComment(child, 1),
            ],
          ),
        );
      },
    );
  }

  Widget buildComment(Comment comment, int depth) {
    return Padding(
      padding: EdgeInsets.only(left: 10.0 * depth),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '${comment.userName}',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Text(
            comment.content,
            style: const TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Future<void> getPostById() async {
    if (isLoading) return;
    setState(() {
      isLoading = true;
    });

    try {
      final response = await _postDetailProvider.getPostById(widget.postId);
      setState(() {
        post = response;
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
