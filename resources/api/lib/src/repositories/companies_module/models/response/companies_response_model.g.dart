// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'companies_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompaniesResponseModel _$CompaniesResponseModelFromJson(
        Map<String, dynamic> json) =>
    CompaniesResponseModel(
      page: (json['page'] as num?)?.toInt(),
      limit: (json['limit'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => CompanyData.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalCount: (json['total_count'] as num?)?.toInt(),
      totalPage: (json['total_page'] as num?)?.toInt(),
      lastPage: (json['last_page'] as num?)?.toInt(),
      prevPage: (json['prev_page'] as num?)?.toInt(),
      nextPage: (json['next_page'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CompaniesResponseModelToJson(
        CompaniesResponseModel instance) =>
    <String, dynamic>{
      'page': instance.page,
      'limit': instance.limit,
      'data': instance.data,
      'total_count': instance.totalCount,
      'total_page': instance.totalPage,
      'last_page': instance.lastPage,
      'prev_page': instance.prevPage,
      'next_page': instance.nextPage,
    };

CompanyData _$CompanyDataFromJson(Map<String, dynamic> json) => CompanyData(
      id: json['id'] as String?,
      accountCode: json['account_code'] as String?,
      name: json['name'] as String?,
      salesPartnerId: (json['sales_partner_id'] as num?)?.toInt(),
      technicalPartnerId: (json['technical_partner_id'] as num?)?.toInt(),
      taxNumber: json['tax_number'] as String?,
      isActive: json['is_active'] as bool?,
      brands: json['brands'] == null
          ? null
          : CompanyBrand.fromJson(json['brands'] as Map<String, dynamic>),
      activeBranchCount: (json['active_branch_count'] as num?)?.toInt(),
      deactiveBranchCount: (json['deactive_branch_count'] as num?)?.toInt(),
      totalBranchCount: (json['total_branch_count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CompanyDataToJson(CompanyData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'account_code': instance.accountCode,
      'name': instance.name,
      'sales_partner_id': instance.salesPartnerId,
      'technical_partner_id': instance.technicalPartnerId,
      'tax_number': instance.taxNumber,
      'is_active': instance.isActive,
      'brands': instance.brands,
      'active_branch_count': instance.activeBranchCount,
      'deactive_branch_count': instance.deactiveBranchCount,
      'total_branch_count': instance.totalBranchCount,
    };

CompanyBrand _$CompanyBrandFromJson(Map<String, dynamic> json) => CompanyBrand(
      id: json['id'] as String?,
      brandName: json['brand_name'] as String?,
      brandCode: json['brand_code'] as String?,
    );

Map<String, dynamic> _$CompanyBrandToJson(CompanyBrand instance) =>
    <String, dynamic>{
      'id': instance.id,
      'brand_name': instance.brandName,
      'brand_code': instance.brandCode,
    };
