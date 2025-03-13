import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_c13/ThemeCubit.dart';
import 'package:news_c13/core/AppStyle.dart';
import 'package:news_c13/ui/home/screen/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  runApp(BlocProvider(
      create: (context) => ThemeCubit(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return BlocBuilder<ThemeCubit, ThemeStates>(
          builder: (context, state) {
            return MaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              themeMode: ThemeMode.light,
              theme: AppStyle.lightTheme,
              routes: {
                HomeScreen.routeName: (_) => HomeScreen()
              },
              initialRoute: HomeScreen.routeName,
            );
          },
        );
      },
    );
  }
}

