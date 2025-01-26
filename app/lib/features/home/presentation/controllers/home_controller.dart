import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/models/story.dart';
import '../../domain/repositories/stories_repository.dart';

final homeControllerProvider =
    AsyncNotifierProvider<HomeController, List<Story>>(() {
  return HomeController();
});

class HomeController extends AsyncNotifier<List<Story>> {
  @override
  Future<List<Story>> build() async {
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
