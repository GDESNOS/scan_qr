// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qr.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QrAdapter extends TypeAdapter<Qr> {
  @override
  final int typeId = 1;

  @override
  Qr read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Qr(
      id: fields[0] as int,
      categorie: fields[1] as String,
      Type: fields[2] as String,
      description: fields[3] as String,
      dates: fields[4] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, Qr obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.categorie)
      ..writeByte(2)
      ..write(obj.Type)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.dates);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QrAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
