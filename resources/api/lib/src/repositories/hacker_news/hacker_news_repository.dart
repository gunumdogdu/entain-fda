import 'package:api/src/repositories/hacker_news/hacker_news_api.dart';
import 'package:api/src/repositories/hacker_news/models/index.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

class HackerNewsRepository {
  final HackerNewsApi _api;

  HackerNewsRepository()
      : _api = HackerNewsApi(
          Dio()..interceptors.add(LogInterceptor(responseBody: true)),
        );

  // Add this constructor for testing
  @visibleForTesting
  HackerNewsRepository.withApi(this._api);

  Future<List<StoryModel>> getTopStories({int limit = 30}) async {
    try {
      final storyIds = await _api.getTopStories();
      final limitedIds = storyIds.take(limit).toList();

      final stories = await Future.wait(
        limitedIds.map((id) => _api.getStory(id)),
      );

      return stories;
    } on DioException catch (e) {
      throw Exception('Network error: ${e.message}');
    } catch (e) {
      throw Exception('Failed to fetch top stories: $e');
    }
  }

  Future<StoryModel> getStory(int id) async {
    try {
      return await _api.getStory(id);
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        // Return an empty story for deleted/non-existent items
        return StoryModel(
          id: id,
          by: 'deleted',
          time: 0,
        );
      }
      throw Exception('Network error: ${e.message}');
    } catch (e) {
      throw Exception('Failed to fetch story: $e');
    }
  }

  Future<UserModel> getUser(String userId) async {
    try {
      return await _api.getUser(userId);
    } on DioException catch (e) {
      throw Exception('Network error: ${e.message}');
    } catch (e) {
      throw Exception('Failed to fetch user: $e');
    }
  }
}
