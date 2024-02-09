// ignore_for_file: library_private_types_in_public_api

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:simple_sns_app/providers/profile_provider.dart';
import 'package:simple_sns_app/api/v1/user/user.pb.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _profileProvider = ProfileProvider();
  bool isLoading = false;
  GetUserResponse? userProfile;

  @override
  void initState() {
    super.initState();
    getProfile();
  }

  Future<void> getProfile() async {
    setState(() {
      isLoading = true;
    });

    try {
      final response = await _profileProvider.getUser();
      setState(() {
        userProfile = response;
        isLoading = false;
      });
    } catch (error) {
      setState(() {
        isLoading = false;
      });
      log('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('내 프로필'),
      ),
      body: isLoading
          ? const CircularProgressIndicator()
          : Column(
              children: [
                ListTile(
                  title: const Text('아이디'),
                  subtitle: Text(userProfile!.userId),
                ),
                ListTile(
                  title: const Text('이름'),
                  subtitle: Text(userProfile!.name),
                ),
                ListTile(
                  title: const Text('나이'),
                  subtitle: Text('${userProfile!.age}'),
                ),
                ListTile(
                  title: const Text('성별'),
                  subtitle: Text(userProfile!.sex),
                ),
                ListTile(
                  title: const Text('생일'),
                  subtitle: Text('${userProfile!.birthday.toDateTime()}'),
                ),
                ListTile(
                  title: const Text('소개'),
                  subtitle: Text(userProfile!.introduce),
                ),
              ],
            ),
    );
  }
}
