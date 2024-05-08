import 'package:flutter/material.dart';
import 'package:travel_app/core/utils/font_weight_helper.dart';
import 'package:travel_app/core/utils/text_styles.dart';
import 'package:travel_app/features/trip_details/presentation/views/trip_details_view.dart';

import 'expandable_text.dart';

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Description',
                style: TextStyles.textStyle16
                    .copyWith(fontWeight: FontWeightHelper.bold),
              ),
            ],
          ),
          const ExpandableText(),
        ],
      ),
    );
  }
}
