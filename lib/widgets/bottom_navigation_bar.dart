// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:simple_sns_app/screens/post_screen.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  final Function(int) onTap;

  const BottomNavigationBarWidget({super.key, required this.onTap});

  @override
  _BottomNavigationBarWidgetState createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    widget.onTap(index);

    if (index == 2) {
      // '추가' 버튼을 눌렀을 때
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PostingScreen()), // PostingScreen으로 이동
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: '홈',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: '검색',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add),
          label: '추가',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: '알림',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: '프로필',
        ),
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      backgroundColor: Colors.grey[700], // 배경색을 음영 효과가 있는 회색으로 설정
      selectedItemColor: Colors.white, // 선택된 아이템의 색상을 흰색으로 설정
      unselectedItemColor: Colors.white, // 선택되지 않은 아이템의 색상을 흰색으로 설정
      type: BottomNavigationBarType.fixed, // 애니메이션이 덜 움직이도록 설정
    );
  }
}
