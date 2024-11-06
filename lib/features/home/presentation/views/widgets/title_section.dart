import 'package:flutter/material.dart';

import '../../../../../core/utils/text_styles.dart';

class TitleSection extends StatelessWidget {
  final String title;
  final Widget? actionTitle;
  final VoidCallback onTap;
  const TitleSection({
    super.key,
    required this.title,
    this.actionTitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyles.textStyle20SemiBold),
        GestureDetector(onTap: onTap, child: actionTitle),
      ],
    );
  }
}
