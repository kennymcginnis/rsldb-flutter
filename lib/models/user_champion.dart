import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:rsldb/models/champion.dart';
import 'package:rsldb/models/ratings.dart';
import 'package:rsldb/models/user.dart';

part 'user_champion.g.dart';

@JsonSerializable()
class UserChampion {
  final String uid;
  final User user;
  final Champion champion;

  final bool acquired;
  final int rank;
  final int ascension;
  final Ratings ratings;

  UserChampion({
    this.uid,
    this.user,
    this.champion,
    this.acquired,
    this.rank,
    this.ascension,
    this.ratings,
  });

  Map<String, dynamic> toJson() => _$UserChampionToJson(this);

  factory UserChampion.fromJson(Map<String, dynamic> json) => _$UserChampionFromJson(json);

  factory UserChampion.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    return UserChampion(
      uid: documentSnapshot.documentID,
      user: documentSnapshot.data['user'] == null
          ? null
          : User.fromJson(documentSnapshot.data['user'] as Map<String, dynamic>),
      champion: documentSnapshot.data['champion'] == null
          ? null
          : Champion.fromJson(documentSnapshot.data['champion'] as Map<String, dynamic>),
      acquired: documentSnapshot.data['acquired'] as bool,
      rank: documentSnapshot.data['rank'] as int,
      ascension: documentSnapshot.data['ascension'] as int,
      ratings: documentSnapshot.data['ratings'] == null
          ? null
          : Ratings.fromJson(documentSnapshot.data['ratings'] as Map<String, dynamic>),
    );
  }

  UserChampion copyWith({uid, userName, lastName, email, avatar, groups}) {
    return UserChampion(
      uid: uid ?? this.uid,
      user: user ?? this.user,
      champion: champion ?? this.champion,
      acquired: acquired ?? this.acquired,
      rank: rank ?? this.rank,
      ascension: ascension ?? this.ascension,
      ratings: ratings ?? this.ratings,
    );
  }
}
