import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:million_tickbox/src/app/main/game.dart';
import 'package:million_tickbox/src/app/main/start_screen.dart';

import '/src/core/router/routes.dart';
import '/src/core/util/extension.dart';

final routerProvider = Provider<GoRouter>(
  (ref) {
    final rootNavigatorKey = GlobalKey<NavigatorState>();

    Page<dynamic> pushScreen(Widget screen) {
      if (kIsWeb || Platform.isAndroid) {
        return MaterialPage<void>(child: screen);
      }
      return CupertinoPage(child: screen);
    }

    GoRoute route({
      required String path,
      required Widget? screen,
      Page<dynamic> Function(BuildContext, GoRouterState)? pageBuilder,
      Widget Function(BuildContext, GoRouterState)? builder,
      List<RouteBase> routes = const <RouteBase>[],
      String? redirectTo,
    }) {
      return GoRoute(
        path: path,
        name: path.routeName,
        builder: builder,
        redirect: (context, state) {
          if (redirectTo != null) return redirectTo;
          return null;
        },
        pageBuilder:
            screen != null ? (_, __) => pushScreen(screen) : pageBuilder,
        routes: routes,
      );
    }

    return GoRouter(
      initialLocation: Routes.start,
      navigatorKey: rootNavigatorKey,
      routes: [
        route(
          path: Routes.start,
          screen: StartScreen(),
          routes: [
            route(
              path: Routes.game,
              screen: GameScreen(),
              // TODO: Add redirect to start screen after setting up the firebase
              // redirectTo: FirebaseAuth.instance.currentUser == null
              //     ? Routes.start
              //     : null,
            ),
          ],
        ),
      ],
    );
  },
);
