// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

///Text field with a title above it
class ModuleTextFieldWithTitle extends StatelessWidget {
  ///Creates a text field with a title above it
  const ModuleTextFieldWithTitle({
    required this.controller,
    required this.title,
    this.hintTitle,
    this.textInputType,
    this.textInputAction,
    this.fNode,
    this.validator,
    this.onChange,
    this.onFieldSubmitted,
    this.suffixIcon,
    this.onTapSuffix,
    this.suffixIconConstraint,
    this.suffixPaddingOnRight,
    this.maxLines,
    this.fillColor,
    this.inputFormatters,
    this.inputStyle,
    this.maxChar,
    this.fieldConstraint,
    this.prefixIcon,
    this.prefixPaddingOnLeft,
    this.prefixIconConstraint,
    this.readyOnly = false,
    this.enabled = true,
    this.autoFocus = false,
    this.expand = false,
    this.obscureText = false,
    this.textCapitalization = TextCapitalization.none,
    super.key,
  });

  ///Text Editing Controller
  final TextEditingController controller;

  ///Title to display above the text field
  final String title;

  ///hint title of current text field
  final String? hintTitle;

  ///Text Input Type
  final TextInputType? textInputType;

  ///Text Input Action
  final TextInputAction? textInputAction;

  ///Focus Node
  final FocusNode? fNode;

  ///Validator
  final String? Function(String?)? validator;

  ///OnChange
  final void Function(String?)? onChange;

  ///OnFieldSubmitted
  final void Function(String?)? onFieldSubmitted;

  ///Suffix icon to display
  final Widget? suffixIcon;

  ///Function to call when suffix icon onTapped
  final VoidCallback? onTapSuffix;

  ///Suffix constraints
  final BoxConstraints? suffixIconConstraint;

  ///Suffix Icon padding on right
  final double? suffixPaddingOnRight;

  ///Suffix Icon padding on right
  final int? maxLines;

  ///Fill color
  final Color? fillColor;

  ///Input formatters
  final List<TextInputFormatter>? inputFormatters;

  ///Input style
  final TextStyle? inputStyle;

  ///Max characters
  final int? maxChar;

  ///Field constraints
  final BoxConstraints? fieldConstraint;

  ///Prefix icon
  final Widget? prefixIcon;

  ///Prefix padding on left
  final double? prefixPaddingOnLeft;

  ///Prefix constraints
  final BoxConstraints? prefixIconConstraint;

  ///is Read Only
  final bool readyOnly;

  ///is enabled
  final bool enabled;

  ///auto focus
  final bool autoFocus;

  ///expand
  final bool expand;

  ///obscure text
  final bool obscureText;

  ///text capitalization
  final TextCapitalization textCapitalization;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 14, right: 14, bottom: 12),
          child: Text(
            title.toUpperCase(),
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: Theme.of(context).colorScheme.outlineVariant,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ),
        ModuleTextField(
          controller: controller,
          hintTitle: hintTitle,
          textInputType: textInputType,
          textInputAction: textInputAction,
          fNode: fNode,
          validator: validator,
          onChange: onChange,
          onFieldSubmitted: onFieldSubmitted,
          suffixIcon: suffixIcon,
          onTapSuffix: onTapSuffix,
          suffixIconConstraint: suffixIconConstraint,
          suffixPaddingOnRight: suffixPaddingOnRight,
          maxLines: maxLines,
          fillColor: fillColor,
          inputFormatters: inputFormatters,
          inputStyle: inputStyle,
          maxChar: maxChar,
          fieldConstraint: fieldConstraint,
          prefixIcon: prefixIcon,
          prefixPaddingOnLeft: prefixPaddingOnLeft,
          prefixIconConstraint: prefixIconConstraint,
          readyOnly: readyOnly,
          enabled: enabled,
          autoFocus: autoFocus,
          expand: expand,
          obscureText: obscureText,
          textCapitalization: textCapitalization,
        ),
      ],
    );
  }
}

///Text field to use with multiple options
class ModuleTextField extends StatelessWidget {
  ///Generates [ModuleTextField]
  const ModuleTextField({
    required this.controller,
    this.readyOnly = false,
    this.enabled = true,
    this.autoFocus = false,
    this.expand = false,
    this.obscureText = false,
    this.textCapitalization = TextCapitalization.none,
    super.key,
    this.textInputType,
    this.textInputAction,
    this.fNode,
    this.validator,
    this.onChange,
    this.onFieldSubmitted,
    this.suffixIcon,
    this.title,
    this.onTapSuffix,
    this.suffixIconConstraint,
    this.suffixPaddingOnRight,
    this.maxLines,
    this.fillColor,
    this.inputFormatters,
    this.inputStyle,
    this.maxChar,
    this.hintTitle,
    this.fieldConstraint,
    this.labelStyle,
    this.prefixIcon,
    this.prefixPaddingOnLeft,
    this.prefixIconConstraint,
  });

  ///Text Editing Controller
  final TextEditingController controller;

  ///Suffix icon to display
  final Widget? suffixIcon;

  ///Suffix icon to display
  final Widget? prefixIcon;

  ///title of current text field
  final String? title;

  ///hint title of current text field
  final String? hintTitle;

  ///Text Input Type
  final TextInputType? textInputType;

  ///Text Input Action
  final TextInputAction? textInputAction;

  ///Focus Node
  final FocusNode? fNode;

  ///Validator
  final String? Function(String?)? validator;

  ///OnChange
  final void Function(String?)? onChange;

  ///OnFieldSubmitted
  final void Function(String?)? onFieldSubmitted;

  ///Function to call when suffix icon onTapped
  final VoidCallback? onTapSuffix;

  ///is Read Only
  final bool readyOnly;

  ///is Read Only
  final bool enabled;

  ///is Read Only
  final bool autoFocus;

  ///is Read Only
  final bool expand;

  ///is Read Only
  final bool obscureText;

  ///Suffix Icon padding on right
  final double? suffixPaddingOnRight;

  ///Suffix Icon padding on right
  final double? prefixPaddingOnLeft;

  ///Suffix Icon padding on right
  final int? maxLines;

  ///Fill color
  final Color? fillColor;

  ///Suffix constraints
  final BoxConstraints? suffixIconConstraint;

  ///Suffix constraints
  final BoxConstraints? prefixIconConstraint;

  ///Field constraints
  final BoxConstraints? fieldConstraint;

  ///Suffix constraints
  final TextStyle? inputStyle;

  ///Suffix constraints
  final TextStyle? labelStyle;

  ///Suffix constraints
  final int? maxChar;

  final TextCapitalization textCapitalization;

  ///Suffix constraints
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      onChanged: onChange,
      onFieldSubmitted: onFieldSubmitted,
      validator: validator,
      buildCounter: (
        context, {
        required currentLength,
        required isFocused,
        maxLength,
      }) =>
          null,
      focusNode: fNode,
      textInputAction: textInputAction ?? TextInputAction.next,
      keyboardType: textInputType,
      maxLines: maxLines,
      style: inputStyle,
      controller: controller,
      autofocus: autoFocus,
      inputFormatters: inputFormatters,
      maxLength: maxChar,
      expands: expand,
      obscureText: obscureText,
      onTapOutside: (_) => FocusScope.of(context).unfocus(),
      textCapitalization: textCapitalization,
      decoration: InputDecoration(
        hintText: hintTitle,
        hintStyle: Theme.of(context).textTheme.labelLarge,
        labelText: title,
        labelStyle: labelStyle,
        constraints: fieldConstraint,
        fillColor: fillColor,
        floatingLabelAlignment: FloatingLabelAlignment.start,
      ),
    );
  }
}
