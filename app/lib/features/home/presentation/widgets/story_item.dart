import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../core/models/story.dart';
import '../../../../core/utils/date_formatter.dart';

class StoryItem extends StatelessWidget {
  final Story story;
  final VoidCallback onAuthorTap;

  const StoryItem({
    super.key,
    required this.story,
    required this.onAuthorTap,
  });

  Future<void> _launchUrl(String? url) async {
    if (url == null) return;
    try {
      await launchUrlString(url, mode: LaunchMode.externalApplication);
    } catch (e) {
      debugPrint('Error launching URL: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = CupertinoTheme.of(context).brightness == Brightness.dark;

    return CupertinoListSection.insetGrouped(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      backgroundColor: Colors.transparent,
      children: [
        CupertinoListTile(
          padding: const EdgeInsets.all(12),
          backgroundColor:
              isDark ? CupertinoColors.systemGrey6 : CupertinoColors.white,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                story.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  GestureDetector(
                    onTap: onAuthorTap,
                    child: Text(
                      'by ${story.by}',
                      style: TextStyle(
                        fontSize: 14,
                        color: CupertinoColors.activeBlue.resolveFrom(context),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '•',
                    style: TextStyle(
                      fontSize: 14,
                      color: CupertinoColors.systemGrey.resolveFrom(context),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    formatDate(story.time),
                    style: TextStyle(
                      fontSize: 14,
                      color: CupertinoColors.systemGrey.resolveFrom(context),
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    CupertinoIcons.arrow_up,
                    size: 14,
                    color: CupertinoColors.activeBlue.resolveFrom(context),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    '${story.score}',
                    style: TextStyle(
                      fontSize: 14,
                      color: CupertinoColors.activeBlue.resolveFrom(context),
                    ),
                  ),
                ],
              ),
            ],
          ),
          onTap: story.url != null ? () => _launchUrl(story.url) : null,
        ),
      ],
    );
  }
}

// Rest of the file stays the same
