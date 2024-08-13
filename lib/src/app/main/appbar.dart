import 'package:flutter/material.dart';
import 'package:million_tickbox/src/core/util/config.dart';

/// Not being used redundant code
/// using DefaultAppBar instead
///
class MillionCheckboxAppBar extends AppBar {
  MillionCheckboxAppBar({Key? key})
      : super(
          key: key,
          title: const Text('Million Tickbox'),
          actions: [
            // Checking if the connection if the internet is available
            // If available show a green dot else show a red dot
            Padding(
              padding: Config.fromLTRB(0, 0, 20, 0),
              child: Icon(
                Icons.circle,
                color: Colors.green,
              ),
            ),
          ],
        );
}
