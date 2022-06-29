import 'package:task_search/bloc/search_cubit/search_cubit.dart';
import 'package:task_search/data/models/user_models.dart';

abstract class SearchStates {}

class SearchInitialStates extends SearchStates {}

class SearchLoadingStates extends SearchStates {}

class SearchSuccessStates extends SearchStates {
  List<UserModelsData>? userModelsData;
  List<UserModelsData>? userModelFilter;
  SearchSuccessStates({
    this.userModelsData,
    this.userModelFilter,
  });
}

class SearchErrorStates extends SearchStates {
  String? error;
  SearchErrorStates({this.error});
}



