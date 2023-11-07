// ignore_for_file: avoid_unnecessary_containers, must_be_immutable

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../admin_home/home_admins.dart';

class AdminLogin extends StatelessWidget {
  AdminLogin({super.key});
  // ignore: non_constant_identifier_names
  final TextEditingController _MailText = TextEditingController();
  final TextEditingController _passText = TextEditingController();
  final TextEditingController _cText = TextEditingController();
  final _fromlogin = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: SingleChildScrollView(
            child: Form(
          key: _fromlogin,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: Image.asset(
                'assets/image/logo.jpg',
                height: 250,
                width: 200,
              )),
              const Text(
                "Admin Login",
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 30,
                    color: Color.fromARGB(255, 2, 63, 149),
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 35,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 0, 25, 10),
                child: TextFormField(
                  controller: _MailText,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter a valid Email";
                    } else if (value != "ab@gmail.com") {
                      return "Email Invalid";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    labelStyle:
                        const TextStyle(color: Color.fromARGB(122, 0, 0, 0)),
                    hintText: "Email",
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 13, 6, 203)),
                        borderRadius: BorderRadius.circular(20)),
                    filled: true,
                    fillColor: const Color.fromARGB(174, 152, 172, 244),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 5, 25, 10),
                child: TextFormField(
                  obscureText: true,
                  controller: _passText,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Password is required";
                    } else if (value != '123') {
                      return "Password Invalid";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    labelStyle:
                        const TextStyle(color: Color.fromARGB(122, 0, 0, 0)),
                    hintText: 'Password',
                    
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 13, 6, 203)),
                        borderRadius: BorderRadius.circular(20)),
                    filled: true,
                    fillColor: const Color.fromARGB(174, 152, 172, 244),
                  ),
                ),
              ),


Padding(
                padding: const EdgeInsets.fromLTRB(25, 5, 25, 10),
                child: TextFormField(
                  controller: _cText,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "College ID required";
                    } else if (value != '111') {
                      return "ID Invalid";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    labelStyle:
                        const TextStyle(color: Color.fromARGB(122, 0, 0, 0)),
                    hintText: 'College ID',
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 13, 6, 203)),
                        borderRadius: BorderRadius.circular(20)),
                    filled: true,
                    fillColor: const Color.fromARGB(174, 152, 172, 244),
                  ),
                ),
              ),


               const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 32, 27, 159)),
                  onPressed: () {
                    if (_fromlogin.currentState!.validate()) {             
                      setadminlogin();
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (ctx) => const AdminHome()));
                    }
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(fontFamily: 'Poppins'),
                  ))
            ],
          ),
        )),
      ),
    );
  }

  Future<void> setadminlogin() async {
    final shared = await SharedPreferences.getInstance();
    shared.setBool('LoginState', true);
  }
}
