import 'package:common/src/i10n/lan/tr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show Locale;

/// Default Locale ayarlarımız
const Locale kDefaultLocal = Locale('tr');

/// TODO: TEMPORARY - Currently forcing Turkish only. When multi-language support is needed:
/// 1. Restore the supportedLocalization map to include both 'en' and 'tr'
/// 2. Remove this comment
/// Ugulamanın desteklediği diler
Map<String, AppLocalizationLabel> supportedLocalization = {
  'tr': TrLocalization(),
  //'en': EnLocalization(), // Temporarily disabled for Turkish-only display
};

///Function that returns all supported locales.
List<Locale> get getSupportedLocalList => List.generate(
      supportedLocalization.length,
      (int index) => Locale(
        supportedLocalization.keys.elementAt(index),
      ),
    );

///Base class for localization
abstract class AppLocalizationLabel {
  ///Language code
  String get lanCode;

  ///Language title
  String get localizationTitle;

  ///Default error message
  String get defaultErrorMessage;

  ///No internet error message
  String get noInternetErrorMessage;

  ///Unauthorized error message
  String get unauthorizedErrorMessage;

  ///Server error message
  String get serverErrorMessage;

  ///Cancel button text
  String get cancelBtnText;

  ///Try again button text
  String get tryAgainBtnText;

  ///Timeout error message
  String get timeoutErrorMessage;

  ///Unknown page route message text
  String get unknownPageRouteMessageText;

  ///E-Mail
  String get eMail;

  ///Login
  String get login;

  ///Login to your account
  String get loginToYourAccount;

  ///Password
  String get password;

  ///Welcome back
  String get welcomeBack;

  ///Dashboard
  String get dashboard;

  ///Document
  String get document;

  ///Task
  String get task;

  ///Transaction
  String get transaction;

  ///Unknown
  String get unknown;

  ///At least lenght text
  String atLeastLenghtText(int desiredLenght);

  ///Invalid credit card cvv text
  String get invalidCreditCardCvvText;

  ///Invalid credit card date text
  String get invalidCreditCardDateText;

  ///Invalid credit card number text
  String get invalidCreditCardNumberText;

  ///Invalid mail text
  String get invalidMailText;

  ///Invalid name text
  String get invalidNameText;

  ///Required text
  String get requiredText;

  ///Logout
  String get logout;

  ///Successfully logged in
  String get succesfullyLoggedIn;

  ///Successfully logged out
  String get succesfullyLoggedOut;

  ///Invalid phone number text
  String get invalidPhoneText;

  ///Phone must start with 5
  String get phoneStartWithText;

  ///Phone number text
  String get phoneNumber;

  ///Login title text
  String get loginTitle;

  ///Successful text
  String get successful;

  ///Error text
  String get error;

  ///Warning text
  String get warning;

  ///This feature is not available text
  String get thisFeatureIsNotAvailable;

  ///Approve text
  String get approve;

  ///Okay text
  String get okay;

  /// Title for OTP screen
  String get otpTitle;

  /// Description text for OTP screen
  String get otpDescription;

  /// Verify button text
  String get verify;

  /// Text shown when user hasn't received code
  String get noCodeReceived;

  /// Button text to resend OTP
  String get resendOtp;

  /// Error message for invalid OTP
  String get invalidOtpText;

  String get otpSentAgain;

  /// Company screen title
  String get companyScreenTitle;

  /// Companies
  String get companies;

  String get companyName;

  String showingEntries(int totalCount, int limit);
}
