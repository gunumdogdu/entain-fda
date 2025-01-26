import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../providers/theme_provider.dart';

class ThemeSwitcher extends ConsumerWidget {
  const ThemeSwitcher({super.key});

  void _showThemeModal(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(themeProvider.notifier);

    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        title: const Text('Choose Theme'),
        actions: [
          CupertinoActionSheetAction(
            onPressed: () async {
              await notifier.setTheme(ThemeMode.light);
              if (context.mounted) Navigator.pop(context);
            },
            child: const Text('Light Mode'),
          ),
          CupertinoActionSheetAction(
            onPressed: () async {
              await notifier.setTheme(ThemeMode.dark);
              if (context.mounted) Navigator.pop(context);
            },
            child: const Text('Dark Mode'),
          ),
          CupertinoActionSheetAction(
            onPressed: () async {
              await notifier.setTheme(ThemeMode.system);
              if (context.mounted) Navigator.pop(context);
            },
            child: const Text('System Default'),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
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
