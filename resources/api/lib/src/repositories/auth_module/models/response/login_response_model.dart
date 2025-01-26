import 'package:api/src/repositories/service/client/model/base/base_parse_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_response_model.g.dart';

@JsonSerializable(
  checked: true,
  disallowUnrecognizedKeys: true,
  fieldRename: FieldRename.snake,
)
class LoginResponseModel extends IBaseModel<LoginResponseModel> {
  LoginResponseModel({
    this.transactionId,
    this.completed,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);

  @JsonKey(name: 'transaction_id')
  final String? transactionId;

  @JsonKey(name: 'completed')
  final bool? completed;

  @override
  Map<String, dynamic> toJson() => _$LoginResponseModelToJson(this);

  @override
  LoginResponseModel fromJson(Map<String, dynamic> json) =>
      LoginResponseModel.fromJson(json);
}
