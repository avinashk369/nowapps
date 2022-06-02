import 'package:flutter/material.dart';

/// A utility class that holds constants for useful and commonly
/// used values throughout the entire app.
/// This class has no constructor and all variables are `static`.
@immutable
class Constants {
  const Constants._();

  /// The regular expression for validating contacts in the app.
  static RegExp contactRegex = RegExp(r"^\+?0[0-9]{10}$");

  /// The regular expression for validating credit card expiry in the app.
  static final RegExp otpDigitRegex = RegExp('^[0-9]{6}\$');

  /// invalid otp
  static const invalidOtp = "Please enter valid OTP";

  /// The error message for invalid contact input.
  static const invalidContactError = 'Please enter a valid mobile number';

  static T? toNull<T>(Object? _) => null;
}
