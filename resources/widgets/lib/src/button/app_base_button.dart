import 'package:flutter/material.dart';

/// `AppBaseButton` is a customizable Flutter widget that provides a button
/// with various styling options.
///
/// ## Parameters:
/// - `onTap`: A callback function to be executed when the button is tapped.
/// - `txt`: The text to be displayed on the button. Defaults to an empty string
/// - `widget`: An optional widget to be displayed on the button instead of text
/// - `padding`: The padding around the button. Defaults to zero padding.
/// - `style`: The style of the button. If null, it uses the default
/// elevated button style.
/// - `btnKey`: An optional key that can be used to uniquely identify the button
/// - `width`: The width of the button. If null, the button takes the
/// width of its child.
/// - `bgColor`: The background color of the button. Defaults to the background
///  color of the current theme.
/// - `textStyle`: The text style of the button text. If provided, it overrides
/// the default text style.
/// - `textColor`: The text color of the button. If not provided, it uses the
/// default text color from the current theme.
/// - `isLoading`: A boolean indicating whether the button is in a loading state.
///
/// ## Example:
/// ```dart
/// AppBaseButton(
///   onTap: () {
///     // Handle button tap
///   },
///   txt: 'Click me',
///   textColor: Colors.white,
///   bgColor: Colors.blue,
///   width: 200.0,
///   isLoading: false,
/// )
/// ```
class AppBaseButton extends StatelessWidget {
  /// Creates an instance of `AppBaseButton`.
  ///
  /// The `onTap` parameter is required, while all other parameters are optional
  const AppBaseButton({
    required this.onTap,
    super.key,
    this.txt = '',
    this.widget,
    this.padding,
    this.style,
    this.btnKey,
    this.textColor,
    this.bgColor,
    this.width,
    this.textStyle,
    this.isLoading = false,
  });

  /// Primary Button for current Module
  factory AppBaseButton.primary({
    required VoidCallback onTap,
    required String title,
    bool isLoading = false,
    Color? bgColor,
  }) {
    return AppBaseButton(
      onTap: onTap,
      txt: title,
      textColor: Colors.white,
      bgColor: (context) => isLoading
          ? Theme.of(context).colorScheme.outline
          : bgColor ?? Colors.blue,
      isLoading: isLoading,
    );
  }

  /// Secondary Button for current Module
  factory AppBaseButton.secondary({
    required VoidCallback onTap,
    required String title,
    bool isLoading = false,
    Color? bgColor,
  }) {
    return AppBaseButton(
      onTap: onTap,
      txt: title,
      textColor: Colors.white,
      bgColor: (context) => isLoading
          ? Theme.of(context).colorScheme.outline
          : bgColor ?? Colors.grey[200]!,
      isLoading: isLoading,
    );
  }

  /// Primary Button With Icon for current Module
  factory AppBaseButton.primaryWithIcon({
    required VoidCallback onTap,
    required String title,
    required Widget icon,
    Color? bgColor,
  }) {
    return AppBaseButton(
      bgColor: (context) => bgColor,
      onTap: onTap,
      widget: (context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: Colors.white),
          ),
          icon,
        ],
      ),
    );
  }

  /// Secondary Button With Icon for current Module
  factory AppBaseButton.secondaryWithIcon({
    required VoidCallback onTap,
    required String title,
    required Widget icon,
    Color? bgColor,
  }) {
    return AppBaseButton(
      bgColor: (context) =>
          bgColor ?? Theme.of(context).colorScheme.onSecondary,
      onTap: onTap,
      widget: (context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: Colors.white),
          ),
          icon,
        ],
      ),
    );
  }

  /// A callback function to be executed when the button is tapped.
  final VoidCallback? onTap;

  /// The text to be displayed on the button. Defaults to an empty string.
  final String? txt;

  /// An optional widget to be displayed on the button instead of text.
  final Widget? Function(BuildContext)? widget;

  /// The padding around the button. Defaults to zero padding.
  final EdgeInsets? padding;

  /// The style of the button. If null, it uses the
  /// default elevated button style.
  final ButtonStyle? style;

  /// An optional key that can be used to uniquely identify the button.
  final Key? btnKey;

  /// The width of the button. If null, the button takes the width of its child.
  final double? width;

  /// The background color of the button. Defaults to the background
  /// color of the current theme.
  final Color? Function(BuildContext)? bgColor;

  /// The text style of the button text. If provided, it overrides
  /// the default text style.
  final TextStyle? textStyle;

  /// The text color of the button. If not provided, it uses the
  /// default text color from the current theme.
  final Color? textColor;

  /// A boolean indicating whether the button is in a loading state.
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Padding(
        key: btnKey,
        padding: padding ?? EdgeInsets.zero,
        child: ElevatedButton(
          onPressed: isLoading ? null : onTap,
          style: style ??
              ElevatedButtonTheme.of(context).style!.copyWith(
                    backgroundColor: bgColor?.call(context) == null
                        ? null
                        : WidgetStateProperty.all<Color>(
                            bgColor!.call(context)!,
                          ),
                  ),
          child: isLoading
              ? SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(textColor!),
                  ),
                )
              : widget?.call(context) ??
                  Text(
                    txt!,
                    style: textStyle?.copyWith(color: textColor) ??
                        Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(color: textColor),
                  ),
        ),
      ),
    );
  }
}
