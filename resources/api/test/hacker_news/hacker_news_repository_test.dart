import 'package:api/api.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockHackerNewsApi extends Mock implements HackerNewsApi {}

void main() {
  late MockHackerNewsApi mockApi;
  late HackerNewsRepository repository;

  setUp(() {
    mockApi = MockHackerNewsApi();
    repository = HackerNewsRepository.withApi(mockApi);
  });

  group('HackerNewsRepository', () {
    test('getTopStories returns limited number of stories', () async {
      final storyIds = List.generate(100, (i) => i);
      const mockStory = StoryModel(
        id: 1,
        title: 'Test Story',
        by: 'testuser',
        time: 1234567890,
      );

      when(() => mockApi.getTopStories()).thenAnswer((_) async => storyIds);
      when(() => mockApi.getStory(any())).thenAnswer((_) async => mockStory);

      final result = await repository.getTopStories(limit: 10);
      expect(result.length, equals(10));
      verify(() => mockApi.getTopStories()).called(1);
      verify(() => mockApi.getStory(any())).called(10);
    });

    test('getUser returns user data', () async {
      const mockUser = UserModel(
        id: 'testuser',
        created: 1234567890,
        about: 'Test bio',
        submitted: [1, 2, 3],
      );

      when(() => mockApi.getUser('testuser')).thenAnswer((_) async => mockUser);

      final result = await repository.getUser('testuser');
      expect(result.id, equals('testuser'));
      verify(() => mockApi.getUser('testuser')).called(1);
    });

    test('handles network errors gracefully', () async {
      when(() => mockApi.getTopStories()).thenThrow(
        DioException(
          requestOptions: RequestOptions(path: '/topstories.json'),
          error: 'Network error',
        ),
      );

      expect(
        () => repository.getTopStories(),
        throwsA(isA<Exception>().having(
          (e) => e.toString(),
          'message',
          contains('Network error'),
        )),
      );
    });
  });
}
