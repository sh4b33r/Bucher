import 'dart:io';
import 'package:bucher/db/book_db.dart';
import 'package:bucher/db/category_db.dart';
import 'package:bucher/model/book_model/book_model.dart';
import 'package:bucher/widgets/drawer/drawer_students.dart';
import 'package:flutter/material.dart';
import '../../screens/student/s_detailed_view/detailed_viewstud.dart';

class ViewallGrid extends StatelessWidget {
  const ViewallGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const Drawerstudents(),
        body: SingleChildScrollView(
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
                                InkWell(
                                   onTap: () {
                                     
                                    //  Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> catgeoryonlypag))
                                   },
                                  child: const Icon(Icons.double_arrow))
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
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (ctx) =>
                                                    DetailedViewstudent(
                                                        bookname: data.name,
                                                        booksummary:
                                                            data.summary,
                                                        bookphoto: data.photo,
                                                        bookavail:
                                                            data.availability,
                                                        bookcategory:
                                                            data.category,
                                                        bookauthor: data.author,
                                                        book: data)));
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: const Color.fromARGB(
                                              255, 148, 198, 221),
                                        ),
                                        height: 160,
                                        width: 110,
                                        child: Column(
                                          children: [
                                            singleBookData[index]
                                                        .availability ==
                                                    'true'
                                                ? Align(
                                                    alignment:
                                                        Alignment.topRight,
                                                    child: Container(
                                                      width: 15,
                                                      height: 15,
                                                      margin:
                                                          const EdgeInsets.all(
                                                              5),
                                                      decoration: BoxDecoration(
                                                          color: Colors.green,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      100)),
                                                    ),
                                                  )
                                                : Align(
                                                    alignment:
                                                        Alignment.topRight,
                                                    child: Container(
                                                      width: 15,
                                                      height: 15,
                                                      margin:
                                                          const EdgeInsets.all(
                                                              5),
                                                      decoration: BoxDecoration(
                                                          color: const Color
                                                              .fromARGB(
                                                              255, 221, 1, 1),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      100)),
                                                    ),
                                                  ),
                                            Image.file(
                                              File(singleBookData[index].photo),
                                              height: 95,
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
        ));
  }
}
