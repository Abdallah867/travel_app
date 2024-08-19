import 'package:flutter/material.dart';

import '../../../../core/functions/custom_app_bar.dart';
import '../../../../generated/l10n.dart';
import 'widgets/edit_profile_bloc_consumer.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(S.of(context).editProfile),
      body: const EditProfileBlocConsumer(),
    );
  }
}
