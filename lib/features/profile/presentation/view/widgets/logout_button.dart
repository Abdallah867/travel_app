import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/widgets/custom_button.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: CustomButton(
          text: 'Logout',
          color: Colors.white,
          borderSide: const BorderSide(
            color: Colors.red,
            width: 2,
          ),
          textColor: Colors.red,
          borderRadius: 16,
          onPressed: () {
            print('Logout');
          },
        ),
      ),
    );
  }
}
