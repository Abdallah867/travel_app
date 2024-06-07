import 'package:flutter/material.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/vertical_widget.dart';
import 'agency_name_widget.dart';
import 'contact_agency_widget.dart';
import 'details_title_section.dart';
import 'expandable_text.dart';

class TripInformationsWidget extends StatelessWidget {
  const TripInformationsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          DetailsTitleSection(title: AppStrings.description),
          ExpandableText(),
          VerticalSpace(size: 16),
          DetailsTitleSection(title: AppStrings.about),
          AgencyNameWidget(),
          VerticalSpace(size: 4),
          ContactAgencyWidget(),
          VerticalSpace(size: 24),
        ],
      ),
    );
  }
}
