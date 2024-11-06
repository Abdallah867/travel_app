import 'package:flutter/material.dart';
import '../utils/app_regex.dart';

String? validateEmail(String? value, BuildContext context) {
  if (value?.isEmpty ?? true) {
    return "Field required";
  } else {
    return AppRegex.isEmailValid(
      value!,
    )
        ? null
        : 'Invalid Email';
  }
}
