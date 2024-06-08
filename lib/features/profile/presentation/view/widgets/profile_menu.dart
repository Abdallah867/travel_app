import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../auth/presentation/manager/current_account_cubit/current_account_cubit.dart';

class ProfileMenu extends StatelessWidget {
  final String name;
  final IconData icon;
  final String path;

  const ProfileMenu({
    super.key,
    required this.name,
    required this.icon,
    required this.path,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 8.h),
      child: GestureDetector(
        onTap: () {
          context.push(
            path,
            extra: BlocProvider.of<CurrentAccountCubit>(context),
          );
        },
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
      ),
    );
  }
}
