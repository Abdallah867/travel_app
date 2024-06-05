import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/app_colors.dart';

class ProfileMenu extends StatelessWidget {
  final String name;
  final IconData icon;

  const ProfileMenu({
    super.key,
    required this.name,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
      child: ListTile(
        tileColor: AppColors.whiteColor,
        leading: Icon(
          icon,
          color: Colors.black,
        ),
        title: Text(name),
        trailing: const Icon(Icons.arrow_forward_ios),
        minVerticalPadding: 20.h,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
      ),
    );
  }
}
