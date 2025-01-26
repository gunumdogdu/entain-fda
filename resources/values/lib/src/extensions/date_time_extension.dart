import 'package:intl/intl.dart';

///Extension for manipulating DateTime variables
extension DateTimeExtension on DateTime {
  
  ///Converts date time to a format that backend accepts. 
  String apiRequestTypeFormatWithHour() {
    final formatter = DateFormat(
      'yyyy-MM-dd HH:mm',
    );
    return formatter.format(this);
  }

  ///Converts date time to a format that backend accepts.
  String apiRequestTypeFormatWithoutHour() {
    final formatter = DateFormat(
      'yyyy-MM-dd',
    );
    return formatter.format(this);
  }

  /// Time formatter to display user the current time in 
  /// hour minute format.
  String displayToTimeFormat() {
    final formatter = DateFormat(
      'HH:mm',
    );
    return formatter.format(this);
  }

  /// Time formatter to display user the current time in 
  /// dd-mm-yyyy format.
  String displayToDateFormat() {
    final formatter = DateFormat(
      'dd-MM-yyyy',
    );
    return formatter.format(this);
  }


  /// Time formatter to display user the current time in 
  /// dd-mm-yyyy format.
  String uiFormat() {
    final formatter = DateFormat(
      'dd-MM-yyyy HH:mm',
    );
    return formatter.format(this);
  }
  
  ///Returns if given DateTimes have same date and time.
  ///Checks only HH:mm 
  bool isSame(DateTime secondDateTime){
    final firstTime = uiFormat();
    final secondTime = secondDateTime.uiFormat();
    return firstTime==secondTime;
  }



}
