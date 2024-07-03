import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/functions/custom_app_bar.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/vertical_widget.dart';

class ReservationView extends StatelessWidget {
  const ReservationView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: customAppBar('Reservation'),
        body: const Column(
          children: [
            DateSelectListView(),
            VerticalSpace(size: 16),
            CustomTextFormField(name: 'Nom'),
            VerticalSpace(size: 16),
            CustomTextFormField(name: 'Prenom'),
            VerticalSpace(size: 16),
            CustomTextFormField(name: 'Age'),
            VerticalSpace(size: 16),
            ListTile()
          ],
        ),
        bottomNavigationBar: const SizedBox(
          height: 100,
          child: Column(
            children: [
              CustomButton(text: 'Pay Later'),
              CustomButton(text: 'Process to Payment')
            ],
          ),
        ),
      ),
    );
  }
}

class DateSelectListView extends StatelessWidget {
  const DateSelectListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        DateSelectWidget(),
        DateSelectWidget(),
        DateSelectWidget(),
        DateSelectWidget(),
        DateSelectWidget(),
      ],
    );
  }
}

class DateSelectWidget extends StatelessWidget {
  const DateSelectWidget({
    super.key,
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
