// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Person.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Person _$PersonFromJson(Map<String, dynamic> json) {
  return Person(
      json['name'] as String,
      json['email'] as String,
      json['mother'] == null
          ? null
          : Person.fromJson(json['mother'] as Map<String, dynamic>),
      (json['friends'] as List)
          ?.map((e) =>
              e == null ? null : Person.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$PersonToJson(Person instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'mother': instance.mother,
      'friends': instance.friends
    };
