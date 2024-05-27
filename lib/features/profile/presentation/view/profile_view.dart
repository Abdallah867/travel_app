import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_app/core/utils/app_colors.dart';
import 'package:travel_app/core/widgets/vertical_widget.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../core/widgets/horizontal_space.dart';
import '../../../auth/presentation/manager/current_account_cubit/current_account_cubit.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentAccountCubit, CurrentAccountState>(
      builder: (context, state) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    const HorizontalSpace(size: double.infinity),
                    const VerticalSpace(size: 24),
                    const ProfilePictureWidget(),
                    const VerticalSpace(size: 8),
                    const VerticalSpace(size: 2),
                    const CenteredText(text: 'Abdallah23'),
                    const CenteredText(text: 'abdoallahusma5704@gmail.com'),
                    const VerticalSpace(size: 24),
                  ],
                ),
              ),
              const ProfileMenusListView(),
            ],
          ),
        );
      },
    );
  }
}

class CenteredText extends StatelessWidget {
  final String text;
  const CenteredText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: TextStyles.textStyle20,
        ),
      ],
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
      padding: EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 12.h),
      child: ListTile(
        tileColor: AppColors.greyBlueColor,
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

class ProfileMenusListView extends StatelessWidget {
  static const menus = AppConstants.menuItems;

  const ProfileMenusListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: menus.length,
      itemBuilder: (context, index) {
        return ProfileMenu(
          name: menus[index].name,
          icon: menus[index].icon,
        );
      },
    );
  }
}
