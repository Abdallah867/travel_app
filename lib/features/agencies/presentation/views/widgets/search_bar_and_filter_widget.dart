import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/widgets/horizontal_space.dart';
import '../../../../../core/widgets/custom_search_bar.dart';

class SearchBarAndFilterWidget extends StatelessWidget {
  const SearchBarAndFilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: CustomSearchBar()),
        const HorizontalSpace(size: 8),
        Container(
          width: 55.w,
          height: 55.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: AppColors.whiteColor,
          ),
          child: const Icon(
            Icons.filter_list,
            size: 32.0,
          ),
        )
      ],
    );
  }
}
