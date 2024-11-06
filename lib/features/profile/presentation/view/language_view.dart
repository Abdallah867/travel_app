import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_colors.dart';
import '../manager/settings_cubit/settings_cubit.dart';

class LanguageView extends StatefulWidget {
  const LanguageView({super.key});

  @override
  _LanguageViewState createState() => _LanguageViewState();
}

class _LanguageViewState extends State<LanguageView> {
  void switchLanguage(Language languageCode) {
    setState(() {
      context.read<SettingsCubit>().switchLanguage(languageCode);
      context.read<SettingsCubit>().selectedLanguage = languageCode;
    });
    // Add your language switching logic here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Language Selector'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            LanguageOption(
              language: '🇩🇿 Arabic', // Using the Algerian flag emoji
              isSelected: context.read<SettingsCubit>().selectedLanguage ==
                  Language.arabic,
              onChanged: (value) => switchLanguage(Language.arabic),
            ),
            const Divider(),
            LanguageOption(
              language: '🇫🇷 French',
              isSelected: context.read<SettingsCubit>().selectedLanguage ==
                  Language.french,
              onChanged: (value) => switchLanguage(Language.french),
            ),
            const Divider(),
            LanguageOption(
              language: '🇬🇧 English',
              isSelected: context.read<SettingsCubit>().selectedLanguage ==
                  Language.english,
              onChanged: (value) => switchLanguage(Language.english),
            ),
          ],
        ),
      ),
    );
  }
}

class LanguageOption extends StatelessWidget {
  final String language;
  final bool isSelected;
  final ValueChanged<bool> onChanged;

  const LanguageOption({
    super.key,
    required this.language,
    required this.isSelected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          language,
          style: const TextStyle(fontSize: 20),
        ),
        Switch(
          value: isSelected,
          onChanged: onChanged,
          activeColor: AppColors.secondaryColor,
        ),
      ],
    );
  }
}
