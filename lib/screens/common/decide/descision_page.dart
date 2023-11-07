import 'package:bucher/db/book_db.dart';
import 'package:bucher/db/category_db.dart';
import 'package:bucher/screens/common/decide/librarian_field.dart';
import 'package:flutter/material.dart';
import '../../admin/login/admin_login.dart';
import '../../student/entry/student_credentials.dart';
import 'student_field.dart';

// import 'package:project/screens/decision_screen/librarian_descision.dart';


class DescisionScreen extends StatelessWidget {
  
  const DescisionScreen({super.key});

  @override
  Widget build(BuildContext context) {

    
    refreshbook();
    refreshcategory();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                'assets/image/ADMIN.png',
                height: 300,
                width: 300,
              ),
              const SizedBox(
                height: 40,
              ),
              GestureDetector(
                
                 onTap: (){
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>  StudentCredtials()));
                 },
                child: const StudentDescision()),
             GestureDetector(
               onTap: (){
     
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>  AdminLogin()));
                // navigator.of(context).push(MaterialApp.router(c))
               },
              
              child: const LibrarianDescison()),
            ],
          ),
        ),
      ),
    );
  }
}
