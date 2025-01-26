import 'package:api/src/repositories/service/client/model/base/base_parse_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'current_user_response_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CurrentUserResponseModel extends IBaseModel<CurrentUserResponseModel> {
  CurrentUserResponseModel({
    this.id,
    this.partnerId,
    this.profileId,
    this.name,
    this.phone,
    this.email,
    this.roleCode,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.lastLogin,
  });

  final String? id;
  final int? partnerId;
  final String? profileId;
  final String? name;
  final String? phone;
  final String? email;
  final String? roleCode;
  final bool? isActive;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;
  final DateTime? lastLogin;

  factory CurrentUserResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CurrentUserResponseModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CurrentUserResponseModelToJson(this);

  @override
  CurrentUserResponseModel fromJson(Map<String, dynamic> json) =>
      CurrentUserResponseModel.fromJson(json);
}
