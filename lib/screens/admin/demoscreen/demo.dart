// import 'package:bucher/db/book_db.dart';
// import 'package:bucher/db/category_db.dart';
// ignore_for_file: camel_case_types

import 'package:bucher/widgets/custom_appbar/custm_stdntappbar.dart';
import 'package:flutter/material.dart';

class demoscr extends StatelessWidget {
  const demoscr({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: 'Demo', child: const SizedBox(), onPressed: () {}),
      // body: ValueListenableBuilder(
      //   valueListenable: categoryadd,
      //   builder: (context, valuectgry, child) => ValueListenableBuilder(
      //     valueListenable: bookNotifier,
      //     builder: (context, valuebk, child) {
      //       return Column(
      //         children: [
      //           ListView.builder(
      //             itemCount: categoryadd.value.length,
      //             itemBuilder: (context, index) {
      //               return Column(
      //                 children: [
      //                   Text(valuectgry[index].categoryname),
      //                   Row(
      //                     children: [
      //                       GridView.count(
      //                         crossAxisCount: bookNotifier.value.length,
      //                         children: [
      //                           SingleChildScrollView(
      //                             scrollDirection: Axis.horizontal,
      //                             child: Row(
      //                                 children: List.generate(10, (index) {
      //                               return Padding(
      //                                 padding: const EdgeInsets.all(8.0),
      //                                 child: Container(
      //                                   decoration: BoxDecoration(
      //                                     borderRadius:
      //                                         BorderRadius.circular(10),
      //                                     color: const Color.fromARGB(
      //                                         255, 148, 198, 221),
      //                                   ),
      //                                   height: 160,
      //                                   width: 110,
      //                                   child: Column(
      //                                     children: [
      //                                       index % 2 == 0
      //                                           ? Switch(
      //                                               activeColor: Colors.red,
      //                                               inactiveThumbColor:
      //                                                   Colors.green,
      //                                               value: true,
      //                                               onChanged: (_) {})
      //                                           : Switch(
      //                                               activeColor: Colors.red,
      //                                               inactiveThumbColor:
      //                                                   Colors.green,
      //                                               value: false,
      //                                               onChanged: (_) {}),

      //                                       index % 2 != 0
      //                                           ? Image.asset(
      //                                               'assets/image/poweofmind.png',
      //                                               height: 95,
      //                                               width: 90,
      //                                             )
      //                                           : Image.asset(
      //                                               'assets/image/howtostopwor.png',
      //                                               height: 95,
      //                                               width: 90,
      //                                             ),
      //                                       const SizedBox(
      //                                         height: 3,
      //                                       ),
      //                                       // Text('Power of mindset' ,style: TextStyle(fontSize: 10),),
      //                                     ],
      //                                   ),
      //                                 ),
      //                               );
      //                             })),
      //                           ),
      //                         ],
      //                       )
      //                     ],
      //                   )
      //                 ],
      //               );
      //             },
      //           )
      //         ],
      //       );
      //     },
      //   )
      // 
      //      ),

  body:ListView(



    children: [

    TextFormField(


      decoration: const InputDecoration(border: OutlineInputBorder(borderSide:BorderSide() ))
      
      
      
    )


    ],
  ) 
  
  
  ,
    );
  }
}
