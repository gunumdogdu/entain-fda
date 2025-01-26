// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verification_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerificationRequestModel _$VerificationRequestModelFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'VerificationRequestModel',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const ['transaction_id', 'otp_code'],
          requiredKeys: const ['transaction_id', 'otp_code'],
        );
        final val = VerificationRequestModel(
          transactionId: $checkedConvert('transaction_id', (v) => v as String),
          otpCode: $checkedConvert('otp_code', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {
        'transactionId': 'transaction_id',
        'otpCode': 'otp_code'
      },
    );

Map<String, dynamic> _$VerificationRequestModelToJson(
        VerificationRequestModel instance) =>
    <String, dynamic>{
      'transaction_id': instance.transactionId,
      'otp_code': instance.otpCode,
    };
