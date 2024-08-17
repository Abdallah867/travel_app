import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/widgets/centered_text.dart';
import '../../../data/models/user_model.dart';
import '../../manager/cubit/edit_profile_cubit.dart';

class EditProfileInformationsWidget extends StatelessWidget {
  final UserModel? user;
  const EditProfileInformationsWidget({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    final EditProfileCubit editProfileCubit = context.read<EditProfileCubit>();

    return GestureDetector(
      onTap: () {
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
                    editProfileCubit.selectProfileImage(ImageSource.gallery);
                  },
                ),
                ListTile(
                  title: CenteredText(
                    text: 'Pick from camera',
                    style: TextStyles.textStyle20
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    editProfileCubit.selectProfileImage(ImageSource.camera);
                  },
                ),
              ]),
            );
          },
        );
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: editProfileCubit.profileImage != null
                    ? FileImage(editProfileCubit.profileImage!) as ImageProvider
                    : const AssetImage("assets/images/anonymous_profile.png"),
                fit: BoxFit.cover, // Adjust the fit as needed
              ),
            ),
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
