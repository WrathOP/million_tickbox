import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/websocket_provider.dart';

class CheckboxItem extends ConsumerWidget {
  final int index;
  final Key key;

  CheckboxItem({required this.key, required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isChecked = ref.watch(checkboxStateProvider(index));

    return Checkbox(
      key: key,
      value: isChecked,
      onChanged: (value) {
        ref
            .read(webSocketNotifierProvider.notifier)
            .flipBit(index, value ?? false);
      },
    );
  }
}
