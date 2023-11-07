import 'package:bucher/model/category_model/category_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../model/book_model/book_model.dart';

Future<void> initDb() async {
  
  Hive.initFlutter();

  if (!Hive.isAdapterRegistered(BookMainModelAdapter().typeId)) {
    Hive.registerAdapter(BookMainModelAdapter());
  }

  if (!Hive.isAdapterRegistered(CategorymodelAdapter().typeId)) {
    Hive.registerAdapter(CategorymodelAdapter());
  }
}
