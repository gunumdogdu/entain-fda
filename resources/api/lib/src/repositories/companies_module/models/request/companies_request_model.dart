import 'package:api/src/repositories/service/client/model/base/base_parse_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'companies_request_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CompaniesRequestModel extends IBaseModel<CompaniesRequestModel> {
  CompaniesRequestModel({
    this.page,
    this.limit,
    this.keyword,
    this.sort,
  });

  factory CompaniesRequestModel.fromJson(Map<String, dynamic> json) =>
      _$CompaniesRequestModelFromJson(json);

  final int? page;
  final int? limit;
  final String? keyword;
  final String? sort;

  @override
  Map<String, dynamic> toJson() {
    final json = _$CompaniesRequestModelToJson(this);
    return {
      if (page != null) 'page': page.toString(),
      if (limit != null) 'limit': limit.toString(),
      if (keyword != null) 'keyword': keyword,
      if (sort != null) 'sort': sort,
    };
  }

  @override
  CompaniesRequestModel fromJson(Map<String, dynamic> json) =>
      CompaniesRequestModel.fromJson(json);
}
