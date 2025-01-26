import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:values/values.dart';

import '../../../../providers/theme_provider.dart';

class ThemeSwitcher extends ConsumerWidget {
  const ThemeSwitcher({super.key});

  void _showThemeModal(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(themeProvider.notifier);

    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        title: Text(context.i10n.chooseTheme),
        actions: [
          CupertinoActionSheetAction(
            onPressed: () async {
              await notifier.setTheme(ThemeMode.light);
              if (context.mounted) Navigator.pop(context);
            },
            child: Text(context.i10n.lightMode),
          ),
          CupertinoActionSheetAction(
            onPressed: () async {
              await notifier.setTheme(ThemeMode.dark);
              if (context.mounted) Navigator.pop(context);
            },
            child: Text(context.i10n.darkMode),
          ),
          CupertinoActionSheetAction(
            onPressed: () async {
              await notifier.setTheme(ThemeMode.system);
              if (context.mounted) Navigator.pop(context);
            },
            child: Text(context.i10n.systemDefault),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: () => Navigator.pop(context),
          child: Text(context.i10n.cancelBtnText),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    final isDark = themeMode == ThemeMode.dark ||
        (themeMode == ThemeMode.system &&
            MediaQuery.platformBrightnessOf(context) == Brightness.dark);

    return GestureDetector(
      onTap: () => _showThemeModal(context, ref),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Icon(
          isDark ? CupertinoIcons.sun_max : CupertinoIcons.moon,
          color: CupertinoColors.activeBlue,
        ),
      ),
    );
  }
}
