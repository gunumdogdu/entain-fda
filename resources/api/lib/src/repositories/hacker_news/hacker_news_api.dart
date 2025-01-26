import 'package:api/src/repositories/hacker_news/models/index.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'hacker_news_api.g.dart';

@RestApi(baseUrl: 'https://hacker-news.firebaseio.com/v0')
abstract class HackerNewsApi {
  factory HackerNewsApi(Dio dio, {String baseUrl}) = _HackerNewsApi;

  @GET('/topstories.json')
  Future<List<int>> getTopStories();

  @GET('/item/{id}.json')
  Future<StoryModel> getStory(@Path() int id);

  @GET('/user/{id}.json')
  Future<UserModel> getUser(@Path() String id);
}
