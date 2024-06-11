import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CircularLoadingWidget extends StatelessWidget {
  const CircularLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColors.secondaryColor,
      ),
    );
  }
}
