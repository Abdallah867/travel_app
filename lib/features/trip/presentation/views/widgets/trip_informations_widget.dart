import 'package:flutter/material.dart';
import '../../../../../core/widgets/vertical_widget.dart';
import '../../../../../generated/l10n.dart';
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          DetailsTitleSection(title: S.of(context).description),
          const ExpandableText(),
          const VerticalSpace(size: 16),
          DetailsTitleSection(title: S.of(context).about),
          const AgencyNameWidget(),
          const VerticalSpace(size: 4),
          const ContactAgencyWidget(),
          const VerticalSpace(size: 24),
        ],
      ),
    );
  }
}
