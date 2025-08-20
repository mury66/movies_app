import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/screens/on_boarding_screen.dart';

import 'core/themes/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430,932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) => MaterialApp(
        theme: AppTheme.getTheme(context: context),
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        routes: {
          onBoardingScreen.routeName: (context) =>  onBoardingScreen(),
        },
        initialRoute: onBoardingScreen.routeName,
      ),
    );
  }
}
