import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/functions/show_snack_bar.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../core/widgets/horizontal_space.dart';
import '../../../../../core/widgets/vertical_widget.dart';
import '../../../../home/presentation/views/widgets/title_section.dart';
import '../../manager/cubit/reservation_cubit.dart';
import 'birthday_field.dart';
import 'date_select_list_view.dart';
import 'gender_radio_button_group.dart';
import 'reservation_shimmer_list_view.dart';
import 'travelers_list.dart';

class ReservationForm extends StatelessWidget {
  const ReservationForm({
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
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  const VerticalSpace(size: 8),
                  state is ReservationLoadInProgress
                      ? const ReservationShimmerListView()
                      : const DateSelectListView(),
                  const VerticalSpace(size: 16),
                  TitleSection(
                    onTap: () {
                      context.read<ReservationCubit>().addTraveler();
                    },
                    title: 'Travelers',
                    actionTitle: Row(
                      children: [
                        const Icon(Icons.add,
                            color: AppColors.secondaryColor, size: 16),
                        HorizontalSpace(size: 4.w),
                        Text(
                          'Add Travelers',
                          style: TextStyles.textStyle16
                              .copyWith(color: AppColors.secondaryColor),
                        ),
                      ],
                    ),
                  ),
                  const VerticalSpace(size: 8),
                ],
              ),
            ),
            const TravelersList(),
            SliverList(
              delegate: SliverChildListDelegate([
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    children: [
                      const VerticalSpace(size: 8),
                      CustomTextFormField(
                        name: 'Nom',
                        controller: reservationCubit.lastNameController,
                      ),
                      const VerticalSpace(size: 12),
                      CustomTextFormField(
                        name: 'Prenom',
                        controller: reservationCubit.firstNameController,
                      ),
                      const VerticalSpace(size: 12),
                      Builder(builder: (context) {
                        return BirthdayField(
                            reservationCubit: reservationCubit);
                      }),
                      const VerticalSpace(size: 12),
                      GenderRadioButtonGroup(
                        onChanged: (gender) {
                          reservationCubit.genderController.text = gender!;
                        },
                        reservationCubit: reservationCubit,
                      ),
                      const VerticalSpace(size: 12),
                    ],
                  ),
                ),
              ]),
            )
          ],
        );
      },
    );
  }
}
