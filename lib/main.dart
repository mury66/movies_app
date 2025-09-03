import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/firebase_options.dart';
import 'package:movies_app/observer.dart';
import 'package:movies_app/repository/home_repo_imp.dart';
import 'package:movies_app/screens/home/home_screen.dart';
import 'package:movies_app/screens/home/home_tabs/profile_tab.dart';
import 'package:movies_app/screens/Auth/forget_password_screen.dart';
import 'package:movies_app/screens/Auth/login_screen.dart';
import 'package:movies_app/screens/Auth/register_screen.dart';
import 'package:movies_app/screens/home/update_profile/update_profile.dart';
import 'package:movies_app/screens/introduction/intro_screen.dart';
import 'package:movies_app/screens/introduction/on_boarding_screen.dart';
import 'package:movies_app/screens/introduction/splash_screen.dart';
import 'package:movies_app/screens/movie_details/movie_details_screen.dart';

import 'core/cache_helper/cache_helper.dart';
import 'core/themes/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Bloc.observer = MyBlocObserver();
  await SharedPreferencesHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final repo = HomeRepoImpelementation();

    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        theme: AppTheme.getTheme(context: context),
        debugShowCheckedModeBanner: false,
        title: 'Movies App',
        routes: {
          SplashScreen.routeName: (context) => const SplashScreen(),
          onBoardingScreen.routeName: (context) => onBoardingScreen(),
          IntroScreen.routeName: (context) => IntroScreen(),
          HomeScreen.routeName: (context) => HomeScreen(),
          LoginScreen.routeName: (context) => const LoginScreen(),
          RegisterScreen.routeName: (context) => const RegisterScreen(),
          ProfileTab.routeName: (context) => const ProfileTab(),
          UpdateProfile.routeName: (context) => const UpdateProfile(),
          ForgetPasswordScreen.routeName: (context) =>
              const ForgetPasswordScreen(),
        },
        initialRoute: LoginScreen.routeName,
      ),
    );
  }
}
