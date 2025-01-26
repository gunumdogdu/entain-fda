import 'package:api/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:hacker_news/features/user/presentation/widgets/divider.dart';

import '../../../../core/utils/date_formatter.dart';

class UserHeader extends StatelessWidget {
  final UserModel user;

  const UserHeader({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final isDark = CupertinoTheme.of(context).brightness == Brightness.dark;
    final textTheme = CupertinoTheme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? CupertinoColors.systemGrey6 : CupertinoColors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User Avatar and Basic Info
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: CupertinoColors.activeOrange.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      user.id[0].toUpperCase(),
                      style: textTheme.navTitleTextStyle.copyWith(
                        color: CupertinoColors.activeOrange,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.id,
                        style: textTheme.navTitleTextStyle.copyWith(
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(
                            CupertinoIcons.calendar,
                            size: 14,
                            color: CupertinoColors.systemGrey,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Member since ${formatDate(user.created)}',
                            style: textTheme.tabLabelTextStyle.copyWith(
                              color: CupertinoColors.systemGrey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Stats Row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                _buildStatItem(
                  context,
                  CupertinoIcons.arrow_up_circle,
                  'Karma',
                  user.karma.toString(),
                ),
                const SizedBox(width: 24),
                _buildStatItem(
                  context,
                  CupertinoIcons.doc_text,
                  'Stories',
                  user.submitted.length.toString(),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // About Section
          if (user.about?.isNotEmpty == true) ...[
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About',
                    style: textTheme.navTitleTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    user.about!,
                    style: textTheme.textStyle.copyWith(
                      color: CupertinoColors.systemGrey,
                    ),
                  ),
                ],
              ),
            ),
          ],

          const Divider(),

          // Submitted Stories Header
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Submitted Stories',
              style: textTheme.navTitleTextStyle.copyWith(
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(
    BuildContext context,
    IconData icon,
    String label,
    String value,
  ) {
    final textTheme = CupertinoTheme.of(context).textTheme;

    return Row(
      children: [
        Icon(
          icon,
          size: 16,
          color: CupertinoColors.activeOrange,
        ),
        const SizedBox(width: 4),
        Text(
          value,
          style: textTheme.textStyle.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: textTheme.tabLabelTextStyle.copyWith(
            color: CupertinoColors.systemGrey,
          ),
        ),
      ],
    );
  }
}
