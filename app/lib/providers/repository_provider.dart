import 'package:api/api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final hackerNewsRepositoryProvider = Provider<HackerNewsRepository>((ref) {
  return HackerNewsRepository();
});
