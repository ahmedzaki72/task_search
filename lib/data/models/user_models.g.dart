// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModelsData _$UserModelsDataFromJson(Map<String, dynamic> json) =>
    UserModelsData(
      userId: json['user_id'] as int?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      fullName: json['full_name'] as String?,
      gender: json['gender'] as String?,
      age: json['age'] as int?,
    );

Map<String, dynamic> _$UserModelsDataToJson(UserModelsData instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'full_name': instance.fullName,
      'gender': instance.gender,
      'age': instance.age,
    };
