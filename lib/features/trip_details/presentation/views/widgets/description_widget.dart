import 'package:flutter/material.dart';
import 'package:travel_app/core/utils/text_styles.dart';
import 'package:travel_app/core/widgets/vertical_widget.dart';
import 'package:travel_app/features/home/presentation/views/views/widgets/travel_agency_logo.dart';
import '../../../../../core/utils/font_weight_helper.dart';
import 'details_title_section.dart';
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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const DetailsTitleSection(title: 'Description'),
          const ExpandableText(),
          const VerticalSpace(size: 16),
          const DetailsTitleSection(title: 'About'),
          SizedBox(
            width: double.infinity,
            child: Text(
              'Agence: Travel DZ',
              style: TextStyles.textStyle16.copyWith(
                fontWeight: FontWeightHelper.medium,
              ),
              textAlign: TextAlign.start,
            ),
          ),
          const VerticalSpace(size: 4),
          SizedBox(
            width: double.infinity,
            child: Text(
              'Contact: 05 60 57 72 70 / 05 60 57 72 70',
              style: TextStyles.textStyle16.copyWith(
                fontWeight: FontWeightHelper.medium,
              ),
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }
}
