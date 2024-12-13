import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/font_weight_helper.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/widgets/horizontal_space.dart';
import '../../../../../core/widgets/vertical_widget.dart';
import '../../../../../generated/l10n.dart';
import '../../../../auth/presentation/manager/current_account_cubit/current_account_cubit.dart';
import '../../../data/models/menu_item.dart';
import '../../manager/profile_cubit/edit_profile_cubit.dart';
import 'profile_menu.dart';

class ProfileMenusListView extends StatelessWidget {
  const ProfileMenusListView({super.key});

  @override
  Widget build(BuildContext context) {
    List<MenuItem> menus = getMenuList(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const HorizontalSpace(size: 16),
            Text(S.of(context).settings,
                style: TextStyles.textStyle14.copyWith(
                    fontWeight: FontWeightHelper.semiBold,
                    color: Colors.black.withOpacity(.65))),
          ],
        ),
        const VerticalSpace(size: 4),
        Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Column(
              children: menus
                  .map(
                    (menu) => Column(
                      children: [
                        menu != menus.first
                            ? Divider(
                                indent: 16.w,
                                endIndent: 16.w,
                                height: 1.h,
                                thickness: 1.h,
                                color: AppColors.lighterGrey,
                              )
                            : const SizedBox(),
                        ProfileMenu(
                          name: menu.name,
                          icon: menu.icon,
                          onTap: menu.onTap,
                        ),
                      ],
                    ),
                  )
                  .toList(),
            )),
      ],
    );
  }
}

List<MenuItem> getMenuList(BuildContext context) {
  return [
    MenuItem(
      name: S.of(context).profile,
      icon: CupertinoIcons.person,
      onTap: () {
        context.push(
          AppRoutes.kEditProfileView,
          extra: BlocProvider.of<EditProfileCubit>(context),
        );
      },
    ),
    MenuItem(
      name: S.of(context).bookings,
      icon: CupertinoIcons.calendar,
      onTap: () {
        context.push(AppRoutes.kBookingsView,
            extra: context.read<CurrentAccountCubit>());
      },
    ),
    MenuItem(
      name: S.of(context).language,
      icon: Icons.language,
      onTap: () {
        context.push(AppRoutes.kLanguageView);
      },
    ),
    MenuItem(
      name: S.of(context).notifications,
      icon: CupertinoIcons.bell,
      onTap: () {},
    ),
  ];
}
