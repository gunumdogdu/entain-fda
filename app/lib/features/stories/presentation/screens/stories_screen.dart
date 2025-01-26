import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:hacker_news/core/constants/module_padding.dart';
import 'package:values/values.dart';

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
        middle: Text(context.i10n.storiesBy(userId)),
        previousPageTitle: context.i10n.profile,
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
                padding: const EdgeInsets.symmetric(vertical: ModulePadding.v8),
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
                const SizedBox(height: ModulePadding.v16),
                Text(
                  context.i10n.errorLoadingStories,
                  style: CupertinoTheme.of(context).textTheme.navTitleTextStyle,
                ),
                const SizedBox(height: ModulePadding.v8),
                CupertinoButton(
                  onPressed: () =>
                      ref.refresh(storiesControllerProvider(userId)),
                  child: Text(context.i10n.tryAgain),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
