import 'package:api/api.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() {
  late Dio dio;
  late DioAdapter dioAdapter;
  late HackerNewsApi api;

  setUp(() {
    dio = Dio(BaseOptions(baseUrl: 'https://hacker-news.firebaseio.com/v0'));
    dioAdapter = DioAdapter(dio: dio);
    api = HackerNewsApi(dio);
  });

  group('HackerNewsApi', () {
    test('getTopStories returns list of story ids', () async {
      const mockResponse = [1, 2, 3, 4, 5];

      dioAdapter.onGet(
        '/topstories.json',
        (server) => server.reply(200, mockResponse),
      );

      final result = await api.getTopStories();
      expect(result, equals(mockResponse));
    });

    test('getStory returns story model', () async {
      const mockResponse = {
        'id': 1,
        'title': 'Test Story',
        'by': 'testuser',
        'time': 1234567890,
        'url': 'https://example.com',
        'score': 100,
        'kids': [1, 2, 3],
      };

      dioAdapter.onGet(
        '/item/1.json',
        (server) => server.reply(200, mockResponse),
      );

      final result = await api.getStory(1);
      expect(result.id, equals(1));
      expect(result.title, equals('Test Story'));
      expect(result.by, equals('testuser'));
      expect(result.url, equals('https://example.com'));
    });

    test('getUser returns user model', () async {
      const mockResponse = {
        'id': 'testuser',
        'created': 1234567890,
        'about': 'Test user bio',
        'submitted': [1, 2, 3],
      };

      dioAdapter.onGet(
        '/user/testuser.json',
        (server) => server.reply(200, mockResponse),
      );

      final result = await api.getUser('testuser');
      expect(result.id, equals('testuser'));
      expect(result.created, equals(1234567890));
      expect(result.about, equals('Test user bio'));
      expect(result.submitted, equals([1, 2, 3]));
    });

    test('handles network errors', () async {
      dioAdapter.onGet(
        '/topstories.json',
        (server) => server.throws(
          404,
          DioException(
            requestOptions: RequestOptions(path: '/topstories.json'),
            response: Response(
              requestOptions: RequestOptions(path: '/topstories.json'),
              statusCode: 404,
            ),
          ),
        ),
      );

      expect(
        () => api.getTopStories(),
        throwsA(isA<DioException>()),
      );
    });
  });
}
