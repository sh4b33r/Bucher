import 'dart:io';
import 'package:bucher/screens/admin/admin_detailed_view/detailed_view.dart';
import 'package:bucher/widgets/Custom_appbar/custm_adminappbar.dart';
import 'package:bucher/widgets/drawer/drawer_admins.dart';
import 'package:bucher/widgets/drawer/filter_drawer.dart';
import 'package:flutter/material.dart';
import '../../../db/book_db.dart';
import '../../../db/category_db.dart';
import '../../../model/book_model/book_model.dart';

class GridviewAdmins extends StatefulWidget {
  const GridviewAdmins({super.key});

  @override
  State<GridviewAdmins> createState() => _GridviewAdminsState();
}

bool isVisible = false;

var searchCntrl = TextEditingController();
class _GridviewAdminsState extends State<GridviewAdmins> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: key,
        drawer: const DrawerAdmins(),
        endDrawer: const FilterDrawerAdmins(),
        appBar: CustomAppbarAdmin(
            leadingchildsearch: const SizedBox(),
            title: "View All",
            leadingchild: SizedBox(
              child: InkWell(
                onTap: () => key.currentState!.openEndDrawer(),
                child:const SizedBox()
              ),
            ),
            child: InkWell(
                onTap: () => key.currentState!.openDrawer(),
                child: const Icon(Icons.menu))),
        body: ListView(
          children: [
            //     Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 8),
            //   child: Visibility(
            //     visible: isVisible,
            //     child: Padding(
            //       padding: const EdgeInsets.all(5.0),
            //       child: TextField(
            //           controller: searchCntrl,
            //           onChanged: (value) {
            //             Searchbook(value.toLowerCase());
            //           },
            //           decoration: const InputDecoration(
            //               hintText: 'Search...',
            //               prefixIcon: Icon(Icons.search),
            //               prefixIconColor: Colors.black,
            //               suffixIcon: Icon(Icons.close),
            //               border: OutlineInputBorder(
            //                   borderRadius:
            //                       BorderRadius.all(Radius.circular(20)),
            //                   borderSide: BorderSide(
            //                       color: Color.fromARGB(255, 9, 43, 71),
            //                       width: 11)))),
            //     ),
            //   ),
              
            // ),

            SingleChildScrollView(
              child: ValueListenableBuilder(
                valueListenable: categoryadd,
                builder: (context, value, child) {
                  var book = bookNotifier.value;
                  return Column(
                      children: List.generate(value.length, (index) {
                    List<BookMainModel> singleBookData = [];
                    for (var element in book) {
                      if (element.category == value[index].categoryname) {
                        singleBookData.add(element);
                      }
                    }
        
                    return singleBookData.isNotEmpty
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10, right: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      value[index].categoryname,
                                      style: const TextStyle(
                                          fontFamily: 'Inter', fontSize: 15),
                                    ),
                                    const Icon(Icons.double_arrow)
                                  ],
                                ),
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: List.generate(singleBookData.length,
                                        (index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: InkWell(
                                          onTap: () {
                                            var data = singleBookData[index];
                                            // Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> DetailedViewstudent (bookname: data.name,booksummary: data.summary, bookphoto: data.photo, bookavail: data.availability, bookcategory: data.category, bookauthor: data.author, book: data) ));
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (ctx) =>
                                                        DetailedViewAdmin(
                                                          bookid: data.id,
                                                          bookname: data.name,
                                                          bookauthor: data.author,
                                                          bookphoto: data.photo,
                                                          bookavail:
                                                              data.availability,
                                                          bookcategory:
                                                              data.category,
                                                          booksummary: data.summary,
                                                          book: data,
                                                        )));
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: const Color.fromARGB(
                                                  255, 148, 198, 221),
                                            ),
                                            height: 180,
                                            width: 130,
                                            child: Column(
                                              children: [
                                                // singleBookData[index].availability=='true',
                                                Switch(
                                                    // value: true,
                                                    value: singleBookData[index]
                                                                .availability ==
                                                            'true'
                                                        ? true
                                                        : false,
                                                    onChanged: (value) {
                                                      bookAvailability(
                                                          singleBookData[index]);
                                                    },
                                                    activeColor:
                                                        const Color.fromARGB(
                                                            255, 39, 255, 1),
                                                    inactiveThumbColor: Colors.red),
        
                                                Image.file(
                                                  File(singleBookData[index].photo),
                                                  height: 90,
                                                  width: 90,
                                                ),
        
                                                const SizedBox(
                                                  height: 3,
                                                ),
                                                Text(singleBookData[index].name)
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    })),
                              ),
                            ],
                          )
                        : const SizedBox();
                  }));
                },
              ),
            ),
          ],
        ));
  }
}

final key = GlobalKey<ScaffoldState>();
