import 'package:hive_flutter/hive_flutter.dart';

part 'book_model.g.dart';

@HiveType(typeId: 0)
class BookMainModel{
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String author;

  @HiveField(3)
   String availability;

  @HiveField(4)
   String category;

  @HiveField(5)
  final String summary;

  @HiveField(6)
  final String photo;

  BookMainModel(
      {
      required this.id,
      required this.name,
      required this.author,
      required this.availability,
      required this.category,
      required this.summary,
      required this.photo});
}
