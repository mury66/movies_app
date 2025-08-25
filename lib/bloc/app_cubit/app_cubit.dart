import 'package:flutter/material.dart';
import 'package:movies_app/bloc/states.dart';
import 'package:bloc/bloc.dart';
import 'package:movies_app/models/movies_model.dart';

import '../constants/app_constants.dart';
import '../repository/home_repo.dart';
import '../screens/home/home_tabs/explore_tab.dart';
import '../screens/home/home_tabs/home_tab.dart';
import '../screens/home/home_tabs/profile_tab.dart';
import '../screens/home/home_tabs/search_tab.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(AppInitialState());
  List<Widget> screens = [
    HomeTab(),
    ExploreTab(),
    SearchTab(),
    ProfileTab(),
  ];
  int currentTab =0;
  void changeTab(int index){
    currentTab = index;
    emit(AppChangeTabState());
  }

}