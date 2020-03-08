import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'champion.g.dart';

@JsonSerializable()
class Champion {
  final String uid;
  final String name;

  final Map<String, dynamic> attributes;

  Champion({this.uid, this.name, this.attributes});

  Map<String, dynamic> toJson() => _$ChampionToJson(this);

  factory Champion.fromJson(Map<String, dynamic> json) => _$ChampionFromJson(json);

  factory Champion.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    return Champion(
      uid: documentSnapshot.documentID,
      name: documentSnapshot.data['name'],
      attributes: documentSnapshot.data['attributes'],
    );
  }

  Champion copyWith({uid, name, attributes, status, dateTime}) {
    return Champion(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      attributes: attributes ?? this.attributes,
    );
  }
}
