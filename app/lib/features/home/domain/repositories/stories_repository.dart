import 'package:api/api.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/stories_repository_impl.dart';

abstract class StoriesRepository {
  Future<List<StoryModel>> getTopStories();
  Future<StoryModel> getStory(int id);
}

final storiesRepositoryProvider = Provider<StoriesRepository>((ref) {
  final api = HackerNewsApi(Dio());
  return StoriesRepositoryImpl(api);
});
