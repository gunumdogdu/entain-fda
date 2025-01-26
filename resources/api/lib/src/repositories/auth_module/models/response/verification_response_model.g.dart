// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verification_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerificationResponseModel _$VerificationResponseModelFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'VerificationResponseModel',
      json,
      ($checkedConvert) {
        final val = VerificationResponseModel(
          token: $checkedConvert('token', (v) => v as String?),
          data: $checkedConvert(
              'data',
              (v) => v == null
                  ? null
                  : VerificationResponseData.fromJson(
                      v as Map<String, dynamic>)),
          complete: $checkedConvert('complete', (v) => v as bool?),
        );
        return val;
      },
    );

Map<String, dynamic> _$VerificationResponseModelToJson(
        VerificationResponseModel instance) =>
    <String, dynamic>{
      'token': instance.token,
      'data': instance.data,
      'complete': instance.complete,
    };

VerificationResponseData _$VerificationResponseDataFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'VerificationResponseData',
      json,
      ($checkedConvert) {
        final val = VerificationResponseData(
          id: $checkedConvert('id', (v) => v as String?),
          partnerId: $checkedConvert('partner_id', (v) => (v as num?)?.toInt()),
          name: $checkedConvert('name', (v) => v as String?),
          surname: $checkedConvert('surname', (v) => v as String?),
          phone: $checkedConvert('phone', (v) => v as String?),
          email: $checkedConvert('email', (v) => v as String?),
          role: $checkedConvert('role', (v) => v as String?),
          lastLogin: $checkedConvert('last_login', (v) => v as String?),
          isActive: $checkedConvert('is_active', (v) => v as bool?),
          expires: $checkedConvert('expires', (v) => v as String?),
          deletedAt: $checkedConvert('deleted_at', (v) => v as String?),
          client: $checkedConvert('client', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'partnerId': 'partner_id',
        'lastLogin': 'last_login',
        'isActive': 'is_active',
        'deletedAt': 'deleted_at'
      },
    );

Map<String, dynamic> _$VerificationResponseDataToJson(
        VerificationResponseData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'partner_id': instance.partnerId,
      'name': instance.name,
      'surname': instance.surname,
      'phone': instance.phone,
      'email': instance.email,
      'role': instance.role,
      'last_login': instance.lastLogin,
      'is_active': instance.isActive,
      'expires': instance.expires,
      'deleted_at': instance.deletedAt,
      'client': instance.client,
    };
