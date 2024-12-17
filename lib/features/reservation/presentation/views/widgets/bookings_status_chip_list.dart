import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class BookingsStatusChipList extends StatefulWidget {
  final List<String> chipLabels;
  final ValueChanged<int> onChipSelected;

  const BookingsStatusChipList({
    super.key,
    required this.chipLabels,
    required this.onChipSelected,
  });

  @override
  State<BookingsStatusChipList> createState() => _BookingsStatusChipListState();
}

class _BookingsStatusChipListState extends State<BookingsStatusChipList> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 40.h,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.chipLabels.length,
        itemBuilder: (context, index) {
          final isSelected = selectedIndex == index;

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                  widget.onChipSelected(index);
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color:
                      isSelected ? AppColors.secondaryColor : Colors.grey[300],
                  borderRadius:
                      BorderRadius.circular(24.r), // Makes it circular
                ),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
                child: Center(
                  child: Text(
                    widget.chipLabels[index],
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: isSelected ? Colors.white : Colors.black,
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
