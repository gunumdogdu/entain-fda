// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponseModel _$LoginResponseModelFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'LoginResponseModel',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const ['transaction_id', 'completed'],
        );
        final val = LoginResponseModel(
          transactionId: $checkedConvert('transaction_id', (v) => v as String?),
          completed: $checkedConvert('completed', (v) => v as bool?),
        );
        return val;
      },
      fieldKeyMap: const {'transactionId': 'transaction_id'},
    );

Map<String, dynamic> _$LoginResponseModelToJson(LoginResponseModel instance) =>
    <String, dynamic>{
      'transaction_id': instance.transactionId,
      'completed': instance.completed,
    };
