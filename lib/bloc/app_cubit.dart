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
  HomeRepo homeRepo;
  AppCubit(this.homeRepo) : super(AppInitialState());

  List<Widget> screens = [
    HomeTab(),
    ExploreTab(),
    SearchTab(),
    ProfileTab(),
  ];
  int currentTab =0;
  int selectedMovie=0;
  MoviesModel ? moviesResponse;
  List<String> genres = AppConstants.genres;
  Map<String, MoviesModel> categoryMovies = {};

  void changeTab(int index){
    currentTab = index;
    emit(AppChangeTabState());
  }
  void changeSelectedMovie(int index){
    selectedMovie = index;
    emit(AppChangeSelectedMovieState());
  }
  void getMovies()async{
    emit(AppGetMoviesLoadingState());
    try{
      moviesResponse = await homeRepo.getMovies();
      emit(AppGetMoviesSuccessState());
    }catch(e){
      emit(AppGetMoviesErrorState());
    }
  }

  void getAllCategoriesMovies()async{
    emit(AppGetCategoryMoviesLoadingState());
    try{
      final futures = genres.map((genre) async {
        final response = await homeRepo.getCategoryMovies(genre);
        categoryMovies[genre] = response;
      }).toList();
      await Future.wait(futures);
      emit(AppGetCategoryMoviesSuccessState());
    }catch(e){
      emit(AppGetCategoryMoviesErrorState());
      print(e);
    }
  }




}