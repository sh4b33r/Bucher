// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CategorymodelAdapter extends TypeAdapter<Categorymodel> {
  @override
  final int typeId = 1;

  @override
  Categorymodel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Categorymodel(
      categoryname: fields[0] as String,
      categoryid: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Categorymodel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.categoryname)
      ..writeByte(1)
      ..write(obj.categoryid);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategorymodelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
