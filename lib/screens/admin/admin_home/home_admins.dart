// ignore_for_file: non_constant_identifier_names

import 'dart:io';
import 'package:bucher/db/book_db.dart';
import 'package:bucher/db/category_db.dart';
import 'package:bucher/screens/admin/admin_detailed_view/detailed_view.dart';
import 'package:bucher/screens/admin/edit/edit_screen.dart';
import 'package:bucher/screens/common/string_files.dart';
import 'package:bucher/widgets/Custom_appbar/custm_adminappbar.dart';
import 'package:bucher/widgets/drawer/drawer_admins.dart';
import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:recase/recase.dart';
import '../../../model/book_model/book_model.dart';
import '../../../widgets/drawer/filter_drawer.dart';
import '../admin_gridview/gridview_admin.dart';
import '../Add/add_screen.dart';
import '../demoscreen/demo.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  int selected = 1;
  var pages = [
    const AddScreen(),
    const HomeScreenAdmin(),
    const GridviewAdmins(),
  ];
  @override
  void initState() {
    refreshbook();
    refreshcategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    refreshbook();

    return SafeArea(
      child: Scaffold(
        // drawer: const DrawerAdmins(),

        // bottomNavigationBar: BottomNavigationBar(items: [

        //   BottomNavigationBarItem(icon: GestureDetector(

        //     onTap: (){},
        //     child: Icon(Icons.add)),label: 'Add'),
        //      BottomNavigationBarItem( tooltip: "Home" , icon: Icon(Icons.house),label: 'Home'),
        //      BottomNavigationBarItem(icon: Icon(Icons.h_mobiledata),label: 'poigiug')

        // ]),

        body: pages[selected],

        bottomNavigationBar: BottomAppBar(
          child: CircleNavBar(
              tabDurationMillSec: 200,
              activeIndex: selected,
              activeIcons: const [
                Icon(Icons.add, color: Color.fromARGB(255, 2, 32, 117)),
                Icon(Icons.home, color: Color.fromARGB(255, 2, 32, 117)),
                Icon(Icons.grid_view_rounded,
                    color: Color.fromARGB(255, 2, 32, 117)),
              ],
              inactiveIcons: const [
                Icon(Icons.add, color: Color.fromARGB(255, 2, 32, 117)),
                Icon(Icons.home, color: Color.fromARGB(255, 2, 32, 117)),
                Icon(Icons.grid_view_rounded,
                    color: Color.fromARGB(255, 2, 32, 117)),
                // Text("Add",style: TextStyle(fontFamily: 'Inter',fontWeight: FontWeight.w500
                // )),
                // Text("Home",style: TextStyle(fontFamily: 'Inter',fontWeight: FontWeight.w500)),
                // Text("View All",style: TextStyle(fontFamily: 'Inter',fontWeight: FontWeight.w500),),
              ],
              color: const Color.fromARGB(255, 255, 255, 255),
              // circleColor: Colors.white,
              height: 60,
              circleWidth: 60,
              onTap: (index) {
                setState(() {
                  selected = index;
                });
              },
              tabCurve:
                  Curves.linear, // Add a curve here, e.g., Curves.easeInOut
              padding: const EdgeInsets.only(left: 2, right: 2, bottom: 0),
              cornerRadius: const BorderRadius.only(
                topLeft: Radius.circular(22),
                topRight: Radius.circular(22),
                bottomRight: Radius.circular(0),
                bottomLeft: Radius.circular(0),
              ),
              // shadowColor: Color.fromARGB(255, 66, 113, 231),
              // circleShadowColor: Colors.deepPurple,
              elevation: 1,
              // gradient: LinearGradient(
              //   begin: Alignment.topRight,
              //   end: Alignment.bottomLeft,
              //   colors: [Colors.blue, Colors.red],
              // ),
              // circleGradient: LinearGradient(
              //   begin: Alignment.topRight,
              //   end: Alignment.bottomLeft,
              //   colors: [Colors.blue, Colors.red],
              // ),
              circleGradient: const LinearGradient(colors: [
                Color.fromRGBO(255, 255, 255, 1),
                Color.fromRGBO(255, 255, 255, 1)
              ]),
              gradient: const RadialGradient(colors: [
                Color.fromARGB(255, 23, 107, 135),
                Color.fromARGB(255, 23, 107, 135),
              ])),
        ),
      ),
    );
  }
}

