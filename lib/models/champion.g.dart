// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'champion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Champion _$ChampionFromJson(Map<String, dynamic> json) {
  return Champion(
    uid: json['uid'] as String,
    name: json['name'] as String,
    faction: json['faction'] as String,
    affinity: json['affinity'] as String,
  );
}

Map<String, dynamic> _$ChampionToJson(Champion instance) => <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'faction': instance.faction,
      'affinity': instance.affinity,
    };
