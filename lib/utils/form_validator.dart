import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobilefirst/extensions/string_extension.dart';

//Helpers
import 'constants.dart';

/// A utility class that holds methods for validating different textFields.
/// This class has no constructor and all methods are `static`.
@immutable
class FormValidator {
  const FormValidator._();

  /// A method containing validation logic for contact number input.
  static String? contactValidator(String? contact) {
    if (contact!.isEmpty && !contact.isValidContact) {
      return Constants.invalidContactError;
    }
    return null;
  }

  /// A method containing validation logic for single otp digit input.
  static String? otpDigitValidator(String? digit) {
    if (digit!.isEmpty || !digit.isValidOtpDigit) {
      return Constants.invalidOtp;
    }
    return null;
  }
}
