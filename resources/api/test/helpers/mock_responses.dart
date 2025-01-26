class MockResponses {
  static const Map<String, dynamic> storyResponse = {
    'id': 1,
    'title': 'Test Story',
    'by': 'testuser',
    'time': 1234567890,
    'url': 'https://example.com',
    'score': 100,
    'kids': [1, 2, 3],
  };

  static const Map<String, dynamic> userResponse = {
    'id': 'testuser',
    'created': 1234567890,
    'about': 'Test user bio',
    'submitted': [1, 2, 3],
  };

  static const List<int> topStoriesResponse = [1, 2, 3, 4, 5];
}
