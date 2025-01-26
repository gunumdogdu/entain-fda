import 'package:api/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:hacker_news/core/constants/module_padding.dart';
import 'package:values/values.dart';

import '../../../../core/constants/module_opacity.dart';
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
                  color:
                      CupertinoColors.activeBlue.withOpacity(ModuleOpacity.o01),
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
                      style: context.titleLarge.copyWith(
                        color: context.onSurface,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      context.i10n.memberSince(formatDate(user.created)),
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
                context.i10n.karma,
                user.karma.toString(),
                CupertinoIcons.arrow_up_circle_fill,
              ),
              const SizedBox(width: 24),
              _buildStat(
                context,
                context.i10n.stories,
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
          size: ModuleSize.icon18,
          color: CupertinoColors.activeBlue,
        ),
        const SizedBox(width: ModulePadding.v8),
        Text(
          textAlign: TextAlign.left,
          value,
          style: context.titleSmall.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: context.onSurface,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          label,
          textAlign: TextAlign.left,
          style: textTheme.tabLabelTextStyle.copyWith(
            color: CupertinoColors.systemGrey,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
