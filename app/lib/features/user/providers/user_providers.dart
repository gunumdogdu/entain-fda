import 'package:api/api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hacker_news/providers/repository_provider.dart';

final userStoryProvider =
    FutureProvider.family<StoryModel, int>((ref, storyId) {
  final repository = ref.watch(hackerNewsRepositoryProvider);
  return repository.getStory(storyId);
});
