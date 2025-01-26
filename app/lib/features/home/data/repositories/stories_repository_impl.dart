import 'package:api/api.dart';

import '../../domain/repositories/stories_repository.dart';

class StoriesRepositoryImpl implements StoriesRepository {
  final HackerNewsApi _api;

  const StoriesRepositoryImpl(this._api);

  @override
  Future<List<StoryModel>> getTopStories() async {
    final ids = await _api.getTopStories();
    final stories = await Future.wait(
      ids.take(20).map((id) => _api.getStory(id)),
    );
    return stories;
  }

  @override
  Future<StoryModel> getStory(int id) async {
    return _api.getStory(id);
  }
}
