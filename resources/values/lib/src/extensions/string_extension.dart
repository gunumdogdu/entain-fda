import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// Flutter extension for the [String] class, providing
/// additional functionalities
/// for working with strings, launching URLs, and rendering SVG images.
extension StringExtension on String {
  /// Launches a web link using the URL launcher. This extension parses the
  /// current string as a URL and attempts to launch it. Any errors during the
  /// launch process are caught and printed to the debug console.
  Future<void> launchLink() async {
    try {
      final url = Uri.parse(this);
      await launchUrl(url);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// Converts a formatted phone number string to a clean format
  /// Keeps only digits and + sign, removes all other characters
  /// Example: "+90 (541) 794-05-56" -> "+905417940556"
  String toPhoneNumber() {
    return replaceAll(RegExp(r'[^\d+]'), '');
  }
}
