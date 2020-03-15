// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'champion_ability.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChampionAbility _$ChampionAbilityFromJson(Map<String, dynamic> json) {
  return ChampionAbility(
    uid: json['uid'] as String,
    champion: json['champion'] as String,
    ability: json['ability'] as String,
    location: json['location'] as String,
    target: json['target'] as String,
    value: json['value'] as String,
  );
}

Map<String, dynamic> _$ChampionAbilityToJson(ChampionAbility instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'champion': instance.champion,
      'ability': instance.ability,
      'location': instance.location,
      'target': instance.target,
      'value': instance.value,
    };
