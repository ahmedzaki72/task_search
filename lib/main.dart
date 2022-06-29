import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_search/bloc/search_cubit/search_cubit.dart';
import 'package:task_search/helper/dio_helper.dart';
import 'views/screens/home_screen/home_screen.dart';

void main() {
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SearchCubit()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(428, 926),
        builder: (context, state) {
          return  MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Task Search',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home:   HomeScreen(),
          );
        },
      ),
    );
  }
}

