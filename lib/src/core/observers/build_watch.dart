import 'package:flutter/material.dart';

import '../service/logger.dart';

const _logger = Logger('Build Watch');

class BuildWatch extends StatelessWidget {
  const BuildWatch({
    required this.child,
    required this.name,
    super.key,
  });

  final Widget child;
  final String name;

  @override
  Widget build(BuildContext context) {
    _logger.build(name);
    return child;
  }
}

extension BuildWatchExt on Widget {
  Widget watchBuild(String name) {
    return BuildWatch(name: name, child: this);
  }
}
