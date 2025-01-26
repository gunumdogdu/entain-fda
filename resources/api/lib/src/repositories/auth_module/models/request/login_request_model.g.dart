// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRequestModel _$LoginRequestModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'LoginRequestModel',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const ['phone'],
          requiredKeys: const ['phone'],
        );
        final val = LoginRequestModel(
          phone: $checkedConvert('phone', (v) => v as String),
        );
        return val;
      },
    );

Map<String, dynamic> _$LoginRequestModelToJson(LoginRequestModel instance) =>
    <String, dynamic>{
      'phone': instance.phone,
    };
