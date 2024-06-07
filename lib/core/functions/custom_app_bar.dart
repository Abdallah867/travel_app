import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/text_styles.dart';

AppBar customAppBar(String name) {
  return AppBar(
    backgroundColor: AppColors.backgroundColor,
    centerTitle: true,
    title: Text(
      name,
      style: TextStyles.textStyle20SemiBold,
    ),
  );
}
