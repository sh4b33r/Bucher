// import 'package:bucher/db/category_db.dart';
// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:bucher/db/book_db.dart';
import 'package:bucher/db/category_db.dart';
import 'package:bucher/model/category_model/category_model.dart';
import 'package:bucher/screens/common/string_files.dart';
import 'package:bucher/widgets/Custom_appbar/custm_adminappbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:recase/recase.dart';

class CategoryAddScreen extends StatelessWidget {
  CategoryAddScreen({super.key});

  final onupdatekey = GlobalKey<FormState>();
  final onAddkey = GlobalKey<FormState>();

  final myCategoryController = TextEditingController();
  TextEditingController editingCategoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppbarAdmin(
          title: Category,
          leadingchild: const SizedBox(),
          onPressed: () {},
          child: InkWell(
              onTap: () {
                Navigator.of(context).pop();

                refreshcategory();
              },
              child: const Icon(Icons.arrow_back_rounded)),
        ),
        body: Column(
          children: [
            Expanded(
              child: SlidableAutoCloseBehavior(
                closeWhenTapped: true,
                child: ValueListenableBuilder(
                  valueListenable: categoryadd,
                  builder: (BuildContext ctx, List<Categorymodel> categoryList,
                      Widget? child) {
                    return categoryList.isEmpty
                        ? const Center(
                            child: Text(
                            'No Category',
                            style: TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(255, 92, 157, 167)),
                          ))
                        : ListView.builder(
                            itemCount: categoryList.length,
                            itemBuilder: (
                              BuildContext context,
                              index,
                            ) {
                              final data = categoryList[index];
                              // print(data.categoryname);
                              return Slidable(
                                startActionPane: ActionPane(
                                    motion: const DrawerMotion(),
                                    extentRatio: .2,
                                    children: [
                                      SlidableAction(
                                        onPressed: (_) {
                                          showModalBottomSheet(
                                            context: context,
                                            backgroundColor:
                                                const Color.fromARGB(
                                                    255, 9, 46, 66),
                                            shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(15),
                                                    topRight:
                                                        Radius.circular(15))),
                                            builder: (BuildContext context) {
                                              editingCategoryController.text =
                                                  data.categoryname;
                                              return Padding(
                                                padding: EdgeInsets.only(
                                                    bottom:
                                                        MediaQuery.viewInsetsOf(
                                                                context)
                                                            .bottom),
                                                child: Container(
                                                  decoration:
                                                      const BoxDecoration(),
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      4.5,
                                                  padding: const EdgeInsets.all(
                                                      15.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: <Widget>[
                                                      Form(
                                                        key: onupdatekey,
                                                        child: TextFormField(
                                                          validator: (value) {
                                                            if (value == null ||
                                                                value.isEmpty ||
                                                                (!RegExp(
                                                                        r'^\S+(?!\d+$)')
                                                                    .hasMatch(
                                                                        value)) ||
                                                                value.contains(
                                                                    RegExp(
                                                                        r'^[a-zA-Z]+\s [^a-zA-Z]+$'))) {
                                                              return "please enter Category Name";
                                                            }
                                                            return null;
                                                          },
                                                          controller:
                                                              editingCategoryController,
                                                          decoration:
                                                              InputDecoration(
                                                            filled: true,
                                                            fillColor:
                                                                const Color
                                                                    .fromARGB(
                                                                    255,
                                                                    240,
                                                                    240,
                                                                    240),
                                                            border:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                              borderSide:
                                                                  const BorderSide(
                                                                      color: Colors
                                                                          .grey),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      // const SizedBox(
                                                      //   height: 10,
                                                      // ),
                                                      ElevatedButton.icon(
                                                        onPressed: () {
                                                          if (onupdatekey
                                                              .currentState!
                                                              .validate()) {
                                                            oneditcategory(
                                                                data
                                                                    .categoryname,
                                                                editingCategoryController
                                                                    .text);
                                                            _updateCategoryClick(
                                                                data.categoryid);
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                            refreshcategory();
                                                          }
                                                        },
                                                        icon: const Icon(
                                                            Icons.update),
                                                        label: const Text(
                                                            'Update'),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          );
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
                                        onPressed: (_) async {
                                          final count = await categrycheck(
                                              data.categoryname);

                                          if (count == 0) {
                                            deleteCategory(data.categoryid);
                                            refreshcategory();
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                                    behavior: SnackBarBehavior
                                                        .floating,
                                                    backgroundColor:
                                                        Color.fromARGB(
                                                            255, 230, 10, 10),
                                                    margin: EdgeInsets.all(10),
                                                    content: Text('Deleted')));
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(const SnackBar(
                                                    behavior: SnackBarBehavior
                                                        .floating,
                                                    backgroundColor:
                                                        Color.fromARGB(
                                                            255, 230, 10, 10),
                                                    margin: EdgeInsets.all(10),
                                                    content: Text(
                                                        "This Category Contains Books.it Can't be Deleted")));

                                            // Navigator.of(context).pop();
                                          }
                                        },
                                        icon: Icons.delete,
                                        backgroundColor: Colors.red,
                                      ),
                                    ]),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: ClipRect(
                                      clipBehavior: Clip.antiAlias,
                                      child: Container(
                                        decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            color: Color.fromARGB(
                                                255, 124, 176, 192)),
                                        width: double.infinity,
                                        height: 60,
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              20, 15, 15, 0),
                                          child: Text(
                                            data.categoryname.titleCase,
                                            style: const TextStyle(
                                                fontFamily: 'inter',
                                                fontWeight: FontWeight.w600,
                                                fontSize: 20),
                                          ),
                                        ),
                                      )),
                                ),
                              );
                            },
                          );
                  },
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showAddCategoryModal(context);
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  // ============================================
  //  Add Category BottomSheet
  // ============================================

  Future<void> _showAddCategoryModal(BuildContext context) async {
    await showModalBottomSheet(
      context: context,
      backgroundColor: const Color.fromARGB(255, 9, 46, 66),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15))),
      builder: (BuildContext context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
          child: Container(
            decoration: const BoxDecoration(),
            height: MediaQuery.of(context).size.height / 3.5,
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Form(
                  key: onAddkey,
                  child: TextFormField(
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          (!RegExp(r'^\S+(?!\d+$)').hasMatch(value)) ||
                          value.contains(RegExp(r'^[a-zA-Z]+\s [^a-zA-Z]+$'))) {
                        return "please enter Category Name";
                      }
                      return null;
                    },
                    controller: myCategoryController,
                    decoration: InputDecoration(
                      hintText: 'Category Add',
                      filled: true,
                      fillColor: const Color.fromARGB(255, 240, 240, 240),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
                // const SizedBox(
                //   height: 20,
                // ),
                ElevatedButton.icon(
                  onPressed: () {
                    if (onAddkey.currentState!.validate()) {
                      _addCategoryClick();
                      myCategoryController.clear();
                      Navigator.of(context).pop();
                    }
                  },
                  icon: const Icon(Icons.add),
                  label: const Text('Add Category'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _addCategoryClick() {
    final String categoryname = myCategoryController.text.toLowerCase().trim();
    final String categoryid = DateTime.now().millisecondsSinceEpoch.toString();
    // print(DateTime.now());
    final Categorymodel categoryobj =
        Categorymodel(categoryname: categoryname, categoryid: categoryid);

    oncategoryadd(categoryobj);
  }

  void _updateCategoryClick(id) {
    final String categoryEdited =
        editingCategoryController.text.toLowerCase().trim();
    final String categoryid = id;
    final Categorymodel categoryobj =
        Categorymodel(categoryname: categoryEdited, categoryid: categoryid);

    oncategoryadd(categoryobj);
  }
}
