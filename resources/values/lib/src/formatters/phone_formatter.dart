import 'package:flutter/services.dart';

///Formats input as Turkish phone number: +90 (5XX) XXX XX XX
class PhoneInputFormatter extends TextInputFormatter {
  static const String prefix = '+90 ';

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Initialize with prefix if empty
    if (newValue.text.isEmpty) {
      return const TextEditingValue(
        text: prefix,
        selection: TextSelection.collapsed(offset: 4),
      );
    }

    // Ensure prefix is intact
    if (!newValue.text.startsWith(prefix)) {
      if (newValue.text.length == 1) {
        // If it's a single digit input, add it after prefix
        return TextEditingValue(
          text: '$prefix(${newValue.text}',
          selection: TextSelection.collapsed(offset: prefix.length + 2),
        );
      }
      return oldValue;
    }

    // Get only the digits after prefix
    final oldDigits =
        oldValue.text.substring(prefix.length).replaceAll(RegExp(r'\D'), '');
    final newDigits =
        newValue.text.substring(prefix.length).replaceAll(RegExp(r'\D'), '');

    // Handle backspace - if we're deleting, remove only one digit
    var digits = newDigits;
    if (oldValue.text.length > newValue.text.length &&
        oldDigits.length > newDigits.length) {
      digits = oldDigits.substring(0, oldDigits.length - 1);
    }

    // Limit to 10 digits
    if (digits.length > 10) {
      digits = digits.substring(0, 10);
    }

    // Build the formatted string
    final buffer = StringBuffer(prefix);
    int index = 0;

    // Format as +90 (5XX) XXX XX XX
    if (digits.isNotEmpty) buffer.write('(');
    while (index < digits.length && index < 3) {
      buffer.write(digits[index]);
      index++;
    }
    if (index == 3 && digits.length > 3) buffer.write(') ');
    while (index < digits.length && index < 6) {
      buffer.write(digits[index]);
      index++;
    }
    if (index == 6 && digits.length > 6) buffer.write(' ');
    while (index < digits.length && index < 8) {
      buffer.write(digits[index]);
      index++;
    }
    if (index == 8 && digits.length > 8) buffer.write(' ');
    while (index < digits.length && index < 10) {
      buffer.write(digits[index]);
      index++;
    }

    final formattedText = buffer.toString();
    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}
