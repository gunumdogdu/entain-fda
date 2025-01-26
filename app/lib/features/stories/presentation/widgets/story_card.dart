import 'dart:developer' as developer;

import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:hacker_news/core/constants/module_padding.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../core/constants/module_opacity.dart';
import '../../../../core/models/story.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../../../router/app_router.dart';

class StoryCard extends StatelessWidget {
  final Story story;

  const StoryCard({super.key, required this.story});

  Future<void> _launchUrl(String url) async {
    try {
      await launchUrlString(url, mode: LaunchMode.externalApplication);
    } catch (e) {
      developer.log('Error launching URL', name: 'StoryCard', error: e);
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
        padding: EdgeInsets.zero,
        onPressed: story.url != null ? () => _launchUrl(story.url!) : null,
        child: Padding(
          padding: const EdgeInsets.all(ModulePadding.a16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      story.title,
                      style: textTheme.textStyle.copyWith(
                        fontSize: 17,
                        color: isDark
                            ? CupertinoColors.white
                            : CupertinoColors.black,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (story.url != null) ...[
                    const SizedBox(width: 8),
                    const Icon(
                      CupertinoIcons.arrow_up_right,
                      size: ModuleSize.icon16,
                      color: CupertinoColors.activeBlue,
                    ),
                  ],
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () =>
                        context.push(AppRoute.userPath(story.by ?? '')),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            color: CupertinoColors.activeBlue
                                .withOpacity(ModuleOpacity.o01),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              story.by[0].toUpperCase() ?? '',
                              style: textTheme.textStyle.copyWith(
                                fontSize: 12,
                                color: CupertinoColors.activeBlue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          story.by ?? '',
                          style: textTheme.textStyle.copyWith(
                            color: CupertinoColors.activeBlue,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Icon(
                    CupertinoIcons.time,
                    size: ModuleSize.icon16,
                    color: CupertinoColors.systemGrey,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    formatDate(story.time),
                    style: textTheme.textStyle.copyWith(
                      fontSize: 15,
                      color: CupertinoColors.systemGrey,
                    ),
                  ),
                  ...[
                    const SizedBox(width: ModulePadding.h16),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: ModulePadding.h8,
                        vertical: ModulePadding.v4,
                      ),
                      decoration: BoxDecoration(
                        color: CupertinoColors.activeBlue
                            .withOpacity(ModuleOpacity.o01),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            CupertinoIcons.arrow_up_circle_fill,
                            size: ModuleSize.icon16,
                            color: CupertinoColors.activeBlue,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '${story.score}',
                            style: textTheme.textStyle.copyWith(
                              fontSize: 15,
                              color: CupertinoColors.activeBlue,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
