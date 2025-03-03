// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DoctorHiveModelAdapter extends TypeAdapter<DoctorHiveModel> {
  @override
  final int typeId = 0;

  @override
  DoctorHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DoctorHiveModel(
      doctorId: fields[0] as String?,
      username: fields[1] as String,
      email: fields[2] as String,
      password: fields[3] as String,
      contactNo: fields[4] as String?,
      image: fields[5] as String?,
      fullname: fields[6] as String,
      dob: fields[7] as DateTime?,
      gender: fields[8] as String?,
      address: fields[9] as String?,
      specialization: fields[10] as String?,
      qualification: fields[11] as String?,
      experience: fields[12] as int?,
      fees: fields[13] as String?,
      availableSlots: fields[14] as String?,
      role: fields[15] as String?,
      description: fields[16] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, DoctorHiveModel obj) {
    writer
      ..writeByte(17)
      ..writeByte(0)
      ..write(obj.doctorId)
      ..writeByte(1)
      ..write(obj.username)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.password)
      ..writeByte(4)
      ..write(obj.contactNo)
      ..writeByte(5)
      ..write(obj.image)
      ..writeByte(6)
      ..write(obj.fullname)
      ..writeByte(7)
      ..write(obj.dob)
      ..writeByte(8)
      ..write(obj.gender)
      ..writeByte(9)
      ..write(obj.address)
      ..writeByte(10)
      ..write(obj.specialization)
      ..writeByte(11)
      ..write(obj.qualification)
      ..writeByte(12)
      ..write(obj.experience)
      ..writeByte(13)
      ..write(obj.fees)
      ..writeByte(14)
      ..write(obj.availableSlots)
      ..writeByte(15)
      ..write(obj.role)
      ..writeByte(16)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DoctorHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
