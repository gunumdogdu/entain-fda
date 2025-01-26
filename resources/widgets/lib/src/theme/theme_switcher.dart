import 'package:flutter/material.dart';
import 'package:values/values.dart';

///A widget that provides a custom theme switcher with dark/light mode toggle
class ThemeSwitcherWidget extends StatelessWidget {
  ///Creates a theme switcher widget
  const ThemeSwitcherWidget({
    required this.isDark,
    required this.onChanged,
    super.key,
  });

  ///Current theme state
  final bool isDark;

  ///Callback when theme is changed
  final VoidCallback onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: SizedBox(
            width: 120,
            child: Stack(
              children: [
                // Sliding background
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeInOut,
                  left: isDark ? 0 : 60,
                  top: 0,
                  bottom: 0,
                  child: Container(
                    width: 60,
                    decoration: BoxDecoration(
                      color: isDark ? Colors.black : Colors.white,
                      borderRadius: BorderRadius.circular(32),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                  ),
                ),
                // Icons row
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _IconSegment(
                      onTap: () {
                        if (!isDark) onChanged();
                      },
                      icon: IconAssets.instance.moonIcon,
                      iconColor: isDark ? Colors.white : Colors.black,
                    ),
                    _IconSegment(
                      onTap: () {
                        if (isDark) onChanged();
                      },
                      icon: IconAssets.instance.brightIcon,
                      iconColor: !isDark ? Colors.blue : Colors.black,
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

class _IconSegment extends StatelessWidget {
  const _IconSegment({
    required this.onTap,
    required this.icon,
    required this.iconColor,
  });

  final VoidCallback onTap;
  final SvgGeneralImage icon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 60,
        child: Center(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: icon.svg(
              key: ValueKey(iconColor),
              color: iconColor,
              height: 24,
            ),
          ),
        ),
      ),
    );
  }
}
