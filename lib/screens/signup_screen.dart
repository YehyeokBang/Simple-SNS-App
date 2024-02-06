// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:simple_sns_app/main.dart';
import 'package:simple_sns_app/providers/signup_provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _userIdController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _sexController = TextEditingController();
  final TextEditingController _birthdayController = TextEditingController();
  final TextEditingController _introduceController = TextEditingController();
  final _signUpProvider = SignUpProvider();

  @override
  void dispose() {
    _userIdController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _ageController.dispose();
    _sexController.dispose();
    _birthdayController.dispose();
    _introduceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('회원 가입'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _userIdController,
              decoration: const InputDecoration(
                labelText: '사용자 ID',
              ),
              keyboardType: TextInputType.text,
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: '비밀번호',
              ),
              keyboardType: TextInputType.text,
              obscureText: true,
            ),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: '이름',
              ),
              keyboardType: TextInputType.text,
            ),
            TextField(
              controller: _ageController,
              decoration: const InputDecoration(
                labelText: '나이',
              ),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _sexController,
              decoration: const InputDecoration(
                labelText: '성별',
              ),
              keyboardType: TextInputType.text,
            ),
            TextField(
              controller: _birthdayController,
              decoration: const InputDecoration(
                labelText: '생년월일',
              ),
              keyboardType: TextInputType.datetime,
            ),
            TextField(
              controller: _introduceController,
              decoration: const InputDecoration(
                labelText: '자기 소개',
              ),
              keyboardType: TextInputType.text,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                signUpUser();
              },
              child: const Text('회원 가입'),
            ),
          ],
        ),
      ),
    );
  }

  void signUpUser() async {
    try {
      final response = await _signUpProvider.signUpUser(
        userId: _userIdController.text,
        password: _passwordController.text,
        name: _nameController.text,
        age: int.parse(_ageController.text),
        sex: _sexController.text,
        birthday: _birthdayController.text,
        introduce: _introduceController.text,
      );
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('회원 가입 성공'),
          content: Text('사용자 ID: ${response.userId}'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MainScreen(),
                  ),
                );
              },
              child: const Text('확인'),
            ),
          ],
        ),
      );
    } catch (error) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('회원 가입 실패'),
          content: const Text('오류가 발생했습니다.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('확인'),
            ),
          ],
        ),
      );
    }
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple SNS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SignUpScreen(),
    );
  }
}
