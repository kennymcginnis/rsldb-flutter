import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'champion.g.dart';

@JsonSerializable()
class Champion {
  final String uid;
  final String name;
  final String faction;
  final String affinity;

  Champion({this.uid, this.name, this.faction, this.affinity});

  Map<String, dynamic> toJson() => _$ChampionToJson(this);

  factory Champion.fromJson(Map<String, dynamic> json) => _$ChampionFromJson(json);

  factory Champion.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    return Champion(
      uid: documentSnapshot.documentID,
      name: documentSnapshot.data['name'],
      faction: documentSnapshot.data['faction'],
      affinity: documentSnapshot.data['affinity'],
    );
  }

  Champion copyWith({uid, name, faction, status, dateTime}) {
    return Champion(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      faction: faction ?? this.faction,
      affinity: dateTime ?? this.affinity,
    );
  }
}
