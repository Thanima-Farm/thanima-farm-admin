import 'dart:developer';

import 'package:flutter/material.dart';

import 'router.dart';

// / TODO check this file
// / [RouteObserver] informs subscribers whenever a route is
// / pushed on top of their own route or popped from it.
// /
// / This is for example useful to keep track of page transitions,
// / e.g. a RouteObserver<PageRoute> will inform subscribed MyRouteObserver
// / whenever the user navigates away from the current page route to another page route.

class MyRouteObserver extends RouteObserver<PageRoute<dynamic>> {
  static final MyRouteObserver _myRouteObserver =
      MyRouteObserver._internal(enableLogger: true);

  MyRouteObserver._internal({
    this.enableLogger = true,
  }) : _stack = [];

  factory MyRouteObserver() {
    return _myRouteObserver;
  }

  /// All the route will get added in the stack
  /// any changes in NavigationStack will get reflected here
  final List<Route<dynamic>> _stack;

  /// Will show log of the NavigationStack [_stack].
  ///
  /// Change to false to disable the log
  final bool enableLogger;

  ///create clone list from stack
  List<Route<dynamic>> get stack => List<Route<dynamic>>.from(_stack);

  /// The [Navigator] pushed `route`.
  ///
  /// The route immediately below that one, and thus the previously active
  /// route, is `previousRoute`.
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    _stack.add(route);
    _logStack();
    if (route is PageRoute) {
      _sendScreenView(route);
    }
  }

  /// The [Navigator] replaced `oldRoute` with `newRoute`.
  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    if (_stack.contains(oldRoute)) {
      final oldItemIndex = _stack.indexOf(oldRoute!);
      _stack[oldItemIndex] = newRoute!;
    }
    _logStack();

    if (newRoute is PageRoute) {
      _sendScreenView(newRoute);
    }
  }

  /// The [Navigator] popped `route`.
  ///
  /// The route immediately below that one, and thus the newly active
  /// route, is `previousRoute`.
  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    _stack.remove(route);
    _logStack();
    if (previousRoute is PageRoute && route is PageRoute) {
      _sendScreenView(previousRoute);
    }
  }

  /// The [Navigator] removed `route`.
  ///
  /// If only one route is being removed, then the route immediately below
  /// that one, if any, is `previousRoute`.
  @override
  void didRemove(Route? route, Route? previousRoute) {
    stack.remove(route);
    _logStack();
    if (previousRoute is PageRoute && route is PageRoute) {
      _sendScreenView(previousRoute);
    }
    super.didRemove(route!, previousRoute);
  }

  /// we create a stack for our [MyRouteObserver] class.
  /// now we can find that what route we have in our application.
  void _logStack() {
    final mappedStack =
        _stack.map((Route route) => route.settings.name).toList();

    _logget('Navigator stack: $mappedStack');
  }

  List<String?> getLogStack() {
    final List<String?> mappedStack =
        _stack.map((Route route) => route.settings.name).toList();
    debugPrint("mappedStack: $mappedStack");
    return mappedStack;
  }

  void _logget(String content) {
    if (enableLogger) {
      log(content);
    }
  }

  /// this method will tag the screen into UxCam
  /// whenever any route changes
  void _sendScreenView(PageRoute<dynamic>? route) {
    var screenName = route?.settings.name;
    debugPrint('screenName $screenName');

    if (route != null && screenName != null) {
      if (screenName == Routes.homePageRoute) {
        //UxCamRouteConfig.mapDashBoardScreen(AppConst.homePageIndex);
      } else {
        //UxCam.tagScreenName(screenName);
      }
    }
  }
}
