import 'package:cloud_firestore/cloud_firestore.dart';

class CodeName {
  final String uid;
  final String type;
  final String name;
  final String url;

  CodeName({this.uid, this.type, this.name, this.url});

  factory CodeName.fromJson(Map<String, dynamic> json) => _$CodeNameFromJson(json);

  Map<String, dynamic> toJson() => _$CodeNameToJson(this);

  factory CodeName.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    return CodeName(
      uid: documentSnapshot.documentID,
      name: documentSnapshot.data['name'] as String,
      url: documentSnapshot.data['url'] as String,
    );
  }

  CodeName copyWith(CodeName codeName) {
    return CodeName(
      uid: codeName.uid ?? this.uid,
      name: codeName.name ?? this.name,
      url: codeName.url ?? this.url,
    );
  }
}