import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:rsldb/models/champion.dart';
import 'package:rsldb/models/user_champion.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final String uid;
  final String email;
  final String userName;
  final Map<String, Champion> champions;

  // Grinding
  final List<String> campaign;
  final List<String> arenaDefense;
  final List<String> arenaOffense;
  final List<String> clanBoss;
  final List<String> factionWars;

  // Dungeons
  final List<String> minotaursLabyrinth;
  final List<String> spidersDen;
  final List<String> fireKnightsCastle;
  final List<String> dragonsLair;
  final List<String> iceGolemsPeak;

  // Potion
  final List<String> voidKeep;
  final List<String> forceKeep;
  final List<String> spiritKeep;
  final List<String> magicKeep;

  User({
    this.uid,
    this.userName,
    this.email,
    this.champions,
    this.campaign,
    this.arenaDefense,
    this.arenaOffense,
    this.clanBoss,
    this.factionWars,
    this.minotaursLabyrinth,
    this.spidersDen,
    this.fireKnightsCastle,
    this.dragonsLair,
    this.iceGolemsPeak,
    this.voidKeep,
    this.forceKeep,
    this.spiritKeep,
    this.magicKeep,
  });

  Map<String, dynamic> toJson() => _$UserToJson(this);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  factory User.fromFirebase(FirebaseUser firebaseUser) {
    return User(uid: firebaseUser.uid, email: firebaseUser.email);
  }

  factory User.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    return User(
      uid: documentSnapshot.documentID,
      email: documentSnapshot.data['email'] as String,
      userName: documentSnapshot.data['userName'] as String,
    );
  }

  User copyWith({uid, userName, lastName, email, avatar, groups}) {
    return User(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      userName: userName ?? this.userName,
      champions: champions ?? this.champions,
    );
  }
}
