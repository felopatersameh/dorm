import 'package:hive/hive.dart';
import 'dorms_model.dart';

class DormsModelAdapter extends TypeAdapter<DormsModel> {
  @override
  final int typeId = 0;

  @override
  DormsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DormsModel(
      id: fields[0] as int,
      name: fields[1] as String,
      rating: fields[2] as String,
      images: (fields[3] as List).cast<String>(),
      description: fields[4] as String,
      address: fields[5] as String?,
      icerik: fields[6] as String,
      icerik2: fields[7] as String,
      imkan1: fields[8] as String,
      imkan2: fields[9] as String,
      latitude: fields[10] as String,
      longitude: fields[11] as String,
      budget: fields[12] as int,
      roomType: fields[13] as String,
      dormType: fields[14] as String,
      isFeatured: fields[15] as int,
      price: fields[16] as int?,
      city: fields[17] as String,
      googlePlaceId: fields[18] as String?,
      ownerId: fields[19] as int?,
      createdAt: fields[20] as DateTime?,
      updatedAt: fields[21] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, DormsModel obj) {
    writer
      ..writeByte(22)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.rating)
      ..writeByte(3)
      ..write(obj.images)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.address)
      ..writeByte(6)
      ..write(obj.icerik)
      ..writeByte(7)
      ..write(obj.icerik2)
      ..writeByte(8)
      ..write(obj.imkan1)
      ..writeByte(9)
      ..write(obj.imkan2)
      ..writeByte(10)
      ..write(obj.latitude)
      ..writeByte(11)
      ..write(obj.longitude)
      ..writeByte(12)
      ..write(obj.budget)
      ..writeByte(13)
      ..write(obj.roomType)
      ..writeByte(14)
      ..write(obj.dormType)
      ..writeByte(15)
      ..write(obj.isFeatured)
      ..writeByte(16)
      ..write(obj.price)
      ..writeByte(17)
      ..write(obj.city)
      ..writeByte(18)
      ..write(obj.googlePlaceId)
      ..writeByte(19)
      ..write(obj.ownerId)
      ..writeByte(20)
      ..write(obj.createdAt)
      ..writeByte(21)
      ..write(obj.updatedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DormsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
