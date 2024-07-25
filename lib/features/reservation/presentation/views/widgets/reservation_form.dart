import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/functions/show_snack_bar.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../core/widgets/vertical_widget.dart';
import '../../manager/cubit/reservation_cubit.dart';
import 'date_selector_field.dart';
import 'gender_radio_button_group.dart';

class ReservationForm extends StatelessWidget {
  const ReservationForm({
    super.key,
    required this.reservationCubit,
  });

  final ReservationCubit reservationCubit;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: reservationCubit.travelerKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const VerticalSpace(size: 16),
              Text('Add Traveler', style: TextStyles.textStyle20SemiBold),
              const VerticalSpace(size: 16),
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
              DateSelectorField(
                  label: 'Birthday',
                  controller: reservationCubit.birthdayController),
              const VerticalSpace(size: 12),
              GenderRadioButtonGroup(
                onChanged: (gender) {
                  reservationCubit.genderController.text = gender!;
                },
                reservationCubit: reservationCubit,
              ),
              const VerticalSpace(size: 24),
              CustomButton(
                  text: 'Add Traveler',
                  onPressed: () {
                    if (reservationCubit.travelerKey.currentState!.validate() &&
                        reservationCubit.genderController.text.isNotEmpty) {
                      reservationCubit.addTraveler();
                      context.pop();
                    } else {
                      showSnackBar(
                          context, 'please, select gender', AppStrings.error);
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
