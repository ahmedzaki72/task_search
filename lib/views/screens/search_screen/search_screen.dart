import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_search/bloc/search_cubit/search_cubit.dart';
import 'package:task_search/bloc/search_cubit/search_states.dart';
import 'package:task_search/config/theme_colors.dart';
import 'package:task_search/data/models/user_models.dart';
import 'package:task_search/utils/sized_box.dart';
import 'package:task_search/views/custom_widgets/custom_text.dart';
import 'package:task_search/views/screens/widgets/custom_user_w.dart';

class SearchScreen extends StatefulWidget {
  String? firstSearch;
  String? secondSearch;
  String? typeValue;
  String? typeEqual;
  String? typeEqualS;
  String? typeEqual2;
  String? typeEqualS2;
  String? typeAnOr;
  String? typeValue2;
  SearchScreen(
      {Key? key,
      this.firstSearch,
      this.secondSearch,
      this.typeValue,
      this.typeEqual,
      this.typeEqualS,
      this.typeAnOr,
      this.typeValue2,
      this.typeEqualS2,
      this.typeEqual2})
      : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<UserModelsData> filterList = [];

  void searchFilter({
    BuildContext? context,
    String? firstSearch,
    String? secondSearch,
    String? typeValue,
    String? typeEqual,
    String? typeEqualS,
    String? typeEqual2,
    String? typeEqualS2,
    String? typeAnOr,
    String? typeValue2,
  }) {
      if (typeValue == "Age") {
        if (typeEqual == "=") {
          filterList = SearchCubit.get(context)
              .userModelData!
              .where(
                  (element) => element.age! == int.parse(firstSearch!.trim()))
              .toList();
        } else if (typeEqual == "!=") {
          filterList = SearchCubit.get(context)
              .userModelData!
              .where(
                  (element) => element.age! != int.parse(firstSearch!.trim()))
              .toList();
        } else if (typeEqual == "<") {
          filterList = SearchCubit.get(context)
              .userModelData!
              .where(
                  (element) => element.age! <= int.parse(firstSearch!.trim()))
              .toList();
        } else if (typeEqual == ">") {
          filterList = SearchCubit.get(context)
              .userModelData!
              .where(
                  (element) => element.age! >= int.parse(firstSearch!.trim()))
              .toList();
        }
      } else if (typeValue == "First Name") {
        if (typeEqual == "SWith") {
          filterList = SearchCubit.get(context)
              .userModelData!
              .where((element) => element.firstName!
                  .toLowerCase()
                  .startsWith(firstSearch!.trim()))
              .toList();
        } else if (typeEqual == "EWith") {
          filterList = SearchCubit.get(context)
              .userModelData!
              .where((element) => element.firstName!
                  .toLowerCase()
                  .endsWith(firstSearch!.trim()))
              .toList();
        } else if (typeEqual == "Contain") {
          filterList = SearchCubit.get(context)
              .userModelData!
              .where((element) => element.firstName!
                  .toLowerCase()
                  .contains(firstSearch!.trim()))
              .toList();
        } else if (typeEqual == "Exact") {
          filterList = SearchCubit.get(context)
              .userModelData!
              .where((element) =>
                  element.firstName!.toLowerCase() == firstSearch!.trim())
              .toList();
        }
      } else if (typeValue == "Last Name") {
        if (typeEqual == "SWith") {
          filterList = SearchCubit.get(context)
              .userModelData!
              .where((element) => element.lastName!
                  .toLowerCase()
                  .startsWith(firstSearch!.trim()))
              .toList();
        } else if (typeEqual == "EWith") {
          filterList = SearchCubit.get(context)
              .userModelData!
              .where((element) =>
                  element.lastName!.toLowerCase().endsWith(firstSearch!.trim()))
              .toList();
        } else if (typeEqual == "Contain") {
          filterList = SearchCubit.get(context)
              .userModelData!
              .where((element) =>
                  element.lastName!.toLowerCase().contains(firstSearch!.trim()))
              .toList();
        } else if (typeEqual == "Exact") {
          filterList = SearchCubit.get(context)
              .userModelData!
              .where((element) =>
                  element.firstName!.toLowerCase() == firstSearch!.trim())
              .toList();
        }
      } else if (typeValue == "Full Name") {
        if (typeEqual == "SWith") {
          filterList = SearchCubit.get(context)
              .userModelData!
              .where((element) => element.fullName!
                  .toLowerCase()
                  .startsWith(firstSearch!.trim()))
              .toList();
        } else if (typeEqual == "EWith") {
          filterList = SearchCubit.get(context)
              .userModelData!
              .where((element) =>
                  element.fullName!.toLowerCase().endsWith(firstSearch!.trim()))
              .toList();
        } else if (typeEqual == "Contain") {
          filterList = SearchCubit.get(context)
              .userModelData!
              .where((element) =>
                  element.fullName!.toLowerCase().contains(firstSearch!.trim()))
              .toList();
        } else if (typeEqual == "Exact") {
          filterList = SearchCubit.get(context)
              .userModelData!
              .where((element) =>
                  element.firstName!.toLowerCase() == firstSearch!.trim())
              .toList();
        }
      } else if (typeValue == "Gender") {
        if (typeEqual == "SWith") {
          filterList = SearchCubit.get(context)
              .userModelData!
              .where((element) =>
                  element.gender!.toLowerCase().startsWith(firstSearch!.trim()))
              .toList();
        } else if (typeEqual == "EWith") {
          filterList = SearchCubit.get(context)
              .userModelData!
              .where((element) =>
                  element.gender!.toLowerCase().endsWith(firstSearch!.trim()))
              .toList();
        } else if (typeEqual == "Contain") {
          filterList = SearchCubit.get(context)
              .userModelData!
              .where((element) =>
                  element.gender!.toLowerCase().contains(firstSearch!.trim()))
              .toList();
        } else if (typeEqual == "Exact") {
          filterList = SearchCubit.get(context)
              .userModelData!
              .where((element) =>
                  element.firstName!.toLowerCase() == firstSearch!.trim())
              .toList();
        }
      }
      //// when using (and) and or (or) have a lot of condition and this you handle in backend best and in ui or mobile not best practice way
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit()..getAllName(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: BlocBuilder<SearchCubit, SearchStates>(
                builder: (context, state) {
                  if (state is SearchLoadingStates) {
                    return SizedBox(
                      height: 1.sh,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else if (state is SearchSuccessStates) {
                    searchFilter(
                      context: context,
                      firstSearch: widget.firstSearch,
                      secondSearch: widget.secondSearch,
                      typeValue: widget.typeValue,
                      typeValue2: widget.typeValue2,
                      typeEqualS: widget.typeEqualS,
                      typeEqualS2: widget.typeEqualS2,
                      typeEqual: widget.typeEqual,
                      typeEqual2: widget.typeEqual2,
                      typeAnOr: widget.typeAnOr,
                    );
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Sbox(
                          h: 20,
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(Icons.arrow_back)),
                        const Sbox(
                          h: 30,
                        ),
                        const CustomText(
                          text: "Users",
                          fontW: FontWeight.w800,
                          fontSize: 32,
                        ),
                        const Sbox(
                          h: 20,
                        ),
                        filterList.isEmpty
                            ? const Center(
                                child: CustomText(
                                text: "Not Have any Name",
                                fontW: FontWeight.w800,
                                fontSize: 20,
                              ))
                            : ListView.builder(
                                itemCount: filterList.length,
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 8.w),
                                    child: CustomUserW(
                                      images:
                                          "https://www.w3schools.com/w3images/avatar2.png",
                                      name: filterList[index].fullName,
                                      gender: filterList[index].gender,
                                    ),
                                  );
                                }),
                        const Sbox(h: 20),
                      ],
                    );
                  } else if (state is SearchErrorStates) {
                    return Container(
                      height: 1.sh,
                      color: TColor.red24,
                    );
                  } else {
                    return Container(
                      height: 1.sh,
                      color: TColor.greenSuccess,
                    );
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
