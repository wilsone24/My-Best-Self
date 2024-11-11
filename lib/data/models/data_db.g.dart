// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_db.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DataDbAdapter extends TypeAdapter<DataDb> {
  @override
  final int typeId = 0;

  @override
  DataDb read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DataDb(
      id: fields[0] as int?,
      name: fields[1] as String,
      goal: fields[3] as int,
      nameGoal: fields[4] as String,
      points: fields[5] as String,
      image: fields[7] as String,
      date: fields[8] as DateTime,
    )
      ..count = fields[2] as RxInt
      ..isCompleted = fields[6] as RxBool;
  }

  @override
  void write(BinaryWriter writer, DataDb obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.count)
      ..writeByte(3)
      ..write(obj.goal)
      ..writeByte(4)
      ..write(obj.nameGoal)
      ..writeByte(5)
      ..write(obj.points)
      ..writeByte(6)
      ..write(obj.isCompleted)
      ..writeByte(7)
      ..write(obj.image)
      ..writeByte(8)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataDbAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
