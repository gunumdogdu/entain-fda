import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/home/presentation/screens/home_screen.dart';
import '../features/splash/presentation/screens/splash_screen.dart';
import '../features/user/presentation/screens/user_profile_screen.dart';

/// Enum for route names
enum AppRoute {
  splash('splash', '/splash'),
  home('home', '/'),
  userProfile('user_profile', '/user/:id');

  const AppRoute(this.name, this.path);
  final String name;
  final String path;

  static String userPath(String userId) => '/user/$userId';
}

final router = GoRouter(
  initialLocation: AppRoute.splash.path,
  debugLogDiagnostics: true,
  observers: [AppRouteObserver()],
  redirect: (context, state) {
    developer.log(
      'Navigating to: ${state.uri.path}',
      name: 'Router',
      error: {
        'params': state.pathParameters,
      },
    );

    // Prevent going back to splash screen
    if (state.matchedLocation == AppRoute.splash.path &&
        state.uri.toString() != AppRoute.splash.path) {
      return AppRoute.home.path;
    }

    return null;
  },
  routes: [
    GoRoute(
      path: AppRoute.splash.path,
      name: AppRoute.splash.name,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: AppRoute.home.path,
      name: AppRoute.home.name,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: AppRoute.userProfile.path,
      name: AppRoute.userProfile.name,
      builder: (context, state) {
        final userId = state.pathParameters['id']!;
        return UserProfileScreen(userId: userId);
      },
    ),
  ],
);

/// Custom route observer to log navigation events
class AppRouteObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    developer.log(
      'New route pushed: ${route.settings.name}',
      name: 'Navigation',
      time: DateTime.now(),
    );
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    developer.log(
      'Route popped: ${route.settings.name}',
      name: 'Navigation',
      time: DateTime.now(),
    );
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    developer.log(
      'Route replaced: ${oldRoute?.settings.name} -> ${newRoute?.settings.name}',
      name: 'Navigation',
      time: DateTime.now(),
    );
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    developer.log(
      'Route removed: ${route.settings.name}',
      name: 'Navigation',
      time: DateTime.now(),
    );
  }
}
