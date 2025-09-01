

import 'package:bloc/bloc.dart';

import '../../models/movie_details.dart';
import '../../models/movies_suggestions.dart';
import '../../repository/home_repo.dart';
import '../explore_tab_cubit/explore_states.dart';
import 'movie_details_states.dart';

class MovieDetailsCubit extends Cubit<MovieDetailsStates>{
  HomeRepo homeRepo;
  MovieDetailsCubit(this.homeRepo) : super(MovieDetailsInitialState());
  MovieDetailsModel? movieDetailsResponse;
  SuggestedMoviesModel? similarMoviesResponse;

  void getMovieDetails({required int movieId}) async{
    emit(MovieDetailsGetLoadingState());
    try{
      movieDetailsResponse = await homeRepo.getMovieDetails(movieId);
      emit(MovieDetailsGetSuccessState());
    }catch(e){
      emit(MovieDetailsGetErrorState());
    }
  }

  void getSimilarMovies({required int movieId}) async{
    emit(MovieDetailsGetSimilarLoadingState());
    try{
      similarMoviesResponse = await homeRepo.getSimilarMovie(movieId);
      emit(MovieDetailsGetSimilarSuccessState());
    }catch(e){
      emit(MovieDetailsGetSimilarErrorState());
    }
  }


}