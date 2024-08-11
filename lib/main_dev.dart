import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'src/app/main_app.dart';
import 'src/core/observers/provider_watch.dart';
import 'src/core/service/logger.dart';

void main() {
  const logger = Logger('Main Dev');
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      /// TODO: Uncomment this line to enable Firebase
      // await Firebase.initializeApp(
      //     // options: DefaultFirebaseOptions.currentPlatform,
      //     );

      // debugRepaintRainbowEnabled = true;

      runApp(
        ProviderScope(
          observers: [ProviderWatch()],
          child: MainApp(),
        ),
      );
    },
    (error, stack) {
      logger.error(error.toString(), stack: stack);
    },
  );
}
