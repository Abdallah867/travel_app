import 'package:flutter/material.dart';

String? validatePassword(String? password, BuildContext context) {
  if (password?.isEmpty ?? true) {
    return "Field required";
  } else {
    if (password!.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    if (!RegExp(r'(?=.*[a-z])').hasMatch(password)) {
      return 'Password must contain at least one lowercase letter';
    }
    if (!RegExp(r'(?=.*[A-Z])').hasMatch(password)) {
      return 'Password must contain at least one uppercase letter';
    }
    if (!RegExp(r'(?=.*\d)').hasMatch(password)) {
      return 'Password must contain at least one digit';
    }
    // if (!RegExp(r'(?=.*[@$!%*?&])').hasMatch(password)) {
    //   return 'Password must contain at least one special character';
    // }
    return null;
  }
}
