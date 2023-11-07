import 'package:bucher/db/book_db.dart';
import 'package:bucher/db/category_db.dart';
import 'package:bucher/db/main_db.dart';
import 'package:bucher/screens/common/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';



void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDb();
  await Hive.initFlutter('path: $bookDbName');
  await Hive.initFlutter('path: $categoryDbName');
  runApp(const MyApp());
  refreshbook();

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      debugShowCheckedModeBanner: false,
    home: SplashScr() ,    
    
     );
  }
}
