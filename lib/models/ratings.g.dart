// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ratings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ratings _$RatingsFromJson(Map<String, dynamic> json) {
  return Ratings(
    uid: json['uid'] as String,
    campaign: json['campaign'] as int,
    arenaDefense: json['arenaDefense'] as int,
    arenaOffense: json['arenaOffense'] as int,
    clanBoss: json['clanBoss'] as int,
    factionWars: json['factionWars'] as int,
    minotaursLabyrinth: json['minotaursLabyrinth'] as int,
    spidersDen: json['spidersDen'] as int,
    fireKnightsCastle: json['fireKnightsCastle'] as int,
    dragonsLair: json['dragonsLair'] as int,
    iceGolemsPeak: json['iceGolemsPeak'] as int,
    voidKeep: json['voidKeep'] as int,
    forceKeep: json['forceKeep'] as int,
    spiritKeep: json['spiritKeep'] as int,
    magicKeep: json['magicKeep'] as int,
  );
}

Map<String, dynamic> _$RatingsToJson(Ratings instance) => <String, dynamic>{
      'uid': instance.uid,
      'campaign': instance.campaign,
      'arenaDefense': instance.arenaDefense,
      'arenaOffense': instance.arenaOffense,
      'clanBoss': instance.clanBoss,
      'factionWars': instance.factionWars,
      'minotaursLabyrinth': instance.minotaursLabyrinth,
      'spidersDen': instance.spidersDen,
      'fireKnightsCastle': instance.fireKnightsCastle,
      'dragonsLair': instance.dragonsLair,
      'iceGolemsPeak': instance.iceGolemsPeak,
      'voidKeep': instance.voidKeep,
      'forceKeep': instance.forceKeep,
      'spiritKeep': instance.spiritKeep,
      'magicKeep': instance.magicKeep,
    };
