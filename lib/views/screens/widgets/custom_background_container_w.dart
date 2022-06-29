import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBackgroundContainerW extends StatelessWidget {
  Widget? widget;
  CustomBackgroundContainerW({
    Key? key,
    this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 396.w,
      height: 104.w,
      decoration: BoxDecoration(
        color: const Color(0xffF7F7F7),
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: widget,
    );
  }
}
