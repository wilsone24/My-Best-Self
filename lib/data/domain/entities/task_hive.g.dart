// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskHiveAdapter extends TypeAdapter<TaskHive> {
  @override
  final int typeId = 0;

  @override
  TaskHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TaskHive(
      name: fields[0] as String,
      count: fields[1] as int,
      goal: fields[2] as int,
      nameGoal: fields[3] as String,
      points: fields[4] as String,
      isCompleted: fields[5] as bool,
      image: fields[6] as String,
      id: fields[7] as int,
      date: fields[8] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TaskHive obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.count)
      ..writeByte(2)
      ..write(obj.goal)
      ..writeByte(3)
      ..write(obj.nameGoal)
      ..writeByte(4)
      ..write(obj.points)
      ..writeByte(5)
      ..write(obj.isCompleted)
      ..writeByte(6)
      ..write(obj.image)
      ..writeByte(7)
      ..write(obj.id)
      ..writeByte(8)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
