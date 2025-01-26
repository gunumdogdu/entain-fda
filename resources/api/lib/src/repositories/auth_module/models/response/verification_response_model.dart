import 'package:api/src/repositories/service/client/model/base/base_parse_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'verification_response_model.g.dart';

@JsonSerializable(
    checked: true, createToJson: true, fieldRename: FieldRename.snake)
class VerificationResponseModel extends IBaseModel<VerificationResponseModel> {
  VerificationResponseModel({
    this.token,
    this.data,
    this.complete,
  });

  factory VerificationResponseModel.fromJson(Map<String, dynamic> json) =>
      _$VerificationResponseModelFromJson(json);

  final String? token;
  final VerificationResponseData? data;
  final bool? complete;

  @override
  VerificationResponseModel fromJson(Map<String, dynamic> json) =>
      VerificationResponseModel.fromJson(json);

  @override
  Map<String, dynamic> toJson() => _$VerificationResponseModelToJson(this);
}

@JsonSerializable(
    checked: true, createToJson: true, fieldRename: FieldRename.snake)
class VerificationResponseData extends IBaseModel<VerificationResponseData> {
  VerificationResponseData({
    this.id,
    this.partnerId,
    this.name,
    this.surname,
    this.phone,
    this.email,
    this.role,
    this.lastLogin,
    this.isActive,
    this.expires,
    this.deletedAt,
    this.client,
  });

  factory VerificationResponseData.fromJson(Map<String, dynamic> json) =>
      _$VerificationResponseDataFromJson(json);

  final String? id;
  final int? partnerId;
  final String? name;
  final String? surname;
  final String? phone;
  final String? email;
  final String? role;
  final String? lastLogin;
  final bool? isActive;
  final String? expires;
  final String? deletedAt;
  final String? client;

  @override
  VerificationResponseData fromJson(Map<String, dynamic> json) =>
      VerificationResponseData.fromJson(json);

  @override
  Map<String, dynamic> toJson() => _$VerificationResponseDataToJson(this);
}
