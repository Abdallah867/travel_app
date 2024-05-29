import 'package:flutter/material.dart';
import 'package:travel_app/core/utils/font_weight_helper.dart';
import 'package:travel_app/core/utils/text_styles.dart';

class DetailsTitleSection extends StatelessWidget {
  final String title;
  const DetailsTitleSection({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyles.textStyle16
              .copyWith(fontWeight: FontWeightHelper.bold),
        ),
      ],
    );
  }
}
