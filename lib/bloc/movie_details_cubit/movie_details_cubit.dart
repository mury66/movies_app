import 'package:bloc/bloc.dart';
<<<<<<< HEAD

=======
import '../../firebase/firebasemanger.dart';
>>>>>>> e9c28b0 (no message)
import '../../models/movie_details.dart';
import '../../models/movies_suggestions.dart';
import '../../repository/home_repo.dart';
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

<<<<<<< HEAD
=======
  void toggleWatchlistStatus() {
    isSavedToWatchlist = !isSavedToWatchlist;
    isSavedToWatchlist ? FirebaseManager.addToWatchLater(movieDetailsResponse?.data?.movie?.id??0) : FirebaseManager.removeFromWatchLater(movieDetailsResponse?.data?.movie?.id??0);
    emit(MovieDetailsWatchlistToggledState());
  }

  void addToHistory() {
    FirebaseManager.addToHistory(movieDetailsResponse?.data?.movie?.id??0);
    emit(MovieDetailsAddToHistoryState());
  }

>>>>>>> e9c28b0 (no message)

}