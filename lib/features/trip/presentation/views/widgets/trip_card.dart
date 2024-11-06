import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/widgets/custom_shimmer.dart';
import '../../../../../core/widgets/horizontal_space.dart';
import '../../../../../core/widgets/vertical_widget.dart';
import '../../../../auth/presentation/manager/current_account_cubit/current_account_cubit.dart';
import '../../../data/models/trip_model.dart';
import 'location_and_price_widget.dart';
import 'review_widget.dart';
import '../../manager/trip_cubit/trip_cubit.dart';

class TripCard extends StatelessWidget {
  const TripCard({super.key});

  @override
  Widget build(BuildContext context) {
    final trip = BlocProvider.of<TripCubit>(context).trip;
    // final currentAccountCubit =
    return GestureDetector(
      onTap: () {
        context.push(
          '${AppRoutes.kTrips}/1',
          extra: {
            'tripCubit': BlocProvider.of<TripCubit>(context),
            'currentAccountCubit': BlocProvider.of<CurrentAccountCubit>(context)
          },
        );
      },
      child: Container(
        decoration: BoxDecoration(
          // border radius
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(17, 17, 26, 0.1),
              blurRadius: 0,
              spreadRadius: 0,
              offset: Offset(
                0,
                1,
              ),
            ),
          ],
          color: AppColors.whiteColor,
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.only(
                start: 16.w,
                top: 12.h,
                bottom: 12.h,
              ),
              child: CustomImageBox(imageUrl: trip.coverImage),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HorizontalSpace(size: double.infinity),
                    Text(trip.title, style: TextStyles.textStyle16SemiBold),
                    const VerticalSpace(size: 4),
                    ReviewWidget(
                      review: trip.rating,
                    ),
                    const VerticalSpace(size: 4),
                    const LocationAndPriceWidget(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomImageBox extends StatelessWidget {
  const CustomImageBox({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.r),
      // topLeft: Radius.circular(16.r),
      // bottomLeft: Radius.circular(16.r)),
      child: CachedNetworkImage(
        width: 90.w,
        height: 90.w,
        fit: BoxFit.cover,
        imageUrl: imageUrl,
        placeholder: (context, url) => const CustomShimmer.box(),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
