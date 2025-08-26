import 'package:bloc/bloc.dart';
import 'search_states.dart';
import '../../repository/home_repo_imp.dart';

class SearchCubit extends Cubit<SearchStates> {
  final HomeRepoImpelementation repo;
  SearchCubit(this.repo) : super(SearchInitialState());

  Future<void> getInitialMovies() async {
    emit(SearchLoadingState());
    try {
      final result = await repo.getMovies();
      emit(SearchSuccessState(result.data?.movies ?? []));
    } catch (e) {
      emit(SearchErrorState(e.toString()));
    }
  }

  Future<void> searchMovies(String query) async {
    if (query.isEmpty) {
      await getInitialMovies();
      return;
    }

    emit(SearchLoadingState());
    try {
      final result = await repo.searchMovies(query);
      emit(SearchSuccessState(result));
    } catch (e) {
      emit(SearchErrorState(e.toString()));
    }
  }
}
