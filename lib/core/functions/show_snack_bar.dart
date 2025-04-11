import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_strings.dart';
import '../utils/text_styles.dart';
import '../widgets/horizontal_space.dart';

void showSnackBar(BuildContext context, String text, String type) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      margin: const EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      behavior: SnackBarBehavior.floating,
      elevation: 0.0,
      content: Row(
        children: [
          Icon(
            type == AppStrings.error
                ? Icons.error_outline
                : Icons.check_circle_outline,
            color: Colors.white,
          ),
          const HorizontalSpace(size: 8),
          Expanded(
            child: Text(
              text,
              style: TextStyles.textStyle14SemiBold
                  .copyWith(color: AppColors.whiteColor),
            ),
          ),
        ],
      ),
      backgroundColor:
          type == AppStrings.error ? Colors.red : Colors.greenAccent[400],
    ),
  );
}
