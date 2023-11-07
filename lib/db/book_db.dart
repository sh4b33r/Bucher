// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member, non_constant_identifier_names

import 'package:bucher/db/category_db.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../model/book_model/book_model.dart';

const bookDbName = 'Book_database';
ValueNotifier<List<BookMainModel>> bookNotifier = ValueNotifier([]);

Future<void> onbookadd(BookMainModel value) async {
  final bookbox = await Hive.openBox<BookMainModel>(bookDbName);

  await bookbox.put(value.id, value);

  refreshbook();

  // Hive.close();
}

Future<void> oneditcategory(String oldname, String newname) async {
  final book = await getallbook();
  await Future.forEach(book, (element) {
    if (element.category == oldname) {
      element.category = newname;
      onbookadd(element);
    }
  });

  refreshbook();
}





Future<List<BookMainModel>> getallbook() async {
  final bookdb = await Hive.openBox<BookMainModel>(bookDbName);
  return bookdb.values.toList();
}

Future<void> refreshbook() async {
  final value = await getallbook();

  bookNotifier.value.clear();

  for (var element in value) {
    bookNotifier.value.add(element);
  }
  bookNotifier.notifyListeners();
}

Future<void> deletebook(key) async {
  final categorybox = await Hive.openBox<BookMainModel>(bookDbName);

  await categorybox.delete(key);

  refreshbook();
}

Future<void> Searchbook(String value) async {
  // final bookbox = await Hive.openBox<BookMainModel>(bookDbName);
  await refreshbook();
  var val = [];
  val.addAll(bookNotifier.value);
  bookNotifier.value.clear();
  for (var element in val) {
    if (element.name.contains(value)) {
      bookNotifier.value.add(element);
    }
  }
  // await bookbox.put(value.id, value);
  bookNotifier.notifyListeners();
  //  refreshbook();
}

Future<void> filterbook(String category) async {
  await refreshbook();
  List<BookMainModel> filterbk = [];

  for (var book in bookNotifier.value) {
    if (book.category == category) {
      filterbk.add(book);
    }
  }
  bookNotifier.value = filterbk;

  bookNotifier.notifyListeners();
}

Future<void> bookAvailability(BookMainModel bookMainModel) async {
  final bookdb = await Hive.openBox<BookMainModel>(bookDbName);
  for (var element in bookdb.values) {
    if (element.id == bookMainModel.id) {
      if (bookMainModel.availability == 'true') {
        // print('changes to false');
        bookMainModel.availability = 'false';
      } else {
        // print('changes to true');
        bookMainModel.availability = 'true';
        // print(bookMainModel.availability);
      }
    }
  }

  await bookdb.put(bookMainModel.id, bookMainModel);
  // print(bookMainModel.availability);
  refreshbook();
  refreshcategory();
}


Future<int> bookistherechekcing(String name,String Author)async{

 final book = await getallbook();
  int count = 0;
  await Future.forEach(book, (element) {

    if (element.name == name && element.author== Author) {
      count++;
    
    }
  });

  return count;
}