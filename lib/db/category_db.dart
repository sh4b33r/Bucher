// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:bucher/db/book_db.dart';
import 'package:bucher/model/category_model/category_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';

const categoryDbName = 'category_database';
ValueNotifier<List<Categorymodel>> categoryadd = ValueNotifier([]);
Future<void> oncategoryadd(Categorymodel value) async {
  final categorybox = await Hive.openBox<Categorymodel>(categoryDbName);

  await categorybox.put(value.categoryid, value);
//  print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>${value.categoryname},,,,,,,,<<<<<<<<<<<<<<');

  refreshcategory();
}

Future<List<Categorymodel>> getallcategory() async {
  final categorydb = await Hive.openBox<Categorymodel>(categoryDbName);
  return categorydb.values.toList();
}

Future<void> refreshcategory() async {
  final value = await getallcategory();

  categoryadd.value.clear();

  for (var element in value) {
    categoryadd.value.add(element);
  }
  categoryadd.notifyListeners();
}

Future<void> deleteCategory(key) async {
  final categorybox = await Hive.openBox<Categorymodel>(categoryDbName);

  await categorybox.delete(key);

  refreshcategory();
}

Future<int> categrycheck(String name) async {
  final book = await getallbook();
  int count = 0;
  await Future.forEach(book, (element) {
    if (element.category == name) {
      count++;
    }
  });

  return count;
}
