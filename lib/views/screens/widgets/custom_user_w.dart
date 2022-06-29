import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_search/utils/sized_box.dart';
import 'package:task_search/views/custom_widgets/custom_text.dart';

class CustomUserW extends StatelessWidget {
  String? images;
  String? name;
  String? gender;
  CustomUserW({
    Key? key,
    this.images,
    this.name,
    this.gender,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 396.w,
      height: 68.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(images!),
            ),
            const Sbox(w: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  text: name!,
                  fontSize: 17,
                  fontW: FontWeight.w800,
                ),
                const Sbox(h: 6),
                CustomText(
                  text: gender,
                  fontSize: 17,
                  fontW: FontWeight.w400,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
