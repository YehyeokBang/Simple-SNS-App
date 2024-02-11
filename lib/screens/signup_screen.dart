// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:simple_sns_app/screens/welcome_screen.dart';
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
  late String _selectedGender = '선택안함';
  String _selectedYear = '2000';
  String _selectedMonth = '1';
  String _selectedDay = '1';
  final TextEditingController _introduceController = TextEditingController();
  final _signUpProvider = SignUpProvider();

  @override
  void dispose() {
    _userIdController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
    _ageController.dispose();
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
        child: ListView(
          children: [
            buildInputItem('사용자 ID', _userIdController),
            buildInputItem('비밀번호', _passwordController),
            buildInputItem('이름', _nameController),
            buildInputItem('나이', _ageController),
            buildGenderSelect(),
            buildDatePicker(),
            buildInputItem('자기 소개', _introduceController),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                validateAndSignUpUser();
              },
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
                '회원 가입',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInputItem(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: label,
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return '필수 입력 항목입니다';
          }
          return null;
        },
      ),
    );
  }

  Widget buildGenderSelect() {
    return DropdownButton<String>(
      value: _selectedGender,
      items: <String>['male', 'female', '선택안함']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          _selectedGender = newValue!;
        });
      },
    );
  }

  Widget buildDatePicker() {
    return Row(
      children: [
        Expanded(
          child: buildYearSelector(),
        ),
        const SizedBox(width: 8.0),
        Expanded(
          child: buildMonthSelector(),
        ),
        const SizedBox(width: 8.0),
        Expanded(
          child: buildDaySelector(),
        ),
      ],
    );
  }

  Widget buildYearSelector() {
    return DropdownButton<String>(
      value: _selectedYear,
      items: List<String>.generate(122, (index) => (1900 + index).toString())
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          _selectedYear = newValue!;
        });
      },
    );
  }

  Widget buildMonthSelector() {
    return DropdownButton<String>(
      value: _selectedMonth,
      items: List<String>.generate(12, (index) => (index + 1).toString())
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          _selectedMonth = newValue!;
        });
      },
    );
  }

  Widget buildDaySelector() {
    var dayCount = 31;
    if (_selectedMonth == '2') {
      dayCount = 28;
      if (int.parse(_selectedYear) % 4 == 0) {
        if (int.parse(_selectedYear) % 100 != 0 ||
            int.parse(_selectedYear) % 400 == 0) {
          dayCount = 29;
        }
      }
    } else if (_selectedMonth == '4' ||
        _selectedMonth == '6' ||
        _selectedMonth == '9' ||
        _selectedMonth == '11') {
      dayCount = 30;
    }

    return DropdownButton<String>(
      value: _selectedDay,
      items: List<String>.generate(dayCount, (index) => (index + 1).toString())
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          _selectedDay = newValue!;
        });
      },
    );
  }

  void validateAndSignUpUser() {
    if (_userIdController.text.isEmpty) {
      showWarningDialog('사용자 ID를 입력해주세요');
      return;
    }
    if (_passwordController.text.isEmpty) {
      showWarningDialog('비밀번호를 입력해주세요');
      return;
    }
    if (_nameController.text.isEmpty) {
      showWarningDialog('이름을 입력해주세요');
      return;
    }
    if (_ageController.text.isEmpty) {
      showWarningDialog('나이를 입력해주세요');
      return;
    }

    signUpUser();
  }

  void showWarningDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('회원 가입 실패'),
        content: Text(message),
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

  void signUpUser() async {
    try {
      final response = await _signUpProvider.signUpUser(
        userId: _userIdController.text,
        password: _passwordController.text,
        name: _nameController.text,
        age: int.parse(_ageController.text),
        sex: _selectedGender,
        birthday: DateTime(
          int.parse(_selectedYear),
          int.parse(_selectedMonth),
          int.parse(_selectedDay),
        ).toUtc().add(const Duration(hours: 9)).toIso8601String(),
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
                    builder: (context) => const WelcomeScreen(),
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
