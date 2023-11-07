// ignore_for_file: await_only_futures
import 'dart:io';
import 'package:bucher/db/book_db.dart';
import 'package:bucher/db/category_db.dart';
import 'package:bucher/model/book_model/book_model.dart';
import 'package:bucher/widgets/Custom_appbar/custm_adminappbar.dart';
import 'package:bucher/widgets/drawer/drawer_admins.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recase/recase.dart';
import '../add_category/Category_add.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  String _selectedImage = '';
  final TextEditingController bookname = TextEditingController();
  final TextEditingController booksummary = TextEditingController();
  final TextEditingController author = TextEditingController();
  String? _category;
  bool availability = true;
  final _formKey1 = GlobalKey<FormState>();

  bool isVisb = false;
  @override
  void initState() {
    refreshcategory();
    super.initState();
  }

  bool isImageSelected = false;

  @override
  Widget build(BuildContext context) {
    final key2 = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: key2,
      appBar: CustomAppbarAdmin(
        leadingchild: const SizedBox(),
        title: 'Add Books',
        child: InkWell(
            onTap: () => key2.currentState!.openDrawer(),
            child: const Icon(Icons.menu)),
      ),
      drawer: const DrawerAdmins(),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: _formKey1,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: const [BoxShadow(blurRadius: 2)],
                  color: const Color.fromARGB(255, 245, 239, 221),
                ),

                // color: Colors.amber,
                // width: MediaQuery.of(context).size.width/0.7,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
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
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (ctx) => CategoryAddScreen()));
                              refreshcategory();
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
                    Align(
                        alignment: Alignment.topRight,
                        child: Switch(
                            value: availability,
                            onChanged: (value) {
                              setState(() {
                                availability = value;
                              });
                            },
                            activeColor: const Color.fromARGB(255, 37, 226, 3),
                            inactiveThumbColor:
                                const Color.fromARGB(255, 221, 9, 9))),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
                      child: TextFormField(
                        // ==== validator  ======================================================
                        validator: (value) {
                          if (value == null) {
                            return "Book Name Can't be Empty";
                          } else if (!RegExp(r'^\S+(?!\d+$)').hasMatch(value)) {
                            return 'Book Name Invalid';
                          }
                          return null;
                        },
                        // ===================================================================
                        controller: bookname,
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
                        // ==== validator  ======================================================
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a Author Name';
                          } else if (!RegExp(r'^(?:(?!\d+$).)*$')
                              .hasMatch(value)) {
                            return 'Please Enter a Valid Auhtor Name';
                          }
                          return null;
                        },
                        // ===================================================================
                        // key: _formKey1,
                        controller: author,
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
                          validator: (value) {
                            if (value == null) {
                              return 'Please Input a Category';
                            }
                            return null;
                          },
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
                        // ==== validator  ======================================================
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a book Summary';
                          } else if (value.length < 25) {
                            return 'Minimum 25 Words Needed';
                          }
                          return null;
                        },
                        // ===================================================================
                        // key: _formKeyname,
                        enableInteractiveSelection: true,
                        maxLength: null,
                        maxLines: null,
                        controller: booksummary,
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
                    Visibility(
                        visible: !isImageSelected,
                        child: const Text(
                          'No Image Selected',
                          style: TextStyle(color: Colors.red),
                        )),
                    SizedBox(
                      // color: const Color.fromARGB(255, 173, 168, 153),
                      height: 170,
                      width: 150,
                      child: _selectedImage != ''
                          ? Image.file(
                              File(_selectedImage),
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
                        onPressed: () async {
                          final count = await bookistherechekcing(
                              bookname.text.toLowerCase(),
                              author.text.toLowerCase());
                          if (count == 0) {
                            if (_formKey1.currentState!.validate()) {
                              _onAddbookclick();

                              bookname.clear();
                              booksummary.clear();
                              author.clear();
                              setState(() {
                                _selectedImage = '';
                                _category = null;
                              });
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text(
                                  'Data Added Successfully',
                                  style: TextStyle(color: Colors.white),
                                ),
                                behavior: SnackBarBehavior.floating,
                                duration: Duration(milliseconds: 500),
                                backgroundColor: Colors.green,
                              ));
                            }
                          } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text(
                                'Book Is Already there With Same Name and Author',
                                style: TextStyle(color: Colors.white),
                              ),
                              behavior: SnackBarBehavior.floating,
                              duration: Duration(milliseconds: 500),
                              backgroundColor: Color.fromARGB(255, 230, 75, 3),
                            ));
                          }

                          // else if (_category == null) {

                          //   setState(() {
                          //     isVisb = true;
                          //   });
                          // }
                        },
                        // },
                        icon: const Icon(Icons.add),
                        label: const Text('ADD')),
                    const SizedBox(
                      height: 30,
                    )
                  ],
                ),
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
      _selectedImage = pickedimage!.path;
      isImageSelected = true;
    });
  }

  Future<void> _onAddbookclick() async {
    final String bname = bookname.text.toLowerCase();
    final String bid = DateTime.now().microsecondsSinceEpoch.toString();

    final String bcategory = _category.toString().toLowerCase();
    final String bauthor = author.text;
    final String bsummary = booksummary.text;
    final String bphoto = await _selectedImage;
    final String bavailbility = availability.toString();
    // pss
    final BookMainModel bookyobj = BookMainModel(
        id: bid,
        name: bname,
        author: bauthor,
        availability: bavailbility,
        category: bcategory,
        summary: bsummary,
        photo: bphoto);

    onbookadd(bookyobj);
  }
}

