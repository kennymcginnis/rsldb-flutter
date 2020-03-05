import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'role.g.dart';

@JsonSerializable()
class Role {
  final String uid;
  final String name;

  Role({this.uid, this.name});

  factory Role.fromJson(Map<String, dynamic> json) => _$RoleFromJson(json);

  Map<String, dynamic> toJson() => _$RoleToJson(this);

  factory Role.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    return Role(
      uid: documentSnapshot.documentID,
      name: documentSnapshot.data['name'] as String,
    );
  }

  Role copyWith(Role role) {
    return Role(
      uid: role.uid ?? this.uid,
      name: role.name ?? this.name,
    );
  }
}
