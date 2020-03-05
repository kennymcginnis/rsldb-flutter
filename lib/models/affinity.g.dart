// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'affinity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Affinity _$AffinityFromJson(Map<String, dynamic> json) {
  return Affinity(
    uid: json['uid'] as String,
    name: json['name'] as String,
    image: json['image'] as String,
  );
}

Map<String, dynamic> _$AffinityToJson(Affinity instance) => <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'image': instance.image,
    };
