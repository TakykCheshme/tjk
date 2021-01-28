// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductAdapter extends TypeAdapter<Product> {
  @override
  final int typeId = 0;

  @override
  Product read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Product()
      .._id = fields[0] as int
      .._name = fields[1] as String
      .._price = fields[2] as double
      .._reference = fields[3] as String
      .._brand = fields[4] as String
      .._cover = fields[5] as String;
  }

  @override
  void write(BinaryWriter writer, Product obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj._id)
      ..writeByte(1)
      ..write(obj._name)
      ..writeByte(2)
      ..write(obj._price)
      ..writeByte(3)
      ..write(obj._reference)
      ..writeByte(4)
      ..write(obj._brand)
      ..writeByte(5)
      ..write(obj._cover);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
