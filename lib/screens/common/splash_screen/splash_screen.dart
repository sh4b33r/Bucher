// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'dart:async';

import 'package:bucher/screens/admin/admin_home/home_admins.dart';
import 'package:bucher/screens/common/decide/descision_page.dart';
import 'package:bucher/screens/student/s_home/student_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class SplashScr extends StatefulWidget {
  const SplashScr({super.key});

  @override
  State<SplashScr> createState() => _SplashScrState();
}

class _SplashScrState extends State<SplashScr> {
  late final LoginState;
  late final LoginStateuser;
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      if (LoginState == true || LoginStateuser == true) {
        if (LoginState == true) {
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (ctx) {
            return const AdminHome();
          }));
        } else if (LoginStateuser) {
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (ctx) {
            return const StudentHome();
          }));
        } else {
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (ctx) {
            return const DescisionScreen();
          }));
        }
      }
      else {
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (ctx) {
            return const DescisionScreen();
          }));
        }
    });
  }

  @override
  Widget build(BuildContext context) {
    getstatus();
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          const SizedBox(
            height: 230,
          ),
          Center(
              child: Image.asset(
            'assets/image/booksplash.png',
            height: 350,
          )),
          Center(child: Image.asset('assets/image/icons8-bookmark.gif'))
        ],
      ),
    );
  }

  Future<void> getstatus() async {
    final shared = await SharedPreferences.getInstance();
   LoginState = shared.getBool('LoginState');
   LoginStateuser = shared.getBool('LoginStateuser');

  }
}
