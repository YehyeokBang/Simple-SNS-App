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
  int? _replyingToCommentId;
  final _postDetailProvider = PostDetailProvider();
  final _commentController = TextEditingController();

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

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
                            buildCommentField(),
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
    List<Widget> commentWidgets = [];
    var comments = post!.comments;

    comments.sort((a, b) => a.id.compareTo(b.id));

    for (var comment in comments) {
      if (!comment.hasParent) {
        commentWidgets.add(buildComment(comment, 0));
      } else {
        var index = commentWidgets.indexWhere(
            (element) => (element.key as ValueKey).value == comment.parentId);
        commentWidgets.insert(index + 1, buildComment(comment, 1));
      }
    }

    return Column(children: commentWidgets);
  }

  Widget buildComment(Comment comment, int depth) {
    return Container(
      key: ValueKey(comment.id),
      padding: EdgeInsets.only(left: comment.hasParent == true ? 60.0 : 0.0),
      color: depth == 0 ? Colors.white : Colors.grey[200],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: [
              Text(
                '${comment.userName}',
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              if (!comment.hasParent)
                IconButton(
                  icon: const Icon(Icons.reply),
                  onPressed: () {
                    setState(() {
                      _replyingToCommentId = comment.id;
                    });
                  },
                ),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            comment.content,
            style: const TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 10),
          if (_replyingToCommentId == comment.id) buildReplyField(),
        ],
      ),
    );
  }

  Widget buildReplyField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: _commentController,
              decoration: const InputDecoration(
                hintText: '대댓글을 입력하세요...',
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {
              // 대댓글 작성 로직
              _writeReply();
            },
          )
        ],
      ),
    );
  }

  Future<void> _writeReply() async {
    if (_replyingToCommentId == null) return;

    try {
      final _ = await _postDetailProvider.writeReply(
        post!.id,
        _replyingToCommentId!,
        _commentController.text,
      );

      _commentController.clear();

      debugPrint('대댓글 작성 완료');

      await getPostById();
    } catch (error) {
      debugPrint('대댓글 작성 중 오류 발생: $error');
    } finally {
      setState(() {
        _replyingToCommentId = null;
      });
    }
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

  Widget buildCommentField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: _commentController,
              decoration: const InputDecoration(
                hintText: '댓글을 입력하세요...',
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {
              // 댓글 작성 로직
              _writeComment();
            },
          )
        ],
      ),
    );
  }

  Future<void> _writeComment() async {
    try {
      final _ = await _postDetailProvider.writeComment(
        post!.id,
        _commentController.text,
      );

      _commentController.clear();

      await getPostById();

      debugPrint('댓글 작성 완료');
    } catch (error) {
      debugPrint('댓글 작성 중 오류 발생: $error');
    }
  }
}
