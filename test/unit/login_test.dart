import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobilefirst/utils/form_validator.dart';

void main() {
  group('unit test', () {
    test('phone number invalid', () {
      final result = FormValidator.contactValidator('');
      expect(result, 'Please enter a valid mobile number');
    });
    test('phone number valid', () {
      final result = FormValidator.contactValidator('9546219191');
      expect(result, null);
    });
  });
}
