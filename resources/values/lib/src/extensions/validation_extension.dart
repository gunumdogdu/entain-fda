extension ValidationExtension on String? {
  String? toApiValidator(
    String value, {
    required String requiredMessage,
    required String errorMessage,
    bool required = true,
  }) {
    if (this == null) {
      if (required) {
        throw FormatException(requiredMessage);
      }
      return this;
    }
    return value;
  }

  String? minLenghtChecker(
    int desiredLenght, {
    required String requiredMessage,
    required String errorMessage,
    bool required = true,
  }) {
    if (this == null || this!.isEmpty) {
      return !required ? null : requiredMessage;
    }
    if (this!.length < desiredLenght) {
      return errorMessage;
    }
    return null;
  }

  ///for validate Email
  String? isMail({
    required String requiredMessage,
    required String errorMessage,
    bool required = true,
  }) {
    const pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    final regExp = RegExp(pattern);
    if (this == null || this!.isEmpty) {
      return !required ? null : requiredMessage;
    } else if (!regExp.hasMatch(this!)) {
      return errorMessage;
    }
    return null;
  }

  String? isNotEmptyController({
    required String requiredMessage,
  }) {
    if (this == null || this!.isEmpty) {
      return requiredMessage;
    }
    return null;
  }

  ///for validate Turkish phone number
  String? isTurkishPhone({
    required String requiredMessage,
    required String invalidMessage,
    required String startWithMessage,
    bool required = true,
  }) {
    if (this == null || this!.isEmpty) {
      return !required ? null : requiredMessage;
    }
    // Remove all non-digits but keep the + sign for country code
    final input = this!.replaceAll(RegExp(r'[^\d+]'), '');

    // Check if it starts with +90
    if (!input.startsWith('+90')) {
      return invalidMessage;
    }

    // Get the number without country code
    final digits = input.substring(3); // Remove +90

    // Check if it's 10 digits and starts with 5
    if (digits.length != 10) {
      return invalidMessage;
    }
    if (!digits.startsWith('5')) {
      return startWithMessage;
    }
    return null;
  }
}
