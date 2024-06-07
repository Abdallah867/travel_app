import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/vertical_widget.dart';
import 'widgets/profile_picture_widget.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              const VerticalSpace(size: 36),
              const ProfileInformationsWidget(),
              const VerticalSpace(size: 24),
              const CustomTextFormField(name: 'Username'),
              const VerticalSpace(size: 16),
              const CustomTextFormField(name: 'Email'),
              const VerticalSpace(size: 16),
              const CustomTextFormField(name: 'Phone Number'),
              const VerticalSpace(size: 32),
              CustomButton(
                text: 'Save',
                onPressed: () {
                  print('Save');
                },
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
