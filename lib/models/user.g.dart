// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    uid: json['uid'] as String,
    userName: json['userName'] as String,
    email: json['email'] as String,
    champions: (json['champions'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k, e == null ? null : Champion.fromJson(e as Map<String, dynamic>)),
    ),
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
      'userName': instance.userName,
      'champions': instance.champions,
    };
