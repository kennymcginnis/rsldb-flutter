import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'code_name.g.dart';

@JsonSerializable()
class CodeName {
  final String uid;
  final String type;
  final String subtype;
  final String name;
  final String description;
  final String url;
  final int order;
  final List<String> children;

  CodeName({
    this.uid,
    this.type,
    this.subtype,
    this.name,
    this.description,
    this.url,
    this.order,
    this.children,
  });

  factory CodeName.fromJson(Map<String, dynamic> json) => _$CodeNameFromJson(json);

  Map<String, dynamic> toJson() => _$CodeNameToJson(this);

  factory CodeName.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    return CodeName(
      uid: documentSnapshot.documentID,
      type: documentSnapshot.data['type'] as String,
      subtype: documentSnapshot.data['subtype'] as String,
      name: documentSnapshot.data['name'] as String,
      description: documentSnapshot.data['description'] as String,
      url: documentSnapshot.data['url'] as String,
      order: documentSnapshot.data['order'] as int,
      children: (documentSnapshot.data['children'] as List)?.map((e) => e as String)?.toList(),
    );
  }

  CodeName copyWith(CodeName codeName) {
    return CodeName(
      uid: codeName.uid ?? this.uid,
      type: codeName.type ?? this.type,
      subtype: codeName.subtype ?? this.subtype,
      name: codeName.name ?? this.name,
      description: codeName.description ?? this.description,
      url: codeName.url ?? this.url,
      order: codeName.order ?? this.order,
      children: codeName.children ?? this.children,
    );
  }
}
