import 'package:flutter/material.dart';
import '../utils/app_regex.dart';

String? validatePhoneNumber(String? value, BuildContext context) {
  if (value?.isEmpty ?? true) {
    return "Field required";
  } else {
    return AppRegex.isPhoneNumberValid(
      value!,
    )
        ? null
        : 'Invalid Phone Number';
  }
}
