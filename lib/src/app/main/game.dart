import 'package:flutter/material.dart';
import 'package:million_tickbox/src/app/main/checkboxes/presentation/widgets/grid_checkbox.dart';
import 'package:million_tickbox/src/core/widgets/default_app_bar.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: Text(
          'Million Tickbox',
          style: Theme.of(context).textTheme.headlineLarge,
          textAlign: TextAlign.center,
        ),
        automaticallyImplyLeading: false,
        actions: [
          // InternetIcon(),
        ],
      ),
      body: Center(
        child: CheckboxGridView(),
      ),
    );
  }
}
