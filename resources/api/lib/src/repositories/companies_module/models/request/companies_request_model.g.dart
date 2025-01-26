// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'companies_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompaniesRequestModel _$CompaniesRequestModelFromJson(
        Map<String, dynamic> json) =>
    CompaniesRequestModel(
      page: (json['page'] as num?)?.toInt(),
      limit: (json['limit'] as num?)?.toInt(),
      keyword: json['keyword'] as String?,
      sort: json['sort'] as String?,
    );

Map<String, dynamic> _$CompaniesRequestModelToJson(
        CompaniesRequestModel instance) =>
    <String, dynamic>{
      'page': instance.page,
      'limit': instance.limit,
      'keyword': instance.keyword,
      'sort': instance.sort,
    };
