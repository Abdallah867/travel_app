import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/font_weight_helper.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../manager/trip_details_cubit/trip_cubit.dart';

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
    final tripCubit = BlocProvider.of<TripCubit>(context);

    return Wrap(
      children: [
        Text(
          tripCubit.trip.description,
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
