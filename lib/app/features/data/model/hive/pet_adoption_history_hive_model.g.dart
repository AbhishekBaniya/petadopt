// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pet_adoption_history_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AdoptedPetAdapter extends TypeAdapter<AdoptedPet> {
  @override
  final int typeId = 1;

  @override
  AdoptedPet read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AdoptedPet(
      petName: fields[0] as String,
      adoptedDate: fields[1] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, AdoptedPet obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.petName)
      ..writeByte(1)
      ..write(obj.adoptedDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AdoptedPetAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
