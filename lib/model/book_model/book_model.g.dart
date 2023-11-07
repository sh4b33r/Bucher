// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookMainModelAdapter extends TypeAdapter<BookMainModel> {
  @override
  final int typeId = 0;

  @override
  BookMainModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BookMainModel(
      id: fields[0] as String,
      name: fields[1] as String,
      author: fields[2] as String,
      availability: fields[3] as String,
      category: fields[4] as String,
      summary: fields[5] as String,
      photo: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, BookMainModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.author)
      ..writeByte(3)
      ..write(obj.availability)
      ..writeByte(4)
      ..write(obj.category)
      ..writeByte(5)
      ..write(obj.summary)
      ..writeByte(6)
      ..write(obj.photo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookMainModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
