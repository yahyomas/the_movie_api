// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favourite_movie.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavouriteMovieAdapter extends TypeAdapter<FavouriteMovie> {
  @override
  final int typeId = 1;

  @override
  FavouriteMovie read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavouriteMovie(
      image: fields[2] as String,
      title: fields[1] as String,
      voteAverage: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FavouriteMovie obj) {
    writer
      ..writeByte(3)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.image)
      ..writeByte(3)
      ..write(obj.voteAverage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavouriteMovieAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
