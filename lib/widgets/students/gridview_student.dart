import 'dart:io';

import 'package:bucher/db/book_db.dart';
import 'package:bucher/screens/student/s_detailed_view/detailed_viewstud.dart';

import 'package:flutter/material.dart';
import 'package:recase/recase.dart';

class GridviewStudents extends StatefulWidget {
  const GridviewStudents({super.key});

  @override
  State<GridviewStudents> createState() => _GridviewStudentsState();
}

class _GridviewStudentsState extends State<GridviewStudents> {
  @override
  Widget build(BuildContext context) {

    // BAKI PANI IVDE NOKANM VERUM VALUE LISTENABLE AAN NADANITTULUU


    return ValueListenableBuilder(
      valueListenable: bookNotifier,
      builder: (context, value, child) {
        
return GridView.builder(
        
        gridDelegate: MediaQuery.of(context).orientation==Orientation.portrait?const SliverGridDelegateWithFixedCrossAxisCount(
                                   crossAxisCount: 2
                                   ):const SliverGridDelegateWithFixedCrossAxisCount(
                                   crossAxisCount: 4
                                   ) ,
    // MediaQuery.of(context).orientation.Orientation.portrait?
    //                                  gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
    //                                  crossAxisCount: 2
    //                                  ):
    itemCount: bookNotifier.value.length,
                                   itemBuilder: (context, index) {
                                    final data=bookNotifier.value[index];
                      return InkWell(
                      onTap: (){
                                   
                                    Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> DetailedViewstudent (bookname: data.name,booksummary: data.summary, bookphoto: data.photo, bookavail: data.availability, bookcategory: data.category, bookauthor: data.author, book: data) ));

                                 },
                        child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: Container(
                                
                                
                                  
                                  decoration: BoxDecoration(
                                      color: const Color.fromARGB(189, 91, 134, 178),
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, top: 0, bottom: 20),
                                child: Stack(
                                  children: [
                                    SizedBox(
                                        // decoration: BoxDecoration(boxShadow: [
                                        //   BoxShadow(
                                        //       color: Colors.black, offset: Offset(1, 1))
                                        // ]),
                                      height: 120,
                                   
                                      width: 90,
                                   
                                      //  color: Colors.amber,
                                      child: Image.file(
                                        
                                        File(data.photo)
                                        ,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                              Padding(
                                      padding: const EdgeInsets.only(top: 130),
                                      child: Column(
                                        children: [
                                          Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              data.name.titleCase,
                                              style: const TextStyle(fontSize: 15),
                                            ),
                                          ),
                                          const SizedBox(
                                           height: 3,
                                          ),
                                          Align
                                          
                                          (
                                            alignment: Alignment.centerLeft,
                                            child: Text(data.category.titleCase, style: const TextStyle(fontSize: 12),))
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 160),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          const SizedBox(
                                            width: 40,
                                            height: 30,
                                          ),
                      
                                          data.availability=='true'?
                                          const Text(
                                            "AVAILABLE",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Color.fromARGB(
                                                  255,
                                                  27,
                                                  98,
                                                  46,
                                                ),
                                                fontWeight: FontWeight.w500),
                                          ):const Text(
                                            "UNAVAILABLE",
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Color.fromARGB(255, 223, 5, 5),
                                                fontWeight: FontWeight.w500),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                      );
                     
                                  
                                   },
                     
                     );







      },
      
    ); 
  }
}





