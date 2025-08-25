import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/repository/home_repo.dart';
import 'package:movies_app/repository/home_repo_imp.dart';
import '../../bloc/app_cubit.dart';
import '../../bloc/states.dart';
import '../../widgets/bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/homeScreen';
  HomeScreen({super.key});
  HomeRepo repo = HomeRepoImpelementation();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(repo)..getMovies()..getAllCategoriesMovies(),
      child: BlocBuilder<AppCubit, AppStates>(
        builder: (BuildContext context, state) {
          final cubit = BlocProvider.of<AppCubit>(context);
          return Scaffold(
            bottomNavigationBar: BottomNavBar(),
            body: IndexedStack(
                index: cubit.currentTab,
                children: cubit.screens
            ),
          );
        },
      ),
    );
  }


}
