import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:rsldb/models/champion.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final String uid;
  final String email;
  final String userName;
  final Map<String, Champion> champions;

  User({
    this.uid,
    this.userName,
    this.email,
    this.champions,
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
