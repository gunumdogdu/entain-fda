import 'package:flutter/cupertino.dart';

class Divider extends StatelessWidget {
  const Divider({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = CupertinoTheme.of(context).brightness == Brightness.dark;

    return Container(
      height: 1,
      color: isDark
          ? CupertinoColors.systemGrey6.withOpacity(0.2)
          : CupertinoColors.systemGrey6,
    );
  }
}
