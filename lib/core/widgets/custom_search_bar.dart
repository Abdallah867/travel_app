import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSearchBar extends StatelessWidget {
  final void Function(String, BuildContext)? onChanged;
  const CustomSearchBar({super.key, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55.w,
      child: TextField(
        onChanged: (value) {
          if (onChanged != null && value.isNotEmpty) {
            onChanged!(value, context);
          }
        },
        cursorColor: Colors.black,
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          filled: true,
          fillColor: const Color(0xFFF2F3F2),
          border: customOutlineInputDecoration(),
          enabledBorder: customOutlineInputDecoration(),
          focusedBorder: customOutlineInputDecoration(),
          hintText: 'Search...',
          hintStyle: const TextStyle(
            color: Color(0xFF7C7C7C),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder customOutlineInputDecoration() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(15)),
      borderSide: BorderSide.none,
    );
  }
}
