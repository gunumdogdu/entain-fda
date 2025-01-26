// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StoryModelImpl _$$StoryModelImplFromJson(Map<String, dynamic> json) =>
    _$StoryModelImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String? ?? '',
      by: json['by'] as String?,
      time: (json['time'] as num).toInt(),
      url: json['url'] as String?,
      score: (json['score'] as num?)?.toInt(),
      kids: (json['kids'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$StoryModelImplToJson(_$StoryModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'by': instance.by,
      'time': instance.time,
      'url': instance.url,
      'score': instance.score,
      'kids': instance.kids,
    };
