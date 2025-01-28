import 'package:flutter/material.dart';

import '../../../../../core/utils/font_weight_helper.dart';
import '../../../../../core/utils/text_styles.dart';

class ContactAgencyWidget extends StatelessWidget {
  final List<String> phoneNumbers;
  const ContactAgencyWidget({
    super.key,
    required this.phoneNumbers,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Text(
        phoneNumbers.join(' / '),
        style: TextStyles.textStyle14.copyWith(
          fontWeight: FontWeightHelper.medium,
        ),
        textAlign: TextAlign.start,
      ),
    );
  }
}
