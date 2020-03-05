import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'faction.g.dart';

@JsonSerializable()
class Faction {
  final String uid;
  final String name;
  final String image;

  Faction({this.uid, this.name, this.image});

  factory Faction.fromJson(Map<String, dynamic> json) => _$FactionFromJson(json);

  Map<String, dynamic> toJson() => _$FactionToJson(this);

  factory Faction.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    return Faction(
      uid: documentSnapshot.documentID,
      name: documentSnapshot.data['name'] as String,
      image: documentSnapshot.data['image'] as String,
    );
  }

  Faction copyWith(Faction faction) {
    return Faction(
      uid: faction.uid ?? this.uid,
      name: faction.name ?? this.name,
      image: faction.image ?? this.image,
    );
  }
}
