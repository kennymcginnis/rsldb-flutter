import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_champion.g.dart';

@JsonSerializable()
class UserChampion {
  final String uid;
  final String user;
  final String champion;

  final int acquired;
  final int rank;
  final int ascension;

  final Map<String, dynamic> ratings;

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
      rank: documentSnapshot.data['rank'] as int,
      ascension: documentSnapshot.data['ascension'] as int,
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
