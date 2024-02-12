// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:simple_sns_app/api/v1/post/post.pb.dart';
import 'package:simple_sns_app/api/v1/post/post.pbgrpc.dart';
import 'package:simple_sns_app/providers/post_search_provider.dart';
import 'package:simple_sns_app/screens/post_detail_screen.dart';

class PostSearchScreen extends StatefulWidget {
  const PostSearchScreen({Key? key}) : super(key: key);

  @override
  _PostSearchScreenState createState() => _PostSearchScreenState();
}

class _PostSearchScreenState extends State<PostSearchScreen> {
  final _keywordController = TextEditingController();
  final _postSearchProvider = PostSearchProvider();
  String _searchOption = 'Title';
  List<PostSummary> _searchResults = [];
  String _searchMessage = '';

  @override
  void dispose() {
    _keywordController.dispose();
    super.dispose();
  }

  Future<void> _searchPost() async {
    try {
      GetPostsResponse response = GetPostsResponse();
      if (_searchOption == 'Title') {
        response = await _postSearchProvider.searchPostsByTitle(
          _keywordController.text,
        );
      } else if (_searchOption == 'Writer') {
        response = await _postSearchProvider.searchPostsByWriter(
          _keywordController.text,
        );
      }

      if (response.postSummaries.isEmpty) {
        _searchMessage = '검색 결과가 없습니다.';
      } else {
        _searchMessage = '';
      }
      setState(() {
        _searchResults = response.postSummaries;
      });
    } catch (error) {
      debugPrint('포스트 검색 중 오류 발생: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('포스트 검색'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DropdownButton<String>(
              value: _searchOption,
              onChanged: (String? newValue) {
                setState(() {
                  _searchOption = newValue!;
                });
              },
              items: <String>['Title', 'Writer']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            TextField(
              controller: _keywordController,
              decoration: const InputDecoration(
                labelText: '검색어',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _searchPost,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                  const EdgeInsets.symmetric(vertical: 16.0),
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              child: const Text(
                '검색하기',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: _searchResults.isEmpty
                  ? Center(child: Text(_searchMessage))
                  : ListView.builder(
                      itemCount: _searchResults.length,
                      itemBuilder: (context, index) {
                        final post = _searchResults[index];
                        return ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PostDetailScreen(
                                  postId: post.id,
                                ),
                              ),
                            );
                          },
                          title: Text(post.title),
                          subtitle: Text(post.userName),
                          trailing: Text('댓글 수: ${post.commentCount}'),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
