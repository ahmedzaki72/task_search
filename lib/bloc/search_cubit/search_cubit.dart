import 'package:bloc/bloc.dart';
import 'package:task_search/bloc/search_cubit/search_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_search/data/models/user_models.dart';
import 'package:task_search/helper/dio_helper.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(SearchInitialStates());

  static SearchCubit get(context) => BlocProvider.of(context);
  List<UserModelsData>? userModelData;

  void getAllName() async {
    emit(SearchLoadingStates());
    DioHelper.getData(url: "").then((value) {
      userModelData = List<UserModelsData>.from(
        value.data.map(
          (e) => UserModelsData.fromJson(e),
        ),
      );
      emit(SearchSuccessStates(
        userModelsData: userModelData,
      ));
    }).catchError((error) {
      print(error.toString());
      emit(SearchErrorStates(error: error.toString()));
    });
  }
}
