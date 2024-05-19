import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import 'vertical_widget.dart';

class CustomTextFormField extends StatefulWidget {
  final String name;
  final bool isPassword;
  final TextEditingController? controller;
  const CustomTextFormField({
    super.key,
    required this.name,
    this.isPassword = false,
    this.controller,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const VerticalSpace(size: 9),
        TextFormField(
          validator: (value) {
            if (value?.isEmpty ?? true) {
              return "Field required";
            } else {
              return null;
            }
          },
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          controller: widget.controller,
          obscureText: widget.isPassword ? isPasswordVisible : false,
          decoration: InputDecoration(
            suffixIcon:
                widget.isPassword ? visibiltyIcon(isPasswordVisible) : null,
            filled: true,
            fillColor: AppColors.lightGreyColor,
            border: const OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(
                color: AppColors.greyColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(
                width: 2,
                color: AppColors.greyColor,
              ),
            ),
            hintText: widget.name,
            hintStyle: const TextStyle(
              color: AppColors.greyColor,
            ),
          ),
        ),
      ],
    );
  }

  IconButton visibiltyIcon(bool visibilty) {
    return IconButton(
      onPressed: () {
        setState(() {
          isPasswordVisible = !isPasswordVisible;
        });
      },
      icon: visibilty
          ? const Icon(Icons.visibility_outlined)
          : const Icon(Icons.visibility_off_outlined),
      color: AppColors.greyColor,
    );
  }
}
