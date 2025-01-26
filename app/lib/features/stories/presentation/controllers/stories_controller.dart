import 'package:api/api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/models/story.dart';
import '../../../home/domain/repositories/stories_repository.dart';

final storiesControllerProvider =
    AsyncNotifierProviderFamily<StoriesController, List<Story>, String>(() {
  return StoriesController();
});

class StoriesController extends FamilyAsyncNotifier<List<Story>, String> {
  @override
  Future<List<Story>> build(String userId) async {
    final repository = ref.read(storiesRepositoryProvider);
    final stories = await repository.getTopStories();

    return stories
        .map((model) => Story(
              id: model.id,
              title: model.title,
              by: model.by ?? '',
              score: model.score ?? 0,
              url: model.url,
              time: model.time,
              kids: model.kids,
            ))
        .toList();
  }
}

final storyProvider =
    FutureProvider.autoDispose.family<StoryModel, int>((ref, id) {
  final repository = ref.watch(storiesRepositoryProvider);
  return repository.getStory(id);
});
