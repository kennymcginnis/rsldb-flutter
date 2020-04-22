// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'champion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Champion _$ChampionFromJson(Map<String, dynamic> json) {
  return Champion(
    uid: json['uid'] as String,
    name: json['name'] as String,
    image: json['image'] as String,
    avatar: json['avatar'] as String,
    attributes: json['attributes'] as Map<String, dynamic>,
  );
}

Map<String, dynamic> _$ChampionToJson(Champion instance) => <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'image': instance.image,
      'avatar': instance.avatar,
      'attributes': instance.attributes,
    };
