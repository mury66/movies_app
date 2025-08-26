import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/bloc/movie_details_cubit/movie_details_states.dart';
import 'package:movies_app/models/movies_suggestions.dart';
import 'package:movies_app/repository/home_repo.dart';
import 'package:movies_app/repository/home_repo_imp.dart';
import 'package:movies_app/widgets/movie_list_item.dart';
import '../../bloc/explore_tab_cubit/explore_cubit.dart';
import '../../bloc/explore_tab_cubit/explore_states.dart';
import '../../bloc/movie_details_cubit/movie_details_cubit.dart';
import '../../models/movie_details.dart';
import '../../models/movies_model.dart' hide Movies;

class MovieDetailsScreen extends StatelessWidget {
  static const String routeName = "/movieDetails";
  final int movieId;
  MovieDetailsScreen({super.key, required this.movieId});
  HomeRepo repo = HomeRepoImpelementation();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieDetailsCubit(repo)..getMovieDetails(movieId: movieId)..getSimilarMovies(movieId: movieId),
      child: BlocBuilder<MovieDetailsCubit,MovieDetailsStates>(
        builder: (context, state) {
          MovieDetailsCubit cubit = BlocProvider.of<MovieDetailsCubit>(context);
          final Movie? movie = cubit.movieDetailsResponse?.data?.movie;
          final List<Movies>? similarMovies = cubit.similarMoviesResponse?.data?.movies;
          List<String?> screenshots = [
            movie?.largeScreenshotImage1,
            movie?.largeScreenshotImage2,
            movie?.largeScreenshotImage3,
          ];
          if(state is MovieDetailsGetLoadingState || state is MovieDetailsGetSimilarLoadingState){
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          else if(state is MovieDetailsGetErrorState){
            return Scaffold(
              body: Center(
                child: Text("Error occurred"),
              ),
            );
          }
          else {
            return Scaffold(
              body: SingleChildScrollView(
                child: Stack(
                  children: [
                    Column(
                      spacing: 16.h,
                      children: [
                        Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Image.network(
                                  movie?.largeCoverImage ?? "",
                                  fit: BoxFit.cover,
                                  height: MediaQuery
                                      .of(context)
                                      .size
                                      .height * 0.7,
                                  width: double.infinity,
                                ),
                                Container(
                                  height: MediaQuery
                                      .of(context)
                                      .size
                                      .height * 0.7,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        const Color(0xff121312).withOpacity(
                                            0.0),
                                        const Color(0xff121312).withOpacity(
                                            0.3),
                                        const Color(0xff121312).withOpacity(
                                            0.8),
                                        const Color(0xff121312).withOpacity(
                                            0.9),
                                        const Color(0xff121312).withOpacity(1),
                                      ],
                                    ),
                                  ),
                                ),
                                Image.asset("assets/icons/play_ic.png"),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(height: 8.h),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16.w),
                                  child: Text(
                                    movie?.title ?? "",
                                    textAlign: TextAlign.center,
                                    style: Theme
                                        .of(context)
                                        .textTheme
                                        .headlineMedium,
                                  ),
                                ),
                                SizedBox(height: 8.h),
                                Text(
                                  movie?.year.toString() ?? "",
                                  style: Theme
                                      .of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .copyWith(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              side: BorderSide.none,
                            ),
                            child: Text(
                              "Watch",
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .titleMedium,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.symmetric(
                                      vertical: 12.h, horizontal: 22.w),
                                  decoration: BoxDecoration(
                                    color: Theme
                                        .of(context)
                                        .colorScheme
                                        .secondary,
                                    borderRadius: BorderRadius.circular(16.r),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      ImageIcon(
                                        AssetImage("assets/icons/like_ic.png"),
                                        color: Theme
                                            .of(context)
                                            .colorScheme
                                            .primary, size: 28.sp,),
                                      Text((movie?.likeCount).toString(),
                                          style: Theme
                                              .of(context)
                                              .textTheme
                                              .headlineMedium
                                              ?.copyWith(color: Colors.white)),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 8.w),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.symmetric(
                                      vertical: 12.h, horizontal: 22.w),
                                  decoration: BoxDecoration(
                                    color: Theme
                                        .of(context)
                                        .colorScheme
                                        .secondary,
                                    borderRadius: BorderRadius.circular(16.r),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      ImageIcon(
                                        AssetImage("assets/icons/watch_ic.png"),
                                        color: Theme
                                            .of(context)
                                            .colorScheme
                                            .primary, size: 28.sp,),
                                      Text((movie?.runtime).toString(),
                                          style: Theme
                                              .of(context)
                                              .textTheme
                                              .headlineMedium
                                              ?.copyWith(color: Colors.white)),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 8.w),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.symmetric(
                                      vertical: 12.h, horizontal: 22.w),
                                  decoration: BoxDecoration(
                                    color: Theme
                                        .of(context)
                                        .colorScheme
                                        .secondary,
                                    borderRadius: BorderRadius.circular(16.r),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      ImageIcon(
                                        AssetImage("assets/icons/star_ic.png"),
                                        color: Theme
                                            .of(context)
                                            .colorScheme
                                            .primary, size: 28.sp,),
                                      Text((movie?.rating).toString(),
                                          style: Theme
                                              .of(context)
                                              .textTheme
                                              .headlineMedium
                                              ?.copyWith(color: Colors.white)),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        //Screen Shots section
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          spacing: 16.h,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: Text("Screen Shots", style: Theme
                                  .of(context)
                                  .textTheme
                                  .headlineMedium
                                  ?.copyWith(color: Colors.white)),
                            ),
                            ListView.separated(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              itemBuilder: (context, index) {
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(16.r),
                                  child: Image.network(
                                    screenshots[index] ?? "",
                                    fit: BoxFit.cover,
                                    height: 167.h,
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  SizedBox(height: 16.h),
                              itemCount: screenshots.length,
                            ),


                          ],
                        ),
                        //Similar Movies section
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          spacing: 16.h,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: Text("Similar", style: Theme
                                  .of(context)
                                  .textTheme
                                  .headlineMedium
                                  ?.copyWith(color: Colors.white)),
                            ),
                            GridView.builder(

                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 16.h,
                                crossAxisSpacing: 16.w,
                                childAspectRatio: 0.7,
                              ),
                              itemBuilder: (context, index) {
                                return MovieListItem(movie: similarMovies?[index]);
                              },
                              itemCount: 4,
                            )


                          ],
                        ),

                      ],
                    ),
                    Positioned(
                      top: 24.h,
                      left: 16.w,
                      right: 16.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: ImageIcon(
                                AssetImage("assets/icons/arr_back_ic.png"),
                                color: Colors.white),

                          ),
                          IconButton(
                            onPressed: () {},
                            icon: ImageIcon(
                                AssetImage("assets/icons/save_ic.png"),
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },

      ),
    );
  }
}
