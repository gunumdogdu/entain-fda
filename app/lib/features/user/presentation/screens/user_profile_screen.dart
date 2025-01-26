import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:hacker_news/core/constants/module_padding.dart';
import 'package:hacker_news/features/user/presentation/widgets/user_stories_list.dart';
import 'package:values/values.dart';

import '../controllers/user_controller.dart';
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
        previousPageTitle: context.i10n.stories,
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
                  padding: const EdgeInsets.all(ModulePadding.v16),
                  sliver: SliverToBoxAdapter(
                    child: Container(
                      padding: const EdgeInsets.all(ModulePadding.v16),
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
                            context.i10n.about,
                            style: CupertinoTheme.of(context)
                                .textTheme
                                .navTitleTextStyle
                                .copyWith(
                                  color: CupertinoColors.activeBlue,
                                  fontSize: 20,
                                ),
                          ),
                          const SizedBox(height: ModulePadding.v8),
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
                  padding: const EdgeInsets.symmetric(
                    horizontal: ModulePadding.h16,
                  ),
                  sliver: SliverToBoxAdapter(
                    child: Text(
                      context.i10n.stories,
                      style: CupertinoTheme.of(context)
                          .textTheme
                          .navTitleTextStyle
                          .copyWith(
                            color: CupertinoColors.activeBlue,
                            fontSize: 20,
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
                  size: ModuleSize.icon48,
                  color: CupertinoColors.systemRed,
                ),
                const SizedBox(height: ModulePadding.v16),
                Text(
                  context.i10n.errorLoadingUser,
                  style: CupertinoTheme.of(context).textTheme.navTitleTextStyle,
                ),
                const SizedBox(height: ModulePadding.v8),
                CupertinoButton(
                  onPressed: () => ref.refresh(userControllerProvider(userId)),
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
