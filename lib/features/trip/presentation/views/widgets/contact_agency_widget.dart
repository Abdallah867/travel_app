import 'package:flutter/material.dart';
import '../../../../../core/utils/font_weight_helper.dart';
import '../../../../../core/utils/text_styles.dart';

class ContactAgencyWidget extends StatelessWidget {
  const ContactAgencyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Text(
        'Contact: 05 60 57 72  / 05 60 57 72 ',
        style: TextStyles.textStyle16.copyWith(
          fontWeight: FontWeightHelper.medium,
        ),
        textAlign: TextAlign.start,
      ),
    );
  }
}
