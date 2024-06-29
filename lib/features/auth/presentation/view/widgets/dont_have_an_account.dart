import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/font_weight_helper.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/widgets/horizontal_space.dart';
import '../../../../../generated/l10n.dart';

class DontHaveAnAccountWidget extends StatelessWidget {
  const DontHaveAnAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          S.of(context).dontHaveAnAccount,
          style: TextStyles.textStyle14
              .copyWith(fontWeight: FontWeightHelper.semiBold),
        ),
        const HorizontalSpace(size: 4),
        GestureDetector(
          onTap: () {
            context.go(AppRoutes.kRegisterView);
          },
          child: Text(
            S.of(context).signup,
            style: TextStyles.textStyle14.copyWith(
                color: AppColors.secondaryColor,
                fontWeight: FontWeightHelper.semiBold),
          ),
        ),
      ],
    );
  }
}
