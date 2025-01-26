import 'package:api/src/repositories/service/client/model/base/base_parse_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'verification_request_model.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: true,
  fieldRename: FieldRename.snake,
)
class VerificationRequestModel extends IBaseModel<VerificationRequestModel> {
  VerificationRequestModel({
    required this.transactionId,
    required this.otpCode,
  });

  factory VerificationRequestModel.fromJson(Map<String, dynamic> json) =>
      _$VerificationRequestModelFromJson(json);

  @JsonKey(name: 'transaction_id', required: true)
  final String transactionId;

  @JsonKey(name: 'otp_code', required: true)
  final String otpCode;

  @override
  Map<String, dynamic> toJson() => _$VerificationRequestModelToJson(this);

  @override
  VerificationRequestModel fromJson(Map<String, dynamic> json) =>
      VerificationRequestModel.fromJson(json);
}
