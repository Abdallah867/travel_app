import 'package:flutter/material.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/widgets/custom_sliver_list.dart';
import '../../../../../core/widgets/vertical_widget.dart';
import 'suggested_teams_title_section.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            title: Text(
              'Sticky Headers',
              style: TextStyles.textStyle20.copyWith(
                color: Colors.white,
              ),
            ),
          ),
          const CustomSliverList(
            children: [
              SuggestedTeamsTitleSection(),
              VerticalSpace(size: 20),
              // SpacedTeamsListView(
              //   horizontal: 15,
              //   vertical: 0,
              // ),
            ],
          )
        ],
      ),
    );
  }
}
