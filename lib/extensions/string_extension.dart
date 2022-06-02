// ignore_for_file: unnecessary_this

import '../../utils/constants.dart';

/// A utility with extensions for strings.
extension StringExt on String {
  /// An extension for validating String is a contact.
  bool get isValidContact => Constants.contactRegex.hasMatch(this);

  /// An extension for validating String is a valid OTP digit
  bool get isValidOtpDigit => Constants.otpDigitRegex.hasMatch(this);
}
