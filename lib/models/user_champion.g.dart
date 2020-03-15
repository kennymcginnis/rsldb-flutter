// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_champion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserChampion _$UserChampionFromJson(Map<String, dynamic> json) {
  return UserChampion(
    uid: json['uid'] as String,
    user: json['user'] as String,
    champion: json['champion'] as String,
    acquired: json['acquired'] as int,
    rank: json['rank'] as int,
    ascension: json['ascension'] as int,
    ratings: (json['ratings'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as int),
    ),
  );
}

Map<String, dynamic> _$UserChampionToJson(UserChampion instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'user': instance.user,
      'champion': instance.champion,
      'acquired': instance.acquired,
      'rank': instance.rank,
      'ascension': instance.ascension,
      'ratings': instance.ratings,
    };
