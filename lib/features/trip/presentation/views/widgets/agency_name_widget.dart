import 'package:flutter/material.dart';
import '../../../../../core/utils/font_weight_helper.dart';
import '../../../../../core/utils/text_styles.dart';

import '../../../../../generated/l10n.dart';

class AgencyNameWidget extends StatelessWidget {
  const AgencyNameWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Text(
        '${S.of(context).agency}: Travel DZ',
        style: TextStyles.textStyle16.copyWith(
          fontWeight: FontWeightHelper.medium,
        ),
        textAlign: TextAlign.start,
      ),
    );
  }
}
