import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/font_weight_helper.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/widgets/vertical_widget.dart';
import '../../../../../generated/l10n.dart';
import '../../../../auth/presentation/manager/current_account_cubit/current_account_cubit.dart';
import '../../../../trip/presentation/views/widgets/custom_circular_icon.dart';
import '../../../../trip/presentation/views/widgets/trips_list_bloc_builder.dart';
import '../../../../trips/presentation/manager/bloc/trips_list_bloc.dart';
import 'title_section.dart';
import 'travel_agencies_list_view.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    final String username =
        context.read<CurrentAccountCubit>().userInformations!.username;
    return CustomScrollView(
      physics: const ClampingScrollPhysics(),
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 36.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          S.of(context).hello(username),
                          style: TextStyles.textStyle20SemiBold
                              .copyWith(fontWeight: FontWeightHelper.bold),
                        ),
                        Text(
                          'Do you want to go on a trip?',
                          style: TextStyles.textStyle16.copyWith(
                              color: Colors.black.withOpacity(.45),
                              fontWeight: FontWeightHelper.semiBold),
                        ),
                      ],
                    ),
                    CustomCircularIcon(
                      icon: CupertinoIcons.bell,
                      bgColor: AppColors.whiteColor,
                      iconColor: Colors.black,
                      onPressed: () {},
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: TitleSection(
                  title: S.of(context).agencies,
                  actionTitle: Text(
                    S.of(context).seeAll,
                    style: TextStyles.textStyle14
                        .copyWith(color: AppColors.secondaryColor),
                  ),
                  onTap: () {},
                ),
              ),
              const VerticalSpace(size: 16),
              const TravelAgenciesListView(),
              const VerticalSpace(size: 24),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: TitleSection(
                  title: S.of(context).availableTrips,
                  actionTitle: Text(
                    S.of(context).seeAll,
                    style: TextStyles.textStyle14
                        .copyWith(color: AppColors.secondaryColor),
                  ),
                  onTap: () {
                    context.push('/all-trips',
                        extra: context.read<TripsListBloc>);
                  },
                ),
              ),
              const VerticalSpace(size: 16),
            ],
          ),
        ),
        const TripsListBlocBuilder(),
      ],
    );
  }
}
