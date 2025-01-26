import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:api/api.dart';
import 'package:hacker_news/providers/repository_provider.dart';

final userControllerProvider = AsyncNotifierProviderFamily<UserController, UserModel, String>(() {
  return UserController();
});

class UserController extends FamilyAsyncNotifier<UserModel, String> {
  @override
  Future<UserModel> build(String userId) async {
    final repository = ref.read(hackerNewsRepositoryProvider);
    return repository.getUser(userId);
  }
}
