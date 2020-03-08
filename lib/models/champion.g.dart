// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'champion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Champion _$ChampionFromJson(Map<String, dynamic> json) {
  return Champion(
    uid: json['uid'] as String,
    name: json['name'] as String,
    attributes: json['attributes'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$ChampionToJson(Champion instance) => <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'attributes': instance.attributes,
    };