class HomeScreenAdmin extends StatefulWidget {
  const HomeScreenAdmin({super.key});

  @override
  State<HomeScreenAdmin> createState() => _HomeScreenAdminState();
}

bool isVisible = false;
var searchCntrl = TextEditingController();

class _HomeScreenAdminState extends State<HomeScreenAdmin> {
  @override
  Widget build(BuildContext context) {
    final key1 = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: key1,
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
                key1.currentState!.openEndDrawer();
              },
              child: const Icon(
                Icons.filter_alt,
                color: Colors.white,
              )),
          child: InkWell(
              onTap: () => key1.currentState!.openDrawer(),
              child: const Icon(Icons.menu))),
      drawer: const DrawerAdmins(),
      endDrawer: const FilterDrawerAdmins(),
      floatingActionButton: IconButton(
        color:const Color.fromARGB(255, 15, 34, 86),
        enableFeedback: false,
      selectedIcon: const Icon(Icons.filter_alt),
      disabledColor: Colors.black,
        onPressed: (){
         
   refreshbook();

      }, icon: const Icon(Icons.filter_alt_off)),
      body: Column(
        children: [

          // ==============================///////////////////////////////=
       
          Visibility(
            visible: false,
            child: CircleAvatar(
              backgroundColor: const Color.fromARGB(255, 255, 191, 0),
              child: IconButton(onPressed: (){
          
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> const demoscr() ));
            } , icon: const Icon(Icons.abc)),),
          ),


          ///=============================//////////////////////////////

            
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
                    decoration: InputDecoration(
                        hintText: 'Search...',
                        prefixIcon: const Icon(Icons.search),
                        prefixIconColor: Colors.black,
                        suffixIcon: InkWell(
                           onTap: (){
                               searchCntrl.clear();

                           },
                          child: const Icon(Icons.close)),
                        border: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                                color: Color.fromARGB(255, 9, 43, 71),
                                width: 11)))),
              ),
            ),
            
          ),
          
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: SlidableAutoCloseBehavior(
              child: ValueListenableBuilder(
                valueListenable: bookNotifier,
                builder: (BuildContext ctx, List<BookMainModel> BOokList,
                    Widget? _) {
                  if (BOokList.isEmpty) {
                    return const Center(
                      child: Text('No data found'),
                    );
                  }
                  if (BOokList.isEmpty) {
                    return const Center(
                      child: Text('No data found'),
                    );
                  }

                  return ListView.builder(
                    itemCount: BOokList.length,
                    itemBuilder: (context, index) {
                      final datab = BOokList[index];

                      return Slidable(
                          startActionPane: ActionPane(
                              motion: const DrawerMotion(),
                              extentRatio: .2,
                              children: [
                                SlidableAction(
                                  onPressed: (_) {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (ctx) => Editscreen(

                                                bookid: datab.id,
                                                bookname: datab.name,
                                                booksummary: datab.summary,
                                                bookphoto: datab.photo,
                                                bookavail: datab.availability,
                                                bookcategory: datab.category,
                                                book:datab,
                                                bookauthor: datab.author)));
                                  },
                                  icon: Icons.edit,
                                  backgroundColor: Colors.blue,
                                ),
                              ]),
                          endActionPane: ActionPane(
                              motion: const DrawerMotion(),
                              extentRatio: .3,
                              children: [
                                SlidableAction(
                                  onPressed: (_) {
                                    // deletebook(datab.id);
                                    // refreshbook();
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            clipBehavior:
                                                Clip.antiAliasWithSaveLayer,
                                            backgroundColor:
                                                const Color.fromARGB(
                                                    255, 255, 255, 255),
                                            title: const Text(
                                              'Are you Sure you want to Delete?',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontFamily: 'poppins'),
                                            ),
                                            // content: const Text('You Want to Logout.'),
                                            actions: [
                                             
                                              IconButton(
                                                onPressed: () {
                                                  Navigator.of(ctx).pop();
                                                },
                                                icon: const Icon(
                                                  Icons.close,
                                                  size: 30,
                                                  color: Colors.black,
                                                ),
                                              ),
                                               IconButton(
                                                onPressed: () {

                                                 
                                                  deletebook(datab.id);
                                                  Navigator.of(context).pop();
                                                  refreshbook();
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(const SnackBar(

                                                          behavior:
                                                              SnackBarBehavior
                                                                  .floating,
                                                          backgroundColor:
                                                              Color.fromARGB(
                                                                  255,
                                                                  230,
                                                                  10,
                                                                  10),
                                                          margin:
                                                              EdgeInsets.all(
                                                                  10),
                                                          content: Text(
                                                              'Deleted'))
                                                              );
                                                },
                                                icon: const Icon(
                                                  Icons.delete,
                                                  size: 30,
                                                  color: Colors.red,
                                                ),
                                              ),
                                            ],
                                          );
                                        });
                                  },
                                  icon: Icons.delete,
                                  backgroundColor: Colors.red,
                                ),
                              ]),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: const BoxDecoration(
                                  color: Color.fromARGB(180, 37, 94, 141),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              child: ListTile(
                                onTap: () {
                                  Navigator.of(context)
                                      .push(MaterialPageRoute(
                                          builder: (ctx) => DetailedViewAdmin(
                                                bookid: datab.id,
                                                bookname: datab.name,
                                                bookauthor: datab.author,
                                                bookphoto: datab.photo,
                                                bookavail: datab.availability,
                                                bookcategory: datab.category,
                                                booksummary: datab.summary,
                                                book:datab,
                                                
                                              )));
                                },
                                leading: Image.file(File(datab.photo)),
                                title: Text(datab.name.titleCase),
                                subtitle: Text(datab.category),
                                trailing: Switch(
                                    // value: true,
                                    value:datab.availability=='true' ? true : false,
                                    onChanged: (value) {
                                      bookAvailability(datab);
                                      
                                    },
                                    activeColor: const Color.fromARGB(255, 39, 255, 1),
                                    inactiveThumbColor: Colors.red),
                              ),
                            ),
                          ));
                    },
                  );
                },
                //  child: Expanded(
                //   child: ,
                //   //  child: ListView.builder(itemBuilder: (context, index) {
                //    return Padding(
                //     padding: const EdgeInsets.all(10),
                //      child: Dismissible(

                //      direction: DismissDirection.startToEnd,
                //      onDismissed: (DismissDirection direction) {
                //     if (direction == DismissDirection.startToEnd) {
                //       print('Remove item');

                //     } else {
                //       print("Add to favorite");

                //     }},
                //       key:
                //        Key('item ${datas[index]}'),
                //       background: const ClipRect(
                //         clipBehavior:Clip.antiAlias,
                //         child: ColoredBox(color: Color.fromARGB(175, 218, 8, 8) ,child: Padding(
                //           padding: EdgeInsets.all(25.0),
                //           child: Text('Delete'),
                //         ),),
                //       ) ,
                //        child: ClipRRect(
                //         borderRadius: BorderRadius.circular(10),
                //          child: ColoredBox(
                //           color: const Color.fromARGB(180, 37, 94, 141),

                //            child: ListTile(
                //                     onTap: () {
                //                       Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> const DetailedViewAdmin()));
                //                     },
                //             leading: Image.asset('assets/image/howtostopwor.png'),
                //               title:Text(datas[index]),
                //              subtitle: Text(datascategory[index]),
                //              trailing: Switch(value: false, onChanged: (_){},activeColor: Colors.red,inactiveThumbColor: Colors.green),

                //            ),
                //          ),
                //        ),
                //      ),
                //    );

                //  },
                //   itemCount: 10,
                //  ),
                //  ),
              ),
            ),


          )
          
        ],
      ),
    );
  }
}

Color bluedrawer = const Color.fromARGB(173, 8, 33, 71);
