import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/text_styles.dart';
import 'vertical_widget.dart';

class CustomTextFormField extends StatefulWidget {
  final String? name;
  final bool isPassword;
  final TextEditingController? controller;
  final String? initialValue;
  final VoidCallback? onTapOutside;
  final String? Function(String?)? validator;
  final OutlineInputBorder? outlineInputBorder;
  final bool enabled;
  final Icon? prefixIcon;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  const CustomTextFormField({
    super.key,
    this.name,
    this.isPassword = false,
    this.controller,
    this.initialValue,
    this.onTapOutside,
    this.validator,
    this.outlineInputBorder,
    this.enabled = true,
    this.prefixIcon,
    this.keyboardType,
    this.textInputAction,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.name != null
            ? Text(
                widget.name!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              )
            : const SizedBox(),
        const VerticalSpace(size: 4),
        TextFormField(
          validator: widget.validator ??
              (value) {
                if (value?.isEmpty ?? true) {
                  return "${widget.name} required";
                } else {
                  return null;
                }
              },
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus?.unfocus();
            widget.onTapOutside == null ? null : widget.onTapOutside!();
          },
          keyboardType: widget.keyboardType,
          initialValue: widget.initialValue,
          textInputAction: widget.textInputAction,
          controller: widget.controller,
          enabled: widget.enabled,
          obscureText: widget.isPassword ? isPasswordHidden : false,
          cursorColor: AppColors.secondaryColor,
          decoration: InputDecoration(
            labelStyle: TextStyles.textStyle14,
            filled: true,
            fillColor: AppColors.inputGrey,
            border: widget.outlineInputBorder ?? customInputBorder(),
            enabledBorder: customInputBorder(),
            focusedBorder: customInputBorder(),
            focusedErrorBorder: customErrorInputBorder(),
            errorBorder: customErrorInputBorder(),
            hintText: widget.name,
            hintStyle: const TextStyle(
              color: AppColors.platinumGrey,
            ),
            prefixIcon: widget.prefixIcon,
            suffixIcon:
                widget.isPassword ? visibiltyIcon(isPasswordHidden) : null,
          ),
        ),
      ],
    );
  }

  // const Color(0xFFE3E2E9)

  OutlineInputBorder customErrorInputBorder() {
    return const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 2),
        borderRadius: BorderRadius.all(Radius.circular(12)));
  }

  OutlineInputBorder customInputBorder() {
    return const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        borderSide: BorderSide.none);
  }

  IconButton visibiltyIcon(bool visibilty) {
    return IconButton(
      onPressed: () {
        setState(() {
          isPasswordHidden = !isPasswordHidden;
        });
      },
      icon: visibilty
          ? const Icon(Icons.visibility_outlined)
          : const Icon(Icons.visibility_off_outlined),
      color: const Color(0xFFA5A5A5),
    );
  }
}
