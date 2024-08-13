import '/src/core/di/di.dart';
import '/src/core/observers/build_watch.dart';
import '/src/core/router/routes.dart';
import '/src/core/util/config.dart';
import '/src/core/util/extension.dart';
import '/src/core/widgets/app_button.dart';
import '/src/core/widgets/default_app_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class StartScreen extends ConsumerStatefulWidget {
  const StartScreen({super.key});

  @override
  ConsumerState<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends ConsumerState<StartScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final isLoggedIn = FirebaseAuth.instance.currentUser != null;
      if (isLoggedIn) {
        await ref.read(authProvider.notifier).getUser();
      } else {
        await ref.read(authProvider.notifier).signInAnonymously();
      }
      // FlutterNativeSplash.remove();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: Text(
          'Million Tickbox',
          textAlign: TextAlign.center,
        ),
        automaticallyImplyLeading: false,
        actions: [
          // InternetIcon(),
        ],
      ),
      body: Padding(
        padding: Config.symmetric(h: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: Config.height * 0.25,
            ),
            Text(
              'Start Game',
              style: context.textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            Config.vBox24,
            AppButton(
              text: 'Play',
              onPressed: () async {
                if (!context.mounted) return;
                context.goNamed(
                  Routes.game,
                );
              },
            ),
          ],
        ),
      ),
    ).watchBuild('StartScreen');
  }
}
