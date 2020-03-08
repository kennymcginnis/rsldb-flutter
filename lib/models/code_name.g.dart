// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'code_name.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CodeName _$CodeNameFromJson(Map<String, dynamic> json) {
  return CodeName(
    uid: json['uid'] as String,
    type: json['type'] as String,
    name: json['name'] as String,
    url: json['url'] as String,
  );
}

Map<String, dynamic> _$CodeNameToJson(CodeName instance) => <String, dynamic>{
      'uid': instance.uid,
      'type': instance.type,
      'name': instance.name,
      'url': instance.url,
    };
