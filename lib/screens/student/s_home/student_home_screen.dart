
import 'package:bucher/db/book_db.dart';
import 'package:bucher/db/category_db.dart';
import 'package:bucher/screens/common/string_files.dart';
import 'package:bucher/widgets/Custom_appbar/custm_adminappbar.dart';

import 'package:bucher/widgets/drawer/drawer_students.dart';
import 'package:flutter/material.dart';
import '../../../widgets/Students/gridview_Student.dart';

import '../../../widgets/drawer/student_filter.dart';
import '../s_viewall/student_viewall.dart';

class StudentHome extends StatefulWidget {
   const StudentHome({super.key});

  @override
  State<StudentHome> createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {
  
  final keystud = GlobalKey<ScaffoldState>();
    bool isVisible=false;
    var searchCntrl = TextEditingController();
    
  @override
  
  Widget build(BuildContext context) {
    refreshbook();
   refreshcategory();
   
    // PreferredSizeWidget? wid;
    return SafeArea(
      child: Scaffold(
        key: keystud,
          appBar: CustomAppbarAdmin(
               leadingchildsearch: InkWell(
              onTap: () {
                setState(() {
                  if (isVisible) {
                    isVisible = false;
                  } else {
                    isVisible = true;
                  }
                });
              },
              child: const Icon(Icons.search,
                  size: 30, opticalSize: 10, color: Colors.white)),
            title: Home,
            
            leadingchild: InkWell(
                    onTap: () {
                      

 keystud.currentState!.openEndDrawer();
 

                    },

             child: const Icon(
                Icons.filter_alt,
                color: Colors.white,
              ),
            ),
            child: GestureDetector(
              
                onTap: (){
                  keystud.currentState!.openDrawer();
                //   print('------------------*****************');
                //    Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> DrawerStdents()));
                //   // Scaffold.of(context).openDrawer();
                },
                child: const Icon(
              Icons.menu,
              size: 20,
            )),
          ),
          drawer: const Drawerstudents(),
        endDrawer: const FilterDrawerStudents(),
 floatingActionButton: IconButton(
  
  onPressed: (){

refreshbook();

 }, icon: const Icon(Icons.filter_alt_off)),         
          body: Column(
 
            children: [

              Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Visibility(
                visible: isVisible,
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: TextField(
                      controller: searchCntrl,
                      onChanged: (value) {
                        Searchbook(value.toLowerCase());
                      },
                      decoration: const InputDecoration(
                          hintText: 'Search...',
                          prefixIcon: Icon(Icons.search),
                          prefixIconColor: Colors.black,
                          suffixIcon: Icon(Icons.close),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 9, 43, 71),
                                  width: 11)))),
                ),
              ),
              
            ),
              Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => const StudentViewall()));
                      },
                      child: const Text("View All"))),
              const Expanded(
                child: GridviewStudents(),
              )
            ],
          )
          // ,bottomNavigationBar: BottomNavigationBar(items: items)

          // Gnavbar_students()

          ),
    );
  }
}
