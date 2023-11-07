import 'package:bucher/screens/common/string_files.dart';
import 'package:bucher/widgets/Custom_appbar/custm_adminappbar.dart';
import 'package:bucher/widgets/ViewAll/gridview_viewall.dart';
import 'package:flutter/material.dart';

import '../../../widgets/drawer/drawer_students.dart';

class StudentViewall extends StatelessWidget {
  const StudentViewall({super.key});

  @override
  Widget build(BuildContext context) {
      final key1 = GlobalKey<ScaffoldState>();
    return SafeArea(
      child: Scaffold(
        key: key1,
      
      appBar: CustomAppbarAdmin(title: ViewAll, onPressed: (){},
         
      
        leadingchild: const SizedBox(), child: const Icon(Icons.menu),
      ),
       drawer:const Drawerstudents()
     ,body: const ViewallGrid(),
    
    
      ),
    );
  }
}