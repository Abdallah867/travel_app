import 'package:flutter/material.dart';
import '../../../../../core/utils/date_format_utils.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';

class DateSelectorField extends StatelessWidget {
  final String label;
  const DateSelectorField({
    super.key,
    required this.controller,
    required this.label,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final DateTime? pickedDate = await pickDate(context);
        controller.text = DateFormatUtils.getFormattedDateByDayAndMonthAndYear(
            pickedDate.toString());
      },
      child: CustomTextFormField(
        name: label,
        controller: controller,
        enabled: false,
        prefixIcon: const Icon(
          Icons.calendar_month_outlined,
        ),
      ),
    );
  }

  Future<DateTime?> pickDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(2000, 1, 1),
      firstDate: DateTime(1924),
      lastDate: DateTime(DateTime.now().year - 1),
    );

    return pickedDate;
  }
}
