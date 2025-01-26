import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../controllers/stories_controller.dart';
import '../widgets/story_card.dart';
import '../widgets/story_shimmer.dart';

class StoriesScreen extends ConsumerWidget {
  final String userId;

  const StoriesScreen({super.key, required this.userId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = CupertinoTheme.of(context).brightness == Brightness.dark;
    final storiesAsync = ref.watch(storiesControllerProvider(userId));

    return CupertinoPageScaffold(
      backgroundColor: isDark
          ? CupertinoColors.systemBackground.darkColor
          : CupertinoColors.systemGroupedBackground,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: isDark
            ? CupertinoColors.systemBackground.darkColor
            : CupertinoColors.systemBackground,
        middle: Text('Stories by $userId'),
        previousPageTitle: 'Profile',
      ),
      child: SafeArea(
        child: storiesAsync.when(
          data: (stories) => CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              CupertinoSliverRefreshControl(
                onRefresh: () =>
                    ref.refresh(storiesControllerProvider(userId).future),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => AnimationLimiter(
                      child: AnimationConfiguration.staggeredList(
                        position: index,
                        duration: const Duration(milliseconds: 375),
                        child: SlideAnimation(
                          verticalOffset: 50.0,
                          child: FadeInAnimation(
                            child: StoryCard(story: stories[index]),
                          ),
                        ),
                      ),
                    ),
                    childCount: stories.length,
                  ),
                ),
              ),
            ],
          ),
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
                  style: CupertinoTheme.of(context).textTheme.navTitleTextStyle,
                ),
                const SizedBox(height: 8),
                CupertinoButton(
                  onPressed: () =>
                      ref.refresh(storiesControllerProvider(userId)),
                  child: const Text('Try Again'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
