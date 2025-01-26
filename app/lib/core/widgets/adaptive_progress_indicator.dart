import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveProgressIndicator extends StatelessWidget {
  const AdaptiveProgressIndicator({
    super.key,
    this.size = 24.0,
    this.strokeWidth = 2.0,
  });

  final double size;
  final double strokeWidth;

  @override
  Widget build(BuildContext context) {
    final platform = Theme.of(context).platform;

    return SizedBox(
      height: size,
      width: size,
      child: platform == TargetPlatform.iOS
          ? const CupertinoActivityIndicator()
          : CircularProgressIndicator(
              strokeWidth: strokeWidth,
            ),
    );
  }
}
