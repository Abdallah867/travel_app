import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/core/utils/app_colors.dart';
import 'package:travel_app/core/widgets/vertical_widget.dart';

import '../../../../core/utils/text_styles.dart';
import '../../../auth/presentation/manager/current_account_cubit/current_account_cubit.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentAccountCubit, CurrentAccountState>(
      builder: (context, state) {
        return Scaffold(
          body: Column(
            children: [
              const VerticalSpace(size: 24),
              const ProfilePictureWidget(),
              const VerticalSpace(size: 8),
              Text(
                'Abdallah23',
                style: TextStyles.textStyle20,
              ),
              const VerticalSpace(size: 2),
              Text(
                'abdoallahusma5704@gmail.com',
                style: TextStyles.textStyle14,
              ),
              const VerticalSpace(size: 24),
              const ProfileMenu(),
              const ProfileMenu(),
              const ProfileMenu(),
              const ProfileMenu(),
            ],
          ),
        );
      },
    );
  }
}

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

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 12.h),
      child: ListTile(
        tileColor: AppColors.greyBlueColor,
        leading: const Icon(
          Icons.person_outline,
          color: Colors.black,
        ),
        title: const Text("person"),
        trailing: const Icon(Icons.arrow_forward_ios),
        minVerticalPadding: 20.h,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
      ),
    );
  }
}
