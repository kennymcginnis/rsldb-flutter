// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_champion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserChampion _$UserChampionFromJson(Map<String, dynamic> json) {
  return UserChampion(
    uid: json['uid'] as String,
    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
    champion: json['champion'] == null
        ? null
        : Champion.fromJson(json['champion'] as Map<String, dynamic>),
    acquired: json['acquired'] as bool,
    rank: json['rank'] as int,
    ascension: json['ascension'] as int,
    ratings: json['ratings'] == null
        ? null
        : Ratings.fromJson(json['ratings'] as Map<String, dynamic>),
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
