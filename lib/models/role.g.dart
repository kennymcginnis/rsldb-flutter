// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'role.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Role _$RoleFromJson(Map<String, dynamic> json) {
  return Role(
    uid: json['uid'] as String,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$RoleToJson(Role instance) => <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
    };
