import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/text_styles.dart';

AppBar customAppBar(String name) {
  return AppBar(
    shape: const Border(
      bottom: BorderSide(
        color: AppColors.lighterGrey,
        width: 1,
      ),
    ),
    backgroundColor: AppColors.backgroundColor,
    centerTitle: true,
    title: Text(
      name,
      style: TextStyles.textStyle20SemiBold,
    ),
  );
}
