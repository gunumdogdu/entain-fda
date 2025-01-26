import 'package:api/api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final hackerNewsRepositoryProvider = Provider<HackerNewsRepository>((ref) {
  return HackerNewsRepository();
});

final topStoriesProvider = FutureProvider<List<StoryModel>>((ref) {
  final repository = ref.watch(hackerNewsRepositoryProvider);
  return repository.getTopStories();
});

final userProvider = FutureProvider.family<UserModel, String>((ref, userId) {
  final repository = ref.watch(hackerNewsRepositoryProvider);
  return repository.getUser(userId);
});
