import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/functions/show_snack_bar.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../core/widgets/horizontal_space.dart';
import '../../../../../core/widgets/vertical_widget.dart';
import '../../../data/models/traveler_model.dart';
import '../../manager/cubit/reservation_cubit.dart';
import 'gender_radio_button_group.dart'; // For date formatting

class TravelerCard extends StatefulWidget {
  final TravelerModel traveler;
  final ReservationCubit reservationCubit;

  const TravelerCard(
      {super.key, required this.traveler, required this.reservationCubit});

  @override
  State<TravelerCard> createState() => _TravelerCardState();
}

class _TravelerCardState extends State<TravelerCard> {
  TextEditingController lastNameController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController genderController = TextEditingController();

  @override
  void dispose() {
    lastNameController.dispose();
    firstNameController.dispose();
    ageController.dispose();
    genderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: GestureDetector(
          onTap: () {
            lastNameController.text = widget.traveler.lastName;
            firstNameController.text = widget.traveler.firstName;
            ageController.text = widget.traveler.age.toString();
            genderController.text = widget.traveler.gender;
            updateTravelerBottomSheet(
              context,
              widget.reservationCubit,
              widget.traveler,
            );
          },
          child: ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
            tileColor: AppColors.whiteColor,
            leading: CircleAvatar(
              child: Text(
                  '${widget.traveler.firstName[0]}${widget.traveler.lastName[0]}'),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.clear),
              onPressed: () {
                context
                    .read<ReservationCubit>()
                    .removeTraveler(widget.traveler.travelerId);
              },
            ),
            title: Row(
              children: [
                Text(
                    '${widget.traveler.firstName} ${widget.traveler.lastName}'),
              ],
            ),
            subtitle: Row(
              children: [
                Text('Age: ${widget.traveler.age}'),
                const SizedBox(width: 10),
                Text('Gender: ${widget.traveler.gender}'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> updateTravelerBottomSheet(
    BuildContext context,
    ReservationCubit reservation,
    TravelerModel traveler,
  ) {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return BlocProvider.value(
            value: reservation,
            child: SizedBox(
              // height: height,
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Update Traveler',
                        style: TextStyles.textStyle20SemiBold,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.h),
                        child: const Divider(),
                      ),
                      CustomTextFormField(
                        name: 'Nom',
                        controller: lastNameController,
                      ),
                      const VerticalSpace(size: 12),
                      CustomTextFormField(
                        name: 'Prenom',
                        controller: firstNameController,
                      ),
                      const VerticalSpace(size: 12),
                      Row(
                        children: [
                          SizedBox(
                            width: 120.w,
                            child: CustomTextFormField(
                              name: 'Age',
                              controller: ageController,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          const HorizontalSpace(size: 40),
                          BlocBuilder<ReservationCubit, ReservationState>(
                            builder: (context, state) {
                              return GenderRadioButtonGroup(
                                selectedGender: genderController.text,
                              );
                            },
                          ),
                        ],
                      ),
                      const VerticalSpace(size: 24),
                      BlocConsumer<ReservationCubit, ReservationState>(
                        listener: (context, state) {
                          if (state is ReservationFailure) {
                            showSnackBar(
                              context,
                              state.errorMessage,
                              AppStrings.error,
                            );
                          }
                        },
                        builder: (context, state) {
                          return state is ReservationLoadInProgress
                              ? const Center(child: CircularProgressIndicator())
                              : CustomButton(
                                  text: 'Update',
                                  onPressed: () async {
                                    await reservation
                                        .updateTraveler(traveler.copyWith(
                                      firstName: firstNameController.text,
                                      lastName: lastNameController.text,
                                      age: int.parse(ageController.text),
                                      gender: genderController.text,
                                    ));
                                    Navigator.pop(context);
                                  },
                                );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
