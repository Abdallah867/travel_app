import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import 'vertical_widget.dart';

class CustomTextFormField extends StatefulWidget {
  final String name;
  final bool isPassword;
  final TextEditingController? controller;
  final String? initialValue;
  final VoidCallback? onTapOutside;
  final String? Function(String?)? validator;
  const CustomTextFormField({
    super.key,
    required this.name,
    this.isPassword = false,
    this.controller,
    this.initialValue,
    this.onTapOutside,
    this.validator,
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
        Text(
          widget.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const VerticalSpace(size: 4),
        TextFormField(
          validator: widget.validator ??
              (value) {
                if (value?.isEmpty ?? true) {
                  return "Field required";
                } else {
                  return null;
                }
              },
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus?.unfocus();
            widget.onTapOutside == null ? null : widget.onTapOutside!();
          },
          initialValue: widget.initialValue,
          controller: widget.controller,
          obscureText: widget.isPassword ? isPasswordHidden : false,
          cursorColor: AppColors.secondaryColor,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFFF7F8F9),
            border: customInputBorder(),
            enabledBorder: customInputBorder(),
            focusedBorder: customInputBorder(),
            focusedErrorBorder: customErrorInputBorder(),
            errorBorder: customErrorInputBorder(),
            hintText: widget.name,
            hintStyle: const TextStyle(
              color: Color(0xFFA5A5A5),
            ),
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
        borderRadius: BorderRadius.all(Radius.circular(16)));
  }

  OutlineInputBorder customInputBorder() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(16)),
      borderSide: BorderSide(
        color: Color(0xFFE3E2E9),
        width: 1.0,
      ),
    );
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

// class CustomSearchBar extends StatelessWidget {
//   final void Function(String, BuildContext)? onChanged;
//   const CustomSearchBar({super.key, this.onChanged});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 0),
//       child: SizedBox(
//         height: 55,
//         child: TextField(
//           onChanged: (value) {
//             if (onChanged != null && value.isNotEmpty) {
//               onChanged!(value, context);
//             }
//           },
//           cursorColor: Colors.black,
//           decoration: InputDecoration(
//             prefixIcon: const Icon(Icons.search),
//             filled: true,
//             fillColor: const Color(0xFFF2F3F2),
//             border: customOutlineInputDecoration(),
//             enabledBorder: customOutlineInputDecoration(),
//             focusedBorder: customOutlineInputDecoration(),
//             hintText: 'Search a product',
//             hintStyle: const TextStyle(
//               color: Color(0xFF7C7C7C),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   OutlineInputBorder customOutlineInputDecoration() {
//     return const OutlineInputBorder(
//       borderRadius: BorderRadius.all(Radius.circular(15)),
//       borderSide: BorderSide.none,
//     );
//   }
// }
