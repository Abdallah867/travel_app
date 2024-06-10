import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/functions/show_snack_bar.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../core/utils/app_strings.dart';
import '../../data/repos/user_profile_repo_impl.dart';

import '../../../../core/functions/custom_app_bar.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/vertical_widget.dart';
import '../../../auth/presentation/manager/current_account_cubit/current_account_cubit.dart';
import '../../data/models/user_model.dart';
import '../manager/cubit/edit_profile_cubit.dart';
import 'widgets/profile_informations_widget.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final UserModel user =
        BlocProvider.of<CurrentAccountCubit>(context).userInformations!;
    return Scaffold(
      appBar: customAppBar('Edit Profile'),
      body: BlocProvider(
        create: (context) => EditProfileCubit(
          userProfileRepo: getIt.get<UserProfileRepoImpl>(),
          user: user,
        )..setInitialValue(),
        child: EditProfileBlocConsumer(user: user),
      ),
    );
  }
}

class EditProfileBlocConsumer extends StatelessWidget {
  const EditProfileBlocConsumer({
    super.key,
    required this.user,
  });

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    final EditProfileCubit editProfileCubit =
        BlocProvider.of<EditProfileCubit>(context);
    return BlocConsumer<EditProfileCubit, EditProfileState>(
      listener: (context, state) {
        if (state is EditProfileSuccess) {
          BlocProvider.of<CurrentAccountCubit>(context)
              .updateUserInformations(editProfileCubit.user);
          editProfileCubit.setInitialValue();
          showSnackBar(
              context, 'Profile updated successfully', AppStrings.success);
          context.pop();
        }
        if (state is EditProfileFailure) {
          showSnackBar(context, state.errMessage, AppStrings.error);
        }
      },
      builder: (context, state) {
        return Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                const VerticalSpace(size: 36),
                ProfileInformationsWidget(
                  user: editProfileCubit.user,
                ),
                const VerticalSpace(size: 24),
                CustomTextFormField(
                  name: 'Username',
                  controller: editProfileCubit.usernameController,
                ),
                const VerticalSpace(size: 16),
                CustomTextFormField(
                  name: 'Email',
                  controller: editProfileCubit.emailController,
                ),
                const VerticalSpace(size: 16),
                CustomTextFormField(
                  name: 'Phone Number',
                  controller: editProfileCubit.phoneNumberController,
                ),
                const VerticalSpace(size: 16),
                CustomTextFormField(
                  name: 'Password',
                  isPassword: true,
                  controller: editProfileCubit.passwordController,
                ),
                const VerticalSpace(size: 32),
                state is! EditProfileLoadInProgress
                    ? CustomButton(
                        text: 'Save',
                        onPressed: () async {
                          await editProfileCubit.updateUserData();
                        },
                        width: double.infinity,
                      )
                    : const CircularProgressIndicator(),
              ],
            ),
          ),
        );
      },
    );
  }
}
