import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../core/widgets/horizontal_space.dart';
import '../../../../../core/widgets/vertical_widget.dart';
import '../../../../home/presentation/views/widgets/title_section.dart';
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
                  TitleSection(
                    onTap: () {},
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
