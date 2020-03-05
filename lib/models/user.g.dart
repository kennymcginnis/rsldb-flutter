// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    uid: json['uid'] as String,
    userName: json['userName'] as String,
    email: json['email'] as String,
    champions: (json['champions'] as List)
        ?.map((e) =>
            e == null ? null : UserChampion.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    campaign: (json['campaign'] as List)?.map((e) => e as String)?.toList(),
    arenaDefense:
        (json['arenaDefense'] as List)?.map((e) => e as String)?.toList(),
    arenaOffense:
        (json['arenaOffense'] as List)?.map((e) => e as String)?.toList(),
    clanBoss: (json['clanBoss'] as List)?.map((e) => e as String)?.toList(),
    factionWars:
        (json['factionWars'] as List)?.map((e) => e as String)?.toList(),
    minotaursLabyrinth:
        (json['minotaursLabyrinth'] as List)?.map((e) => e as String)?.toList(),
    spidersDen: (json['spidersDen'] as List)?.map((e) => e as String)?.toList(),
    fireKnightsCastle:
        (json['fireKnightsCastle'] as List)?.map((e) => e as String)?.toList(),
    dragonsLair:
        (json['dragonsLair'] as List)?.map((e) => e as String)?.toList(),
    iceGolemsPeak:
        (json['iceGolemsPeak'] as List)?.map((e) => e as String)?.toList(),
    voidKeep: (json['voidKeep'] as List)?.map((e) => e as String)?.toList(),
    forceKeep: (json['forceKeep'] as List)?.map((e) => e as String)?.toList(),
    spiritKeep: (json['spiritKeep'] as List)?.map((e) => e as String)?.toList(),
    magicKeep: (json['magicKeep'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
      'userName': instance.userName,
      'champions': instance.champions,
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
