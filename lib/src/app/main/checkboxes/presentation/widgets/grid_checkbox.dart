import 'package:flutter/material.dart';
import 'package:million_tickbox/src/core/observers/build_watch.dart';

import 'checkbox_tile.dart';

class CheckboxGridView extends StatelessWidget {
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 40,
      ),
      // Millon checkboxes
      itemCount: 999999,
      itemBuilder: (context, index) {
        return CheckboxItem(
          key: ValueKey('checkbox_$index'),
          index: index,
        );
      },
    ).watchBuild('CheckboxGridView');
  }
}
