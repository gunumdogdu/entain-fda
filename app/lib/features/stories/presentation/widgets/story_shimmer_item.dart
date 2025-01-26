import 'package:flutter/cupertino.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/constants/module_padding.dart';
import '../../../../core/constants/module_radius.dart';

class StoryShimmerItem extends StatelessWidget {
  const StoryShimmerItem({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = CupertinoTheme.of(context).brightness == Brightness.dark;

    // Use darker colors for dark mode
    final baseColor =
        isDark ? const Color(0xFF2C2C2E) : CupertinoColors.systemGrey5;
    final highlightColor =
        isDark ? const Color(0xFF3A3A3C) : CupertinoColors.systemGrey4;

    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: ModulePadding.h16,
        vertical: ModulePadding.v8,
      ),
      decoration: BoxDecoration(
        color: isDark
            ? CupertinoColors.systemBackground.darkColor
            : CupertinoColors.white,
        borderRadius: BorderRadius.circular(ModuleRadius.r12),
      ),
      child: Shimmer.fromColors(
        baseColor: baseColor,
        highlightColor: highlightColor,
        child: Padding(
          padding: const EdgeInsets.all(ModulePadding.a16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: ModuleSize.icon16,
                decoration: BoxDecoration(
                  color: CupertinoColors.white,
                  borderRadius: BorderRadius.circular(ModuleRadius.r4),
                ),
              ),
              const SizedBox(height: ModulePadding.v8),
              Container(
                width: 200,
                height: ModuleSize.icon16,
                decoration: BoxDecoration(
                  color: CupertinoColors.white,
                  borderRadius: BorderRadius.circular(ModuleRadius.r4),
                ),
              ),
              const SizedBox(height: ModulePadding.v12),
              Row(
                children: [
                  Container(
                    width: ModuleSize.icon24,
                    height: ModuleSize.icon24,
                    decoration: const BoxDecoration(
                      color: CupertinoColors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: ModulePadding.h8),
                  Container(
                    width: 100,
                    height: ModuleSize.icon12,
                    decoration: BoxDecoration(
                      color: CupertinoColors.white,
                      borderRadius: BorderRadius.circular(ModuleRadius.r4),
                    ),
                  ),
                  const SizedBox(width: ModulePadding.h16),
                  Container(
                    width: 80,
                    height: ModuleSize.icon12,
                    decoration: BoxDecoration(
                      color: CupertinoColors.white,
                      borderRadius: BorderRadius.circular(ModuleRadius.r4),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
