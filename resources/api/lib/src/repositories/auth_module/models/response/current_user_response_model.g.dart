// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_user_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentUserResponseModel _$CurrentUserResponseModelFromJson(
        Map<String, dynamic> json) =>
    CurrentUserResponseModel(
      id: json['id'] as String?,
      partnerId: (json['partner_id'] as num?)?.toInt(),
      profileId: json['profile_id'] as String?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      roleCode: json['role_code'] as String?,
      isActive: json['is_active'] as bool?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'] == null
          ? null
          : DateTime.parse(json['deleted_at'] as String),
      lastLogin: json['last_login'] == null
          ? null
          : DateTime.parse(json['last_login'] as String),
    );

Map<String, dynamic> _$CurrentUserResponseModelToJson(
        CurrentUserResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'partner_id': instance.partnerId,
      'profile_id': instance.profileId,
      'name': instance.name,
      'phone': instance.phone,
      'email': instance.email,
      'role_code': instance.roleCode,
      'is_active': instance.isActive,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'deleted_at': instance.deletedAt?.toIso8601String(),
      'last_login': instance.lastLogin?.toIso8601String(),
    };
