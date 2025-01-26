import 'dart:developer';

import 'package:flutter/material.dart';

/// The Navigator observer.
class NavigationHistoryObserver extends NavigatorObserver {
  ///Navigation history.
  final List<Route<dynamic>?> history = <Route<dynamic>?>[];

  static final NavigationHistoryObserver _instance =
      NavigationHistoryObserver();

  ///Instance of [NavigationHistoryObserver]
  static NavigationHistoryObserver get instance {
    return _instance;
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    log('didPush: ${route.str}, previousRoute= ${previousRoute?.str}');
    _instance.history.add(route);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    log(
      'didPop: ${route.str}, previousRoute= ${previousRoute?.str}',
    );
    _instance.history.removeLast();
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    log(
      'didRemove: ${route.str}, previousRoute= ${previousRoute?.str}',
    );
    _instance.history.remove(route);
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    log(
      'didReplace: new= ${newRoute?.str}, old= ${oldRoute?.str}',
    );
    final oldRouteIndex = _instance.history.indexOf(oldRoute);
    _instance.history
        .replaceRange(oldRouteIndex, oldRouteIndex + 1, [newRoute]);
  }

  @override
  void didStartUserGesture(
    Route<dynamic> route,
    Route<dynamic>? previousRoute,
  ) =>
      log('didStartUserGesture: ${route.str}, '
          'previousRoute= ${previousRoute?.str}');

  @override
  void didStopUserGesture() => log('didStopUserGesture');
}

extension on Route<dynamic> {
  String get str => 'route(${settings.name}: ${settings.arguments})';
}
