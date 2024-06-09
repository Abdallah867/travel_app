import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/widgets/centered_text.dart';
import '../../../../../core/widgets/vertical_widget.dart';
import '../../../data/models/user_model.dart';

class ProfileInformationsWidget extends StatelessWidget {
  final UserModel? user;
  const ProfileInformationsWidget({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 50.r,
          backgroundColor: AppColors.secondaryColor,
          // backgroundImage: NetworkImage(state.user.imageUrl),
        ),
        const VerticalSpace(size: 8),
        CenteredText(
          text: user?.username ?? '',
          style: TextStyles.textStyle20.copyWith(fontWeight: FontWeight.bold),
        ),
        CenteredText(
          text: user?.email ?? '',
          style: TextStyles.textStyle14,
        ),
      ],
    );
  }
}
