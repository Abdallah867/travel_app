import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_shimmer.dart';
import '../../manager/trip_cubit/trip_cubit.dart';

class CustomTripDetailImage extends StatelessWidget {
  const CustomTripDetailImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TripCubit tripCubit = BlocProvider.of<TripCubit>(context);
    return Hero(
      tag: tripCubit.trip.tripId,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24.r),
          bottomRight: Radius.circular(24.r),
        ),
        child: ImageSlideshow(
          width: double.infinity,
          height: 450.h,
          initialPage: 0,
          indicatorColor: AppColors.secondaryColor,
          indicatorBackgroundColor: AppColors.whiteColor,
          children: tripCubit.trip.otherImages.isNotEmpty
              ? tripCubit.trip.otherImages
                  .map(
                    (image) => CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: image,
                      placeholder: (context, url) => const CustomShimmer.box(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  )
                  .toList()
              : [
                  CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: tripCubit.trip.coverImage,
                    placeholder: (context, url) => const CustomShimmer.box(),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ],
        ),
      ),
    );
  }
}
