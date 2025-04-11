import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/widgets/vertical_widget.dart';
import '../../../../../generated/l10n.dart';
import '../../manager/trip_cubit/trip_cubit.dart';
import 'agency_email_widget.dart';
import 'agency_name_widget.dart';
import 'contact_agency_widget.dart';
import 'details_title_section.dart';
import 'expandable_text.dart';
import 'location_widget.dart';
import 'review_widget.dart';

class TripInformationsWidget extends StatelessWidget {
  const TripInformationsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final trip = BlocProvider.of<TripCubit>(context).trip;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const VerticalSpace(size: 16),
          Text(trip.title, style: TextStyles.textStyle22),
          const VerticalSpace(size: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              LocationWidget(
                location: trip.location,
              ),
              const ReviewWidget()
            ],
          ),
          const VerticalSpace(size: 4),
          // RatingBar(rating: trip.rating),
          const VerticalSpace(size: 8),
          DetailsTitleSection(title: S.of(context).description),
          const ExpandableText(),
          const VerticalSpace(size: 16),
          DetailsTitleSection(title: S.of(context).about),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('${S.of(context).agencyName}: '),
              const AgencyNameWidget(),
            ],
          ),
          const VerticalSpace(size: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text('Contact: '),
              ContactAgencyWidget(
                phoneNumbers:
                    context.read<TripCubit>().trip.agency!.phoneNumbers,
              ),
            ],
          ),
          const VerticalSpace(size: 4),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Email: '),
              AgencyEmailWidget(),
            ],
          ),
          const VerticalSpace(size: 24),
        ],
      ),
    );
  }
}

class RatingBar extends StatelessWidget {
  final double rating;
  const RatingBar({
    super.key,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      unratedColor: const Color(0xFFD3D3D3),
      rating: rating,
      itemBuilder: (context, index) => const Icon(
        CupertinoIcons.star_fill,
        color: AppColors.yellowColor,
      ),
      itemCount: 5,
      itemSize: 24.0,
    );
  }
}
