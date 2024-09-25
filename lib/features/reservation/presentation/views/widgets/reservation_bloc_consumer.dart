import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/functions/show_snack_bar.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/widgets/horizontal_space.dart';
import '../../../../../core/widgets/vertical_widget.dart';
import '../../../../home/presentation/views/widgets/title_section.dart';
import '../../manager/cubit/reservation_cubit.dart';
import 'date_select_list_view.dart';
import 'reservation_form.dart';
import 'reservation_shimmer_list_view.dart';
import 'travelers_list.dart';
import 'trip_info_widget.dart';

class ReservationBlocConsumer extends StatelessWidget {
  const ReservationBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final reservationCubit = context.read<ReservationCubit>();
    return BlocConsumer<ReservationCubit, ReservationState>(
      listener: (context, state) {
        if (state is ReservationFailure) {
          showSnackBar(context, state.errorMessage, AppStrings.error);
        }
        if (state is ReservationSuccess) {
          showSnackBar(context, 'Reservation Successful', AppStrings.success);
        }
      },
      builder: (context, state) {
        return CustomScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          physics: const ClampingScrollPhysics(),
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  const VerticalSpace(size: 8),
                  state is ReservationLoadInProgress
                      ? const ReservationShimmerListView()
                      : const DateSelectListView(),
                  const VerticalSpace(size: 16),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.only(start: 16.0),
                        child: Text('Schedule Details',
                            style: TextStyles.textStyle20SemiBold),
                      ),
                    ],
                  ),
                  const VerticalSpace(size: 8),
                  reservationCubit.selectedScheduleId == null
                      ? const SizedBox()
                      : TripInfoWidget(
                          tripSchedule:
                              reservationCubit.tripSchedules.firstWhere(
                            (element) =>
                                element.tripScheduleId ==
                                (reservationCubit.selectedScheduleId ?? ''),
                          ),
                        ),
                  const VerticalSpace(size: 8),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: TitleSection(
                      onTap: () {
                        reservationCubit.addTraveler();
                      },
                      title: 'Travelers',
                      actionTitle: Row(
                        children: [
                          const Icon(Icons.add,
                              color: AppColors.secondaryColor, size: 16),
                          HorizontalSpace(size: 4.w),
                          Text(
                            'Add Traveler',
                            style: TextStyles.textStyle16
                                .copyWith(color: AppColors.secondaryColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const VerticalSpace(size: 8),
                ],
              ),
            ),
            const TravelersList(),
            const SliverToBoxAdapter(
              child: ReservationForm(),
            )

            // ReservationForm(reservationCubit: reservationCubit)
          ],
        );
      },
    );
  }
}
