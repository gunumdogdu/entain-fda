import 'package:freezed_annotation/freezed_annotation.dart';

part 'story_model.freezed.dart';
part 'story_model.g.dart';

@freezed
class StoryModel with _$StoryModel {
  const factory StoryModel({
    required int id,
    @Default('') String title,
    String? by,
    required int time,
    String? url,
    int? score,
    @Default([]) List<int> kids,
  }) = _StoryModel;

  factory StoryModel.fromJson(Map<String, dynamic> json) =>
      _$StoryModelFromJson(json);
}
