import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/font_weight_helper.dart';
import '../../../../../core/utils/text_styles.dart';

class HaveAnAccountWidget extends StatelessWidget {
  const HaveAnAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already have an account? ",
          style: TextStyles.textStyle14
              .copyWith(fontWeight: FontWeightHelper.semiBold),
        ),
        GestureDetector(
          onTap: () {
            context.go(AppRoutes.kLoginView);
          },
          child: Text(
            "Login",
            style: TextStyles.textStyle14.copyWith(
                color: AppColors.secondaryColor,
                fontWeight: FontWeightHelper.semiBold),
          ),
        ),
      ],
    );
  }
}
