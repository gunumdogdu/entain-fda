import 'package:api/src/repositories/service/client/model/base/base_parse_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'companies_response_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CompaniesResponseModel extends IBaseModel<CompaniesResponseModel> {
  CompaniesResponseModel({
    this.page,
    this.limit,
    this.data,
    this.totalCount,
    this.totalPage,
    this.lastPage,
    this.prevPage,
    this.nextPage,
  });

  factory CompaniesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CompaniesResponseModelFromJson(json);

  final int? page;
  final int? limit;
  final List<CompanyData>? data;
  final int? totalCount;
  final int? totalPage;
  final int? lastPage;
  final int? prevPage;
  final int? nextPage;

  @override
  Map<String, dynamic> toJson() => _$CompaniesResponseModelToJson(this);

  @override
  CompaniesResponseModel fromJson(Map<String, dynamic> json) =>
      CompaniesResponseModel.fromJson(json);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class CompanyData {
  CompanyData({
    this.id,
    this.accountCode,
    this.name,
    this.salesPartnerId,
    this.technicalPartnerId,
    this.taxNumber,
    this.isActive,
    this.brands,
    this.activeBranchCount,
    this.deactiveBranchCount,
    this.totalBranchCount,
  });

  factory CompanyData.fromJson(Map<String, dynamic> json) =>
      _$CompanyDataFromJson(json);

  final String? id;
  final String? accountCode;
  final String? name;
  final int? salesPartnerId;
  final int? technicalPartnerId;
  final String? taxNumber;
  final bool? isActive;
  final CompanyBrand? brands;
  final int? activeBranchCount;
  final int? deactiveBranchCount;
  final int? totalBranchCount;

  Map<String, dynamic> toJson() => _$CompanyDataToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class CompanyBrand {
  CompanyBrand({
    this.id,
    this.brandName,
    this.brandCode,
  });

  factory CompanyBrand.fromJson(Map<String, dynamic> json) =>
      _$CompanyBrandFromJson(json);

  final String? id;
  final String? brandName;
  final String? brandCode;

  Map<String, dynamic> toJson() => _$CompanyBrandToJson(this);
}
