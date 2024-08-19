import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/font_weight_helper.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../auth/presentation/manager/current_account_cubit/current_account_cubit.dart';

class ProfileMenu extends StatelessWidget {
  final String name;
  final IconData icon;
  final VoidCallback onTap;
  final Color? color;

  const ProfileMenu({
    super.key,
    required this.name,
    required this.icon,
    required this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      child: GestureDetector(
        onTap: onTap,
        child: ListTile(
          leading: Icon(
            icon,
            color: color ?? Colors.black,
            size: 24.sp,
          ),
          title: Text(
            name,
            style: TextStyles.textStyle16.copyWith(
              fontWeight: FontWeightHelper.semiBold,
              color: color ?? Colors.black,
            ),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: color ?? Colors.black,
            size: 20,
          ),
          // borderRadius: BorderRadius.circular(12.r),
        ),
      ),
    );
  }
}
