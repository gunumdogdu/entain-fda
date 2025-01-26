import 'package:flutter_riverpod/flutter_riverpod.dart';

final splashControllerProvider = StateNotifierProvider<SplashController, bool>(
  (ref) => SplashController(),
);

class SplashController extends StateNotifier<bool> {
  SplashController() : super(false);

  Future<void> initializeApp() async {
    // Add any initialization logic here (e.g., loading initial data)
    await Future.delayed(const Duration(seconds: 2));
    state = true;
  }
}
