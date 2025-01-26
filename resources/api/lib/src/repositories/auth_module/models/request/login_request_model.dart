import 'package:api/src/repositories/service/client/model/base/base_parse_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_request_model.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: true,
  fieldRename: FieldRename.snake,
)
class LoginRequestModel extends IBaseModel<LoginRequestModel> {
  LoginRequestModel({
    required this.phone,
  });

  factory LoginRequestModel.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestModelFromJson(json);

  @JsonKey(required: true)
  final String phone;

  @override
  Map<String, dynamic> toJson() => _$LoginRequestModelToJson(this);

  @override
  LoginRequestModel fromJson(Map<String, dynamic> json) =>
      LoginRequestModel.fromJson(json);
}
