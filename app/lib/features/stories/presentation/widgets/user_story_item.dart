import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/constants/index.dart';
import '../../../../core/extensions/index.dart';
import '../../../../core/models/story.dart';

class StoryItem extends StatelessWidget {
  final Story story;
  final VoidCallback? onAuthorTap;

  const StoryItem({
    super.key,
    required this.story,
    this.onAuthorTap,
  });

  Future<void> _launchUrl(String? url) async {
    if (url == null || !url.startsWith('https')) return;

    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'story-${story.id}',
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ModuleRadius.r12),
          side: BorderSide(
            color: context.surfaceColor,
            width: 1,
          ),
        ),
        child: InkWell(
          onTap: () => _launchUrl(story.url),
          borderRadius: BorderRadius.circular(ModuleRadius.r12),
          child: Padding(
            padding: const EdgeInsets.all(ModulePadding.a16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  story.title,
                  style: context.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: ModulePadding.v8),

                // URL Preview
                if (story.url != null) ...[
                  Text(
                    story.url!,
                    style: context.bodySmall?.copyWith(
                      color: context.primaryColor,
                      decoration: TextDecoration.underline,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: ModulePadding.v12),
                ],

                // Author and Score Row
                Row(
                  children: [
                    // Author
                    InkWell(
                      onTap: onAuthorTap,
                      borderRadius: BorderRadius.circular(ModuleRadius.r20),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: ModulePadding.v4,
                          horizontal: ModulePadding.h8,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.person_outline,
                              size: 16,
                              color: context.onSurfaceColor.withOpacity(0.6),
                            ),
                            const SizedBox(width: ModulePadding.h4),
                            Text(
                              story.by,
                              style: context.bodyMedium?.copyWith(
                                color: context.onSurfaceColor.withOpacity(0.6),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                    // Score
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: ModulePadding.h8,
                        vertical: ModulePadding.v4,
                      ),
                      decoration: BoxDecoration(
                        color: context.primaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(ModuleRadius.r20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.arrow_upward,
                            size: 16,
                            color: context.primaryColor,
                          ),
                          const SizedBox(width: ModulePadding.h4),
                          Text(
                            story.score.toString(),
                            style: context.bodyMedium?.copyWith(
                              color: context.primaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
