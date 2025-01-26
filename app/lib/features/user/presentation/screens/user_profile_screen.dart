import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:hacker_news/core/utils/date_formatter.dart';
import 'package:hacker_news/features/user/presentation/widgets/user_stories_list.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../controllers/user_controller.dart';
import '../widgets/user_header.dart';
import '../widgets/user_profile_header.dart';


class UserProfileScreen extends ConsumerWidget {
  final String userId;

  const UserProfileScreen({super.key, required this.userId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = CupertinoTheme.of(context).brightness == Brightness.dark;
    final userAsync = ref.watch(userControllerProvider(userId));

    return CupertinoPageScaffold(
      backgroundColor: isDark
          ? CupertinoColors.systemBackground.darkColor
          : CupertinoColors.systemGroupedBackground,
      navigationBar: CupertinoNavigationBar(
        backgroundColor: isDark
            ? CupertinoColors.systemBackground.darkColor
            : CupertinoColors.systemBackground,
        middle: Text(userId),
        previousPageTitle: 'Stories',
      ),
      child: SafeArea(
        child: userAsync.when(
          data: (user) => CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              CupertinoSliverRefreshControl(
                onRefresh: () =>
                    ref.refresh(userControllerProvider(userId).future),
              ),
              SliverToBoxAdapter(
                child: UserProfileHeader(user: user),
              ),
              if (user.about != null) ...[
                SliverPadding(
                  padding: const EdgeInsets.all(16),
                  sliver: SliverToBoxAdapter(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: isDark
                            ? CupertinoColors.systemBackground.darkColor
                            : CupertinoColors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: isDark
                              ? CupertinoColors.systemGrey5.darkColor
                              : CupertinoColors.systemGrey5,
                          width: 0.5,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'About',
                            style: CupertinoTheme.of(context)
                                .textTheme
                                .navTitleTextStyle
                                .copyWith(
                                  color: CupertinoColors.activeBlue,
                                ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            user.about!,
                            style: CupertinoTheme.of(context)
                                .textTheme
                                .textStyle
                                .copyWith(
                                  height: 1.5,
                                  color: isDark
                                      ? CupertinoColors.white
                                      : CupertinoColors.black,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
              if (user.submitted.isNotEmpty) ...[
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  sliver: SliverToBoxAdapter(
                    child: Text(
                      'Stories',
                      style: CupertinoTheme.of(context)
                          .textTheme
                          .navTitleTextStyle
                          .copyWith(
                            color: CupertinoColors.activeBlue,
                          ),
                    ),
                  ),
                ),
                const SliverPadding(padding: EdgeInsets.only(top: 8)),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 375),
                      child: SlideAnimation(
                        verticalOffset: 50.0,
                        child: FadeInAnimation(
                          child:
                              UserStoriesItem(storyId: user.submitted[index]),
                        ),
                      ),
                    ),
                    childCount: user.submitted.length,
                  ),
                ),
              ],
            ],
          ),
          loading: () => const Center(child: CupertinoActivityIndicator()),
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
                  'Error loading user',
                  style: CupertinoTheme.of(context).textTheme.navTitleTextStyle,
                ),
                const SizedBox(height: 8),
                CupertinoButton(
                  onPressed: () => ref.refresh(userControllerProvider(userId)),
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
