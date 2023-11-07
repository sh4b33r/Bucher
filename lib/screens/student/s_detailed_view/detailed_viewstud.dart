// ignore_for_file: must_be_immutable

import 'dart:io';
import 'package:bucher/model/book_model/book_model.dart';
import 'package:bucher/screens/common/string_files.dart';
import 'package:flutter/material.dart';
import '../../../widgets/Custom_appbar/custm_adminappbar.dart';


class DetailedViewstudent extends StatelessWidget {
  String bookname;
  String bookphoto;
  String booksummary;
  // String bookid;
  String bookavail;
  String bookcategory;
  String bookauthor;
  BookMainModel book;

   DetailedViewstudent({
    super.key,
    required this.bookname,
    // required this.bookid,
    required this.booksummary,
    required this.bookphoto,
    required this.bookavail,
    required this.bookcategory,
    required this.bookauthor,
    required this.book,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppbarAdmin(
          title:Detailedview, onPressed: () {},
          //  secondchild: SizedBox(),
          leadingchild:const SizedBox(), 
          // InkWell(
          //     onTap: () {
          //       Navigator.of(context)
          //           .push(MaterialPageRoute(builder: (ctx) =>  Editscreen(bookname: bookname,
          //           bookid:bookid
          //           , booksummary: booksummary, bookphoto: bookphoto, bookavail: bookavail, bookcategory: bookcategory, bookauthor: bookauthor,book:book ,)));
          //     },
          //     // child: const Icon(
          //     //   Icons.edit,
          //     //   color: Colors.white,
          //     // )
              
          //     ),
          child: InkWell(
            
            onTap: (){

               Navigator.of(context).pop();
            },
            child: const Icon(Icons.arrow_back)),
        ),
        body: ListView(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 40),
                    child: SizedBox(
                       
                      
                        child:  
                         bookavail=='true'?const Text('AVAILABLE',style: TextStyle(fontFamily: 'inter',color: Colors.green,fontWeight: FontWeight.w600),):const Text('UNAVAILABLE',style: TextStyle(fontFamily: 'inter',color: Colors.red,fontWeight: FontWeight.w600))
                        
                        
                        // Switch(
                        //     value: true,
                        //     activeColor: Colors.green,
                        //     onChanged: (_) {})
                            
                            
                            
                            ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      height: 160,
                      width: 130,
                      decoration: const BoxDecoration(
                        // color: Colors.black,
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 168, 162, 162),
                            spreadRadius: 1,
                            offset: Offset(0, 5),
                            blurRadius: 20,
                          )
                        ],
                      ),
                      child: Image.file(
                       File(bookphoto),
                        height: 70,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                 Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                           bookname,
                        // 'The Power Of Your Mind',
                        style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            color: Color.fromARGB(255, 3, 19, 158)),
                      )),
                ),
                 Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Author : $bookauthor',
                        style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Color.fromARGB(183, 129, 129, 129)),
                      )),
                ),
               Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Category : $bookcategory',
                        style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            color: Color.fromARGB(183, 83, 82, 82)),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    constraints: const BoxConstraints(maxHeight: double.infinity),
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height,
                    // height:double.maxFinite,
                  //  
                    
                    
                    // height: double.infinity,
                    // width: double.infinity,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 135, 185, 201),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child:  Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(booksummary
                                      
                                      
                        //               '''The Power Of Your Subconscious Mind is one of few exceptions, likely because of two factors. First, the author, Joseph Murphy, was a popular minister of the Church of Divine Science and second, because his book took root in both science and religion. From today’s perspective, the book feels a bit woo-woo, but at the time, it struck the exact right nerve.s
                        // The scientific idea this plays on is called the placebo effect. In medicine, a placebo is a pill without a real, chemical or biological consequence, usually made of sugar. But if patients believe they’re getting strong medication, they might still observe some of the benefits, solely based on this belief. While the effect has been observed in many studies, I wouldn’t call this hard science, because how well it works is very subjective and depends on the individual.
                        //   Murphy’s example is a woman, who was offered a job at the opposite coast of the country. It paid twice her current salary, but she was unsure whether to move across the nation for it. As she meditated in the evening, she fell asleep. In the morning, her gut confirmed her initial doubts and she decided not to take the offer. A few months later, she found out the company had gone bankrupt.                ''',
                       , style: const TextStyle(
                            fontFamily: 'poppins',
                            fontWeight: FontWeight.w500,
                            wordSpacing: 2,
                            fontSize: 15),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
