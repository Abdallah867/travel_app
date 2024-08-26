import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/widgets/centered_text.dart';
import '../../../../../core/widgets/vertical_widget.dart';
import '../../../data/models/user_model.dart';
import '../../manager/cubit/edit_profile_cubit.dart';
import 'profile_menu.dart';

class ProfileInformationsWidget extends StatelessWidget {
  final UserModel? user;
  const ProfileInformationsWidget({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    final EditProfileCubit editProfileCubit = context.read<EditProfileCubit>();
    return GestureDetector(
      onTap: () {
        profileImageMethodSelectBottomSheet(context, editProfileCubit);
      },
      child: Column(
        children: [
          CircleAvatar(
            radius: 50.r,
            backgroundColor: AppColors.backgroundColor,
            backgroundImage: user?.profilePicture != null
                ? NetworkImage(user!.profilePicture!)
                : editProfileCubit.profileImage,
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

  Future<void> profileImageMethodSelectBottomSheet(
      BuildContext context, EditProfileCubit editProfileCubit) {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return SizedBox(
              child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ProfileMenu(
                icon: CupertinoIcons.photo_fill,
                name: 'Pick from gallery',
                onTap: () {
                  editProfileCubit.selectProfileImage(ImageSource.gallery);
                  context.pop();
                },
              ),
              Divider(
                indent: 16.w,
                endIndent: 16.w,
                thickness: 1,
                color: Colors.black.withOpacity(.15),
              ),
              ProfileMenu(
                icon: CupertinoIcons.photo_camera_solid,
                name: 'Pick from camera',
                onTap: () {
                  editProfileCubit.selectProfileImage(ImageSource.camera);
                  context.pop();
                },
              ),
            ],
          ));
        });
  }
}
