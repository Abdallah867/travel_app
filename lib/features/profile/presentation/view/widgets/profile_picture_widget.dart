import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/app_colors.dart';

class ProfilePictureWidget extends StatelessWidget {
  const ProfilePictureWidget({
    super.key,
  });

  //TODO: REUSE WIDGET IN MAIN SCREEN

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 50.r,
      backgroundColor: AppColors.secondaryColor,
      // backgroundImage: NetworkImage(state.user.imageUrl),
    );
  }
}
