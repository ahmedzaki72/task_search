import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_search/bloc/search_cubit/search_cubit.dart';
import 'package:task_search/config/theme_colors.dart';
import 'package:task_search/utils/sized_box.dart';
import 'package:task_search/views/custom_widgets/custom_button.dart';
import 'package:task_search/views/custom_widgets/custom_text.dart';
import 'package:task_search/views/screens/search_screen/search_screen.dart';
import 'package:task_search/views/screens/widgets/custom_background_container_w.dart';
import 'package:task_search/views/screens/widgets/custom_dropdown_w.dart';
import 'package:task_search/views/screens/widgets/custom_form_field_border.dart';
import 'package:task_search/views/screens/widgets/custom_snack_bar.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> listType = [
    "First Name",
    "Last Name",
    "Full Name",
    "Gender",
    "Age",
  ];

  List<String> listEqual = [
    "=",
    "!=",
    "<",
    ">",
  ];

  List<String> listEqualS = [
    "SWith",
    "EWith",
    "Contain",
    "Exact",
  ];

  List<String> listAnOr = [
    "And",
    "Or",
  ];

  String? typeValue = "First Name";
  String? typeEqual = "=";
  String? typeEqualS = "SWith";
  String? typeEqual2 = "=";
  String? typeEqualS2 = "SWith";
  String? firstSearch;
  String? secondSearch;
  String? typeAnOr = "And";
  String? typeValue2 = "Gender";
  bool option = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Sbox(h: 60),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const CustomText(
                      text: "Query Builder",
                      color: Color(0xff262626),
                      fontSize: 32,
                      fontW: FontWeight.w800,
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          option = true;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: TColor.greenSuccess),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.add,
                          color: TColor.greenSuccess,
                        ),
                      ),
                    )
                  ],
                ),
                const Sbox(h: 30),
                CustomBackgroundContainerW(
                  widget: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Sbox(
                        h: 12,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.w),
                        child: Row(
                          children: [
                            DropDownButtonW(
                              width: 290,
                              height: 36,
                              listType: listType,
                              typeValue: typeValue,
                              colorBorder: TColor.white,
                              onChange: (value) {
                                setState(() {
                                  typeValue = value;
                                });
                              },
                            ),
                            const Sbox(
                              w: 10,
                            ),
                            typeValue == "Age"
                                ? DropDownButtonW(
                                    width: 65,
                                    height: 36,
                                    listType: listEqual,
                                    typeValue: typeEqual,
                                    onChange: (value) {
                                      setState(() {
                                        typeEqual = value;
                                      });
                                    },
                                    colorBorder: TColor.white,
                                  )
                                : DropDownButtonW(
                                    width: 65,
                                    height: 36,
                                    listType: listEqualS,
                                    typeValue: typeEqualS,
                                    onChange: (value) {
                                      setState(() {
                                        typeEqualS = value;
                                      });
                                    },
                                    colorBorder: TColor.white,
                                  ),
                          ],
                        ),
                      ),
                      const Sbox(
                        h: 10,
                      ),
                      CustomFormFieldWithBorder(
                        formFieldWidth: 390,
                        paddingRight: 13,
                        paddingLeft: 10,
                        height: 36,
                        hintText: "Please Enter Type Search",
                        onChanged: (value) {
                          setState(() {
                            firstSearch = value;
                          });
                        },
                        fillColor: TColor.white,
                      )
                    ],
                  ),
                ),
                const Sbox(h: 20),
                DropDownButtonW(
                  width: 75,
                  height: 36,
                  listType: listAnOr,
                  typeValue: typeAnOr,
                  colorBorder: TColor.black,
                ),
                const Sbox(h: 20),
                option
                    ? CustomBackgroundContainerW(
                        widget: Padding(
                          padding: EdgeInsets.only(right: 5.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Sbox(
                                    h: 12,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10.w),
                                    child: Row(
                                      children: [
                                        DropDownButtonW(
                                          width: 230,
                                          height: 36,
                                          listType: listType,
                                          typeValue: typeValue2,
                                          colorBorder: TColor.white,
                                          onChange: (value) {
                                            setState(() {
                                              typeValue2 = value;
                                            });
                                          },
                                        ),
                                        const Sbox(
                                          w: 10,
                                        ),
                                        typeValue2 == "Age"
                                            ? DropDownButtonW(
                                                width: 65,
                                                height: 36,
                                                listType: listEqual,
                                                typeValue: typeEqual2,
                                                onChange: (value) {
                                                  setState(() {
                                                    typeEqual2 = value;
                                                  });
                                                },
                                                colorBorder: TColor.white,
                                              )
                                            : DropDownButtonW(
                                                width: 65,
                                                height: 36,
                                                listType: listEqualS,
                                                typeValue: typeEqualS2,
                                                onChange: (value) {
                                                  setState(() {
                                                    typeEqualS2 = value;
                                                  });
                                                },
                                                colorBorder: TColor.white,
                                              ),
                                      ],
                                    ),
                                  ),
                                  const Sbox(
                                    h: 10,
                                  ),
                                  CustomFormFieldWithBorder(
                                    formFieldWidth: 306,
                                    paddingRight: 13,
                                    paddingLeft: 10,
                                    height: 36,
                                    hintText: "Please Enter Type Search",
                                    onChanged: (value) {
                                      setState(() {
                                        secondSearch = value;
                                      });
                                    },
                                    fillColor: TColor.white,
                                  )
                                ],
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    option = false;
                                    secondSearch = null;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(color: TColor.red24),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.close,
                                    color: TColor.red24,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : Container(),
                const Sbox(h: 20),
                CustomButton(
                  onTap: () {
                    if (firstSearch == null && secondSearch == null) {
                      customSnackBar(
                        message: "Please Add text in Search address",
                        bgColor: TColor.red24,
                        txColor: TColor.white,
                      );
                    } else {
                      SearchCubit.get(context).getAllName();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SearchScreen(
                            firstSearch: firstSearch,
                            secondSearch: secondSearch,
                            typeValue: typeValue,
                            typeValue2: typeValue2,
                            typeAnOr: typeAnOr,
                            typeEqual2: typeEqual2,
                            typeEqual: typeEqual,
                            typeEqualS2: typeEqualS2,
                            typeEqualS: typeEqualS,
                          ),
                        ),
                      );
                    }
                  },
                  child: Icon(Icons.search_outlined),
                  radius: 14,
                  borderColor: const Color(0xff2D9CDB),
                  bgColor: const Color(0xff2D9CDB),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
