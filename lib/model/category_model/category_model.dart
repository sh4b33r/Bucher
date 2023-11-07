import 'package:hive_flutter/hive_flutter.dart';

  part 'category_model.g.dart';

@HiveType(typeId: 1)
class Categorymodel{

  @HiveField(0)
 final String categoryname;


  @HiveField(1)
 final String categoryid;



 Categorymodel({required this.categoryname, required this.categoryid});



}