import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../core/widgets/vertical_widget.dart';
import '../../manager/cubit/reservation_cubit.dart';
import 'date_select_list_view.dart';

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
                  CustomTextFormField(
                    name: 'gender',
                    controller: reservationCubit.genderController,
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
