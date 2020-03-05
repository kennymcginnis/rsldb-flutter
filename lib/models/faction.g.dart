// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Faction _$FactionFromJson(Map<String, dynamic> json) {
  return Faction(
    uid: json['uid'] as String,
    name: json['name'] as String,
    image: json['image'] as String,
  );
}

Map<String, dynamic> _$FactionToJson(Faction instance) => <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'image': instance.image,
    };
