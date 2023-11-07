// ignore_for_file: unused_local_variable, must_be_immutable, non_constant_identifier_names
import 'dart:io';
import 'package:bucher/db/book_db.dart';
import 'package:bucher/db/category_db.dart';
import 'package:bucher/model/book_model/book_model.dart';
import 'package:bucher/widgets/Custom_appbar/custm_adminappbar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recase/recase.dart';

import '../add_category/Category_add.dart';

class Editscreen extends StatefulWidget {
  String bookname;
  String bookphoto;
  String booksummary;
  String bookavail;
  String bookcategory;
  String bookauthor;
  String bookid;
  BookMainModel book;

  Editscreen({
    super.key,
    required this.bookid,
    required this.bookname,
    required this.booksummary,
    required this.bookphoto,
    required this.bookavail,
    required this.bookcategory,
    required this.bookauthor,
    required this.book,
  });

  @override
  State<Editscreen> createState() => _EditscreenState();
}

class _EditscreenState extends State<Editscreen> {
  String bphoto = '';
  TextEditingController bName = TextEditingController();
  TextEditingController bsummary = TextEditingController();
  TextEditingController bAuthor = TextEditingController();
  String? _category;
  String? bookid;
  String? bookavail;

  @override
  void initState() {
    super.initState();
    bphoto = widget.bookphoto;
    bookavail = widget.bookavail = 'true';
    bookid = widget.bookid;
    bName = TextEditingController(text: widget.bookname);
    bsummary = TextEditingController(text: widget.booksummary);
    bAuthor = TextEditingController(text: widget.bookauthor);
    _category = widget.bookcategory;
  }

  @override
  Widget build(BuildContext context) {
    refreshcategory();
    return Scaffold(
      appBar: CustomAppbarAdmin(
          leadingchild: const SizedBox(),
          title: 'Edit',
          child: const Icon(Icons.menu),
          onPressed: () {}),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                boxShadow: const [BoxShadow(blurRadius: 2)],
                color: const Color.fromARGB(255, 245, 239, 221),
              ),

              // color: Colors.amber,
              // width: MediaQuery.of(context).size.width/0.7,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 3, 61, 108)),
                          onPressed: () {
                            refreshcategory();
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (ctx) => CategoryAddScreen()));
                          },
                          icon: const Icon(Icons.assignment_add),
                          label: const Text(
                            'Add Category',
                            style: TextStyle(fontFamily: 'inter'),
                          )),
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),


                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
                    child: TextFormField(
                      controller: bName,
                      decoration: InputDecoration(
                          labelText: "Book Name",
                          labelStyle: const TextStyle(fontFamily: 'inter'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
                    child: TextFormField(
                      controller: bAuthor,
                      decoration: InputDecoration(
                          labelText: "Author",
                          labelStyle: const TextStyle(fontFamily: 'inter'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
                    child: DropdownButtonFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        elevation: 2,
                        style: const TextStyle(
                            fontFamily: 'inter', color: Colors.black),
                        hint: const Text('Category'),
                        value: _category,
                        items: categoryadd.value.map((e) {
                          return DropdownMenuItem(
                            value: e.categoryname,
                            child: Text(e.categoryname.titleCase),
                          );
                        }).toList(),
                        onChanged: ((value) {
                          setState(() {
                            _category = value;
                          });
                        })),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
                    child: TextFormField(
                      enableInteractiveSelection: true,
                      maxLength: null,
                      maxLines: null,
                      controller: bsummary,
                      decoration: InputDecoration(
                          labelText: "Summary",
                          labelStyle: const TextStyle(fontFamily: 'inter'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  // ElevatedButton(onPressed: (){

                  //   _pickImageFromGallery;
                  // }, child: const Text("Add Image"))

                  ElevatedButton.icon(
                    onPressed: _pickImageFromGallery,
                    icon: const Icon(Icons.image),
                    label: const Text('Add Image'),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    // color: const Color.fromARGB(255, 173, 168, 153),
                    height: 170,
                    width: 150,
                    child: bphoto != ''
                        ? Image.file(
                            File(bphoto),
                            fit: BoxFit.cover,
                          )
                        : const Center(
                            child: Text(
                              'No Image For\n Preview',
                              textAlign: TextAlign.center,
                            ),
                          ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton.icon(
                      onPressed: () {
                        _onAddbookclick();
                        Navigator.of(context).pop();
                        // Navigator.of(context).pop();

                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text(
                            'Data Updated Succesfully',
                            style: TextStyle(color: Colors.white),
                          ),
                          behavior: SnackBarBehavior.floating,
                          duration: Duration(milliseconds: 500),
                          backgroundColor: Colors.green,
                        ));
                      },
                      icon: const Icon(Icons.add),
                      label: const Text('Update')),
                  const SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _pickImageFromGallery() async {
    final pickedimage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      bphoto = pickedimage!.path;
    });
  }

  Future<void> _onAddbookclick() async {
    final String bname = bName.text.toLowerCase();

    final String bid = bookid as String;
    //  print(DateTime.now());
    final String bcategory = _category.toString().toLowerCase();
    final String bauthor = bAuthor.text;
    final String Bsummary = bsummary.text;
    final String Bphoto = await bphoto;
    final String Bavailbility = bookavail.toString();

    // print('fsdokkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk${bid}');
    final BookMainModel bookyobj = BookMainModel(
        id: bid,
        name: bname,
        author: bauthor,
        availability: Bavailbility,
        category: bcategory,
        summary: Bsummary,
        photo: Bphoto);

    onbookadd(bookyobj);
  }
}
