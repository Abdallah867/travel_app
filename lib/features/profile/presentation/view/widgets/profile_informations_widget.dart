import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/widgets/centered_text.dart';
import '../../../../../core/widgets/vertical_widget.dart';
import '../../../data/models/user_model.dart';
import '../../manager/cubit/edit_profile_cubit.dart';

class ProfileInformationsWidget extends StatelessWidget {
  final UserModel? user;
  final EditProfileCubit? editProfileCubit;
  const ProfileInformationsWidget({
    super.key,
    required this.user,
    this.editProfileCubit,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (editProfileCubit != null) {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (BuildContext context) {
              return SizedBox(
                height: 110.h,
                child: Column(children: [
                  ListTile(
                    title: CenteredText(
                      text: 'Pick from gallery',
                      style: TextStyles.textStyle20
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      editProfileCubit!.selectProfileImage(ImageSource.gallery);
                    },
                  ),
                  ListTile(
                    title: CenteredText(
                      text: 'Pick from camera',
                      style: TextStyles.textStyle20
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      editProfileCubit!.selectProfileImage(ImageSource.camera);
                    },
                  ),
                ]),
              );
            },
          );
        }
      },
      child: Column(
        children: [
          CircleAvatar(
            radius: 50.r,
            backgroundColor: AppColors.secondaryColor,
            backgroundImage:
                const AssetImage("assets/images/anonymous_profile.png"),
          ),
          const VerticalSpace(size: 8),
          CenteredText(
            text: user!.username,
            style: TextStyles.textStyle20.copyWith(fontWeight: FontWeight.bold),
          ),
          CenteredText(
            text: user!.email,
            style: TextStyles.textStyle14,
          ),
        ],
      ),
    );
  }
}
