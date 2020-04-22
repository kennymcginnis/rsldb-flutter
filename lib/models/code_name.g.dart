// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'code_name.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CodeName _$CodeNameFromJson(Map<String, dynamic> json) {
  return CodeName(
    uid: json['uid'] as String,
    type: json['type'] as String,
    subtype: json['subtype'] as String,
    name: json['name'] as String,
    description: json['description'] as String,
    url: json['url'] as String,
    order: json['order'] as int,
    children: (json['children'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$CodeNameToJson(CodeName instance) => <String, dynamic>{
      'uid': instance.uid,
      'type': instance.type,
      'subtype': instance.subtype,
      'name': instance.name,
      'description': instance.description,
      'url': instance.url,
      'order': instance.order,
      'children': instance.children,
    };
