// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:simple_sns_app/screens/home_screen.dart';
import 'package:simple_sns_app/providers/post_provider.dart';

class PostingScreen extends StatefulWidget {
  const PostingScreen({super.key});

  @override
  _PostingScreenState createState() => _PostingScreenState();
}

class _PostingScreenState extends State<PostingScreen> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  final _postProvider = PostProvider();

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  Future<void> _writePost() async {
    try {
      final response = await _postProvider.writePost(
        _titleController.text,
        _contentController.text,
      );
      final message = response.message;

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
        (route) => false,
      );

      debugPrint('응답: $message');
    } catch (error) {
      debugPrint('포스트 작성 중 오류 발생: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('포스트 작성'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: '제목',
              ),
            ),
            TextField(
              controller: _contentController,
              decoration: const InputDecoration(
                labelText: '내용',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _writePost,
              child: const Text('작성하기'),
            ),
          ],
        ),
      ),
    );
  }
}
