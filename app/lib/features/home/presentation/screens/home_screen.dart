import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hacker_news/features/stories/presentation/widgets/story_shimmer_item.dart';

import '../../../../providers/theme_provider.dart';
import '../controllers/home_controller.dart';
import '../widgets/story_list.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  void _showThemeModal(BuildContext context, WidgetRef ref) async {
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
    final isDark = CupertinoTheme.of(context).brightness == Brightness.dark;

    return CupertinoPageScaffold(
      backgroundColor: isDark
          ? CupertinoColors.systemBackground.darkColor
          : CupertinoColors.systemGroupedBackground,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: isDark
            ? CupertinoColors.systemBackground.darkColor
            : CupertinoColors.systemBackground,
        middle: const Text('Hacker News'),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () => _showThemeModal(context, ref),
          child: Icon(
            isDark ? CupertinoIcons.sun_max : CupertinoIcons.moon,
            color: CupertinoColors.activeBlue,
          ),
        ),
      ),
      child: SafeArea(
        child: Consumer(
          builder: (context, ref, child) {
            final storiesAsync = ref.watch(homeControllerProvider);

            return storiesAsync.when(
              data: (stories) => StoryList(stories: stories),
              loading: () => ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) => const StoryShimmerItem(),
              ),
              error: (error, stack) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      CupertinoIcons.exclamationmark_circle,
                      size: 48,
                      color: CupertinoColors.systemRed,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Error loading stories',
                      style: CupertinoTheme.of(context)
                          .textTheme
                          .navTitleTextStyle,
                    ),
                    const SizedBox(height: 8),
                    CupertinoButton(
                      onPressed: () => ref.refresh(homeControllerProvider),
                      child: const Text('Try Again'),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
