import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../core/utils/date_formatter.dart';
import '../../providers/user_providers.dart';

class UserStoriesList extends ConsumerWidget {
  final List<int> submittedIds;

  const UserStoriesList({super.key, required this.submittedIds});

  Future<void> _launchUrl(String? url) async {
    if (url == null) return;
    try {
      await launchUrlString(url, mode: LaunchMode.externalApplication);
    } catch (e) {
      debugPrint('Error launching URL: $e');
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final limitedIds = submittedIds.take(30).toList(); // Show more items
    final isDark = CupertinoTheme.of(context).brightness == Brightness.dark;

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final storyId = limitedIds[index];
          final storyAsync = ref.watch(userStoryProvider(storyId));

          return storyAsync.when(
            data: (story) {
              // Skip if it's not a valid story (e.g., comment, deleted, or no author)
              if (story.title.isEmpty || story.by == null) {
                return const SizedBox.shrink();
              }

              return CupertinoListTile(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                backgroundColor: isDark
                    ? CupertinoColors.systemGrey6
                    : CupertinoColors.white,
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      story.title,
                      style: CupertinoTheme.of(context).textTheme.textStyle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          formatDate(story.time),
                          style: CupertinoTheme.of(context)
                              .textTheme
                              .tabLabelTextStyle
                              .copyWith(
                                color: CupertinoColors.systemGrey,
                              ),
                        ),
                        if (story.url != null) ...[
                          const SizedBox(width: 8),
                          Icon(
                            CupertinoIcons.link,
                            size: 14,
                            color: CupertinoColors.systemGrey,
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
                onTap: story.url != null ? () => _launchUrl(story.url) : null,
              );
            },
            loading: () => const Padding(
              padding: EdgeInsets.all(12),
              child: Center(
                child: CupertinoActivityIndicator(),
              ),
            ),
            error: (error, _) => const SizedBox.shrink(),
          );
        },
        childCount: limitedIds.length,
      ),
    );
  }
}

class UserStoriesItem extends StatelessWidget {
  final int storyId;

  const UserStoriesItem({super.key, required this.storyId});

  Future<void> _launchUrl(String url) async {
    try {
      await launchUrlString(url, mode: LaunchMode.externalApplication);
    } catch (e) {
      debugPrint('Error launching URL: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = CupertinoTheme.of(context).brightness == Brightness.dark;
    final textTheme = CupertinoTheme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
      child: CupertinoButton(
        padding: const EdgeInsets.all(16),
        onPressed: () =>
            _launchUrl('https://news.ycombinator.com/item?id=$storyId'),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Story #$storyId',
                    style: textTheme.textStyle.copyWith(
                      fontSize: 17,
                      color: isDark
                          ? CupertinoColors.white
                          : CupertinoColors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'View on Hacker News',
                    style: textTheme.tabLabelTextStyle.copyWith(
                      color: CupertinoColors.activeBlue,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              CupertinoIcons.arrow_up_right,
              size: 20,
              color: CupertinoColors.activeBlue,
            ),
          ],
        ),
      ),
    );
  }
}
