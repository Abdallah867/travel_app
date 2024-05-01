import 'package:flutter/material.dart';
import 'package:travel_app/core/utils/font_weight_helper.dart';
import 'package:travel_app/core/utils/text_styles.dart';
import 'package:travel_app/core/widgets/vertical_widget.dart';
import 'package:travel_app/features/home/presentation/views/widgets/location_and_price_widget.dart';
import 'package:travel_app/features/home/presentation/views/widgets/trip_card.dart';

class CardInformations extends StatelessWidget {
  const CardInformations({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const VerticalSpace(size: 4),
          Text(
            'Voyage à Skikda',
            style: TextStyles.textStyle16
                .copyWith(fontWeight: FontWeightHelper.semiBold),
          ),
          const VerticalSpace(size: 4),
          const LocationAndPriceWidget(),
        ],
      ),
    );
  }
}
