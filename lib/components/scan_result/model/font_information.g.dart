// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'font_information.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FontInformationAdapter extends TypeAdapter<FontInformation> {
  @override
  final int typeId = 2;

  @override
  FontInformation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FontInformation(
      fields[0] as int,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
      fields[4] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, FontInformation obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.fontFamily)
      ..writeByte(2)
      ..write(obj.fontName)
      ..writeByte(3)
      ..write(obj.style)
      ..writeByte(4)
      ..write(obj.favorite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FontInformationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
