import 'package:cuid2/cuid2.dart';

import '../../../../../core/widgets/custom_shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomImageBox extends StatelessWidget {
  const CustomImageBox({
    super.key,
    required this.imageUrl,
    this.tripId,
  });

  final String? tripId;

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
