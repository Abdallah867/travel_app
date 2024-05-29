import 'package:flutter/material.dart';
import 'package:travel_app/core/utils/font_weight_helper.dart';
import 'package:travel_app/core/utils/text_styles.dart';

class AgencyNameWidget extends StatelessWidget {
  const AgencyNameWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Text(
        'Agence: Travel DZ',
        style: TextStyles.textStyle16.copyWith(
          fontWeight: FontWeightHelper.medium,
        ),
        textAlign: TextAlign.start,
      ),
    );
  }
}
