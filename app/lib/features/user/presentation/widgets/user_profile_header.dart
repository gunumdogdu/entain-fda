import 'package:api/api.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/utils/date_formatter.dart';

class UserProfileHeader extends StatelessWidget {
  final UserModel user;

  const UserProfileHeader({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final isDark = CupertinoTheme.of(context).brightness == Brightness.dark;
    final textTheme = CupertinoTheme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.all(16),
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
          Row(
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: CupertinoColors.activeBlue.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    user.id[0].toUpperCase(),
                    style: textTheme.navLargeTitleTextStyle.copyWith(
                      color: CupertinoColors.activeBlue,
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
                      style: textTheme.navTitleTextStyle,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Member since ${formatDate(user.created)}',
                      style: textTheme.textStyle.copyWith(
                        color: CupertinoColors.systemGrey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _buildStat(
                context,
                'Karma',
                user.karma.toString(),
                CupertinoIcons.arrow_up_circle_fill,
              ),
              const SizedBox(width: 24),
              _buildStat(
                context,
                'Stories',
                user.submitted.length.toString(),
                CupertinoIcons.doc_text_fill,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStat(
    BuildContext context,
    String label,
    String value,
    IconData icon,
  ) {
    final textTheme = CupertinoTheme.of(context).textTheme;

    return Row(
      children: [
        Icon(
          icon,
          size: 18,
          color: CupertinoColors.activeBlue,
        ),
        const SizedBox(width: 8),
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
