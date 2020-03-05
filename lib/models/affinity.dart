import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'affinity.g.dart';

@JsonSerializable()
class Affinity {
  final String uid;
  final String name;
  final String image;

  Affinity({this.uid, this.name, this.image});

  factory Affinity.fromJson(Map<String, dynamic> json) => _$AffinityFromJson(json);

  Map<String, dynamic> toJson() => _$AffinityToJson(this);

  factory Affinity.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    return Affinity(
      uid: documentSnapshot.documentID,
      name: documentSnapshot.data['name'] as String,
      image: documentSnapshot.data['image'] as String,
    );
  }

  Affinity copyWith(Affinity affinity) {
    return Affinity(
      uid: affinity.uid ?? this.uid,
      name: affinity.name ?? this.name,
      image: affinity.image ?? this.image,
    );
  }
}
