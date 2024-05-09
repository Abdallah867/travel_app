import 'package:flutter/material.dart';
import 'package:travel_app/features/trip_details/presentation/views/trip_details_view.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/font_weight_helper.dart';
import '../../../../../core/utils/text_styles.dart';

class ExpandableText extends StatefulWidget {
  const ExpandableText({
    super.key,
  });

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Text(
          'Lorem ipsum jkjkjljjjllkjfffffffffffffffffffffffffffffffffffffffffffffffljljlkjljjkljlkjlkljmmmmmhdjshdjshdjshdjhsjdhsjdhsjdhjsdhmmmmmmdjshjdshjdhsjdhsjds',
          style: TextStyles.textStyle16.copyWith(
              fontWeight: FontWeightHelper.regular,
              color: Colors.black.withOpacity(.55)),
          maxLines: !isExpanded ? 3 : null,
        ),
        GestureDetector(
          onTap: () => setState(() {
            isExpanded = !isExpanded;
          }),
          child: Text(
            !isExpanded ? 'Show More' : 'Show Less',
            style: TextStyles.textStyle16.copyWith(
              fontWeight: FontWeightHelper.regular,
              color: AppColors.secondaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
