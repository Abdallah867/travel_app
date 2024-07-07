import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/functions/custom_app_bar.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/horizontal_space.dart';
import '../../../../core/widgets/vertical_widget.dart';
import '../../data/models/trip_schedule_model.dart';
import '../manager/cubit/reservation_cubit.dart';

class ReservationView extends StatelessWidget {
  const ReservationView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: customAppBar('Reservation'),
        body: const ReservationForm(),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 120.h,
            child: Column(
              children: [
                CustomButton(
                  text: 'Pay Later',
                  onPressed: () {
                    context.read<ReservationCubit>().addTraveler();
                  },
                ),
                VerticalSpace(size: 12.h),
                const CustomButton(
                  text: 'Process to Payment',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ReservationForm extends StatelessWidget {
  const ReservationForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final reservationCubit = context.read<ReservationCubit>();
    return BlocBuilder<ReservationCubit, ReservationState>(
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  state is ReservationLoadInProgress
                      ? const LinearProgressIndicator()
                      : const DateSelectListView(),
                  const VerticalSpace(size: 16),
                  CustomTextFormField(
                    name: 'Nom',
                    controller: reservationCubit.lastNameController,
                  ),
                  const VerticalSpace(size: 16),
                  CustomTextFormField(
                    name: 'Prenom',
                    controller: reservationCubit.firstNameController,
                  ),
                  const VerticalSpace(size: 16),
                  CustomTextFormField(
                    name: 'Age',
                    controller: reservationCubit.ageController,
                  ),
                  const VerticalSpace(size: 16),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class DateSelectListView extends StatelessWidget {
  const DateSelectListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final tripSchedule = context.read<ReservationCubit>().tripSchedule;
    return SizedBox(
      height: 130.h,
      child: Padding(
        padding: EdgeInsets.only(left: 16.0.w),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) =>
              DateSelectWidget(tripScheduleModel: tripSchedule[index]),
          itemCount: tripSchedule.length,
          separatorBuilder: (BuildContext context, int index) =>
              const HorizontalSpace(size: 15),
        ),
      ),
    );
  }
}

class DateSelectWidget extends StatelessWidget {
  final TripScheduleModel tripScheduleModel;
  const DateSelectWidget({
    super.key,
    required this.tripScheduleModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.only(start: 10),
      height: 130.h,
      width: 100.w,
      decoration: const BoxDecoration(
          color: AppColors.platinumGrey,
          borderRadius: BorderRadius.all(Radius.circular(16))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text("Sat", style: TextStyles.textStyle14SemiBold),
          Text("JUN 25", style: TextStyles.textStyle20SemiBold),
          Text("30 seats", style: TextStyles.textStyle14SemiBold),
        ],
      ),
    );
  }
}
