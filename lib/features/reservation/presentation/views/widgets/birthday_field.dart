import 'package:flutter/material.dart';
import '../../../../../core/utils/date_format_utils.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../manager/cubit/reservation_cubit.dart';

class BirthdayField extends StatelessWidget {
  const BirthdayField({
    super.key,
    required this.reservationCubit,
  });

  final ReservationCubit reservationCubit;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final DateTime? pickedBirthday = await pickBirthday(context);
        reservationCubit.birthdayController.text =
            DateFormatUtils.getFormattedDateByDayAndMonthAndYear(
                pickedBirthday.toString());
      },
      child: CustomTextFormField(
        name: 'Birthday',
        controller: reservationCubit.birthdayController,
        enabled: false,
        prefixIcon: const Icon(
          Icons.calendar_month_outlined,
        ),
      ),
    );
  }

  Future<DateTime?> pickBirthday(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(2000, 1, 1),
      firstDate: DateTime(1924),
      lastDate: DateTime(DateTime.now().year - 1),
    );

    return pickedDate;
  }
}
