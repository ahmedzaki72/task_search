import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_search/config/theme_colors.dart';
import 'package:task_search/views/custom_widgets/custom_text.dart';

class DropDownButtonW extends StatefulWidget {
  double width;
  double height;
  Color? colorBorder;
  String? typeValue;
  bool? isExpanded;
  Function(dynamic)? onChange;
  List<String>? listType;
  DropDownButtonW({
    Key? key,
    this.width = 0,
    this.height = 0,
    this.colorBorder = TColor.black,
    this.typeValue,
    this.isExpanded = true,
    this.listType,
    this.onChange,
  }) : super(key: key);

  @override
  State<DropDownButtonW> createState() => _DropDownButtonWState();
}

class _DropDownButtonWState extends State<DropDownButtonW> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width.w,
      height: widget.height.w,
      decoration: BoxDecoration(
        color: TColor.white,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          color: widget.colorBorder!,
          width: 1.w,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 10.w),
        child: ButtonTheme(
          child: DropdownButton<String>(
            isExpanded: widget.isExpanded!,
            dropdownColor: TColor.white,
            icon: const Icon(
              Icons.keyboard_arrow_down_outlined,
              color: TColor.black,
            ),
            value: widget.typeValue,
            underline: Container(),
            items: widget.listType!.map(buildMenuItem).toList(),
            onChanged: widget.onChange,
          ),
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: CustomText(
              text: item,
              color: TColor.black,
              fontW: FontWeight.w300,
              fontSize: 18.sp,
            ),
          ),
        ),
      );
}
