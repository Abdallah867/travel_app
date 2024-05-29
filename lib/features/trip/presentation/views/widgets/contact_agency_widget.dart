import 'package:flutter/material.dart';
import 'package:travel_app/core/utils/font_weight_helper.dart';
import 'package:travel_app/core/utils/text_styles.dart';

class ContactAgencyWidget extends StatelessWidget {
  const ContactAgencyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Text(
        'Contact: 05 60 57 72 70 / 05 60 57 72 70',
        style: TextStyles.textStyle16.copyWith(
          fontWeight: FontWeightHelper.medium,
        ),
        textAlign: TextAlign.start,
      ),
    );
  }
}
