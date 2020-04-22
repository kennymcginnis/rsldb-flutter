import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:rsldb/helpers/service_utils.dart';
import 'package:rsldb/main.dart';
import 'package:rsldb/models/champion.dart';
import 'package:rsldb/routes/app_state.dart';

part 'user_champion.g.dart';

@JsonSerializable()
class UserChampion {
  final String uid;
  final String user;
  final String champion;

  final int acquired;
  final int rank;
  final int ascension;

  final Map<String, int> ratings;

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
      user: documentSnapshot.data['user'] as String,
      champion: documentSnapshot.data['champion'] as String,
      acquired: documentSnapshot.data['acquired'] as int,
      rank: documentSnapshot.data['rank'] as int,
      ascension: documentSnapshot.data['ascension'] as int,
      ratings: documentSnapshot.data['ratings'] as Map<String, dynamic>,
    );
  }

  factory UserChampion.fromChampion(Champion champion) {
    final application = sl.get<AppState>();
    return UserChampion(
      user: application.currentUserUID,
      champion: champion.uid,
      acquired: 0,
      rank: defaultRank(application.codeNameMap[champion.attributes["rarity"]].name),
      ascension: 0,
      ratings: new Map<String, int>(),
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
