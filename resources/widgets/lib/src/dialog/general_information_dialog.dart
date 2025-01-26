import 'package:flutter/material.dart';
import 'package:widgets/widget.dart';

///Generates Information Dialog for
class GeneralInformationDialog<T> extends DialogWidget<T> {
  /// Generates [GeneralInformationDialog]
  const GeneralInformationDialog({
    required this.message,
    required this.firstButtonTitle,
    required this.onTapBtn,
    required this.onTapSecondBtn,
    this.secondButtonTitle,
    super.key,
  });

  ///Message to display on dialog
  final String message;

  ///Message to display on dialog
  final String firstButtonTitle;

  ///Message to display on dialog
  final String? secondButtonTitle;

  ///Message to display on dialog
  final VoidCallback onTapBtn;

  ///Message to display on dialog
  final VoidCallback? onTapSecondBtn;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          message,
          style: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: Theme.of(context).colorScheme.surface),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        AppBaseButton.primary(onTap: onTapBtn, title: firstButtonTitle),
        if (secondButtonTitle != null)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: AppBaseButton.secondary(
              onTap: () => onTapSecondBtn?.call(),
              title: secondButtonTitle ?? '',
            ),
          ),
      ],
    );
  }
}
