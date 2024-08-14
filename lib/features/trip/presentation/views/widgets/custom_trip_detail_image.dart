import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../manager/trip_cubit/trip_cubit.dart';

class CustomTripDetailImage extends StatelessWidget {
  const CustomTripDetailImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TripCubit tripCubit = BlocProvider.of<TripCubit>(context);
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(24.r),
        bottomRight: Radius.circular(24.r),
      ),
      child: ImageSlideshow(
        width: double.infinity,
        height: 500.h,
        initialPage: 0,
        indicatorColor: AppColors.secondaryColor,
        indicatorBackgroundColor: AppColors.whiteColor,
        onPageChanged: (value) {
          print('Page changed: $value');
        },
        autoPlayInterval: 3000,
        isLoop: true,
        children: tripCubit.trip.otherImages.isNotEmpty
            ? tripCubit.trip.otherImages
                .map(
                  (image) => Image.network(
                    image,
                    fit: BoxFit.cover,
                  ),
                )
                .toList()
            : [
                Image.network(
                  tripCubit.trip.coverImage,
                  fit: BoxFit.cover,
                ),
              ],
      ),
    );
  }
}


// 'https://cloud.appwrite.io/v1/storage/buckets/66b9eace002cbd9aadf6/files/66b9ebf500072e785c9a/view?project=662b832999f08a693c77&mode=admin'