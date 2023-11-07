// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../S_Home/Student_home_screen.dart';

class StudentCredtials extends StatelessWidget {
  StudentCredtials({super.key});

  var collegcntrl = TextEditingController();
  final _fromclgid = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'assets/image/stuents.jpg',
                  ),
                  fit: BoxFit.cover)),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 290,
                  ),
                  Form(
                    key: _fromclgid,
                    child: TextFormField(
                      //========== ==== validator  ======================================================
                      validator: (value) {
                      
                         if (value!.isEmpty) {
                      return "College ID required";
                    } else if (value != '111') {
                      return "ID Invalid";
                    } else {
                      return null;
                    }
                      },
                      //=========== ===================================================================
                      controller: collegcntrl,
                      decoration: InputDecoration(
                          labelText: "College id",
                          labelStyle: const TextStyle(fontFamily: 'inter'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                      onPressed: () async {

                      if(_fromclgid.currentState!.validate()){
                                  setuserlogin();
                      Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (ctx) => const StudentHome()));
                      }
                        
                      },
                      child: const Text("Submit"))
                ],
              ),
            ),
          )),
    );
  }
  Future<void> setuserlogin() async {
    final shared = await SharedPreferences.getInstance();
    shared.setBool('LoginStateuser', true);
  }
}
