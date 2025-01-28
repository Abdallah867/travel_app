import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../core/widgets/vertical_widget.dart';
import '../../manager/cubit/reservation_cubit.dart';
import 'gender_radio_button_group.dart';

class ReservationForm extends StatelessWidget {
  const ReservationForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ReservationCubit reservationCubit = context.read<ReservationCubit>();
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: reservationCubit.travelerKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextFormField(
                name: 'Nom',
                controller: reservationCubit.lastNameController,
                textInputAction: TextInputAction.next,
              ),
              const VerticalSpace(size: 12),
              CustomTextFormField(
                name: 'Prenom',
                controller: reservationCubit.firstNameController,
                textInputAction: TextInputAction.next,
              ),
              const VerticalSpace(size: 12),
              CustomTextFormField(
                name: 'Age',
                controller: reservationCubit.ageController,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
              ),
              const VerticalSpace(size: 12),
              BlocBuilder<ReservationCubit, ReservationState>(
                builder: (context, state) {
                  return GenderRadioButtonGroup(
                    selectedGender: reservationCubit.genderController.text,
                  );
                },
              ),
              const VerticalSpace(size: 24),
            ],
          ),
        ),
      ),
    );
  }
}
