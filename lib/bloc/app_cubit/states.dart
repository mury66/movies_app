abstract class AppStates{}
class AppInitialState extends AppStates{}

class AppChangeTabState extends AppStates{}

class AppGetMoviesLoadingState extends AppStates{}
class AppGetMoviesSuccessState extends AppStates{}
class AppGetMoviesErrorState extends AppStates{}

class AppGetCategoryMoviesLoadingState extends AppStates{}
class AppGetCategoryMoviesSuccessState extends AppStates{}
class AppGetCategoryMoviesErrorState extends AppStates{}



class AppChangeSelectedMovieState extends AppStates{}
