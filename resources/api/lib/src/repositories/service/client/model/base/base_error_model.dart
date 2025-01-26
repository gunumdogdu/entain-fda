import 'package:api/src/repositories/service/client/index.dart';

/// Base error model for parsing api errors.
class BaseErrorModel extends IBaseModel<BaseErrorModel> {
  /// Constructor
  BaseErrorModel({
    this.errorCode,
    this.message,
    this.items,
  });

  /// Error code that represent that response code of the request
  String? errorCode;

  String? items;

  /// Message that represent that reason of the error
  String? message;

  @override
  BaseErrorModel fromJson(Map<String, dynamic> json) => BaseErrorModel(
        errorCode: json['error_code'] as String?,
        message: json['message'] as String?,
        items: json['items'] as String?,
      );

  @override
  Map<String, dynamic> toJson() => {
        'error_code': errorCode,
        'message': message,
        'items': items,
      };
}
