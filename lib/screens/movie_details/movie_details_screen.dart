import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/repository/home_repo.dart';
import 'package:movies_app/repository/home_repo_imp.dart';
import '../../bloc/movie_details_cubit/movie_details_cubit.dart';
import '../../bloc/movie_details_cubit/movie_details_states.dart';
import '../../models/movie_details.dart';
import '../../models/movies_suggestions.dart';
import '../../widgets/similar_movie_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieDetailsScreen extends StatelessWidget {
  final int movieId;
  const MovieDetailsScreen({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    HomeRepo repo = HomeRepoImpelementation();
    return BlocProvider(
      create: (context) =>
      MovieDetailsCubit(repo)
        ..getMovieDetails(movieId: movieId)
        ..getSimilarMovies(movieId: movieId),
      child: BlocBuilder<MovieDetailsCubit, MovieDetailsStates>(
        builder: (context, state) {
          final cubit = context.read<MovieDetailsCubit>();
          final MovieDetailsModel? movie = cubit.movieDetailsResponse;
          List<String?> screenshots = [
            movie?.data?.movie?.mediumScreenshotImage1,
            movie?.data?.movie?.mediumScreenshotImage2,
            movie?.data?.movie?.mediumScreenshotImage3,
          ];
          final List<Movies>? similarMovies = cubit.similarMoviesResponse?.data?.movies;

          if (state is MovieDetailsGetLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }

          if (movie == null) {
            return const Scaffold(
              body: Center(child: Text("No movie details found")),
            );
          }

          return Scaffold(
            body: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child:
                  Stack(
                    children: [
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.network(
                                movie.data?.movie?.largeCoverImage ??
                                    "https://via.placeholder.com/300",
                                fit: BoxFit.cover,
                                height: MediaQuery.of(context).size.height *
                                    0.7,
                                width: double.infinity,
                              ),
                              Container(
                                height: MediaQuery.of(context).size.height *
                                    0.7,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      const Color(0xff121312)
                                          .withOpacity(0.1),
                                      const Color(0xff121312)
                                          .withOpacity(0.3),
                                      const Color(0xff121312)
                                          .withOpacity(0.8),
                                      const Color(0xff121312)
                                          .withOpacity(0.9),
                                      const Color(0xff121312)
                                          .withOpacity(1),
                                    ],
                                  ),
                                ),
                              ),
                              Image.asset("assets/icons/play_ic.png"),
                            ],
                          ),
                          Column(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(height: 8.h),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16.w),
                                child: Text(
                                  movie.data?.movie?.title ??
                                      "no Title",
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium,
                                ),
                              ),
                              SizedBox(height: 8.h),
                              Text(
                                movie.data?.movie?.year.toString() ??
                                    "no Title",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Positioned(
                        top: 40.h,
                        left: 16.w,
                        right: 16.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: const ImageIcon(AssetImage("assets/icons/arr_back_ic.png"),
                                  color: Colors.white),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            IconButton(
                              icon: const ImageIcon(AssetImage("assets/icons/save_ic.png"),
                                  color: Colors.white),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: 16.h,),),
                //watch button and stats
                SliverToBoxAdapter(
                  child: Column(
                    spacing: 16.h,
                    children: [
                      Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 16.0.w),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            side: BorderSide.none,
                          ),
                          child: Text(
                            "Watch",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium,
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: 16.0.w),
                        child: Row(
                          spacing: 4.w,
                          children: [
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(
                                    vertical: 12.h, horizontal: 22.w),
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondary,
                                  borderRadius:
                                  BorderRadius.circular(16.r),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    ImageIcon(
                                      AssetImage(
                                          "assets/icons/like_ic.png"),
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary,
                                      size: 28.sp,
                                    ),
                                    Text(
                                        movie.data?.movie?.likeCount.toString() ??
                                            "NA",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineMedium
                                            ?.copyWith(
                                            color: Colors.white)),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(
                                    vertical: 12.h, horizontal: 22.w),
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondary,
                                  borderRadius:
                                  BorderRadius.circular(16.r),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    ImageIcon(
                                      AssetImage(
                                          "assets/icons/watch_ic.png"),
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary,
                                      size: 28.sp,
                                    ),
                                    Text(movie.data?.movie?.runtime.toString() ??
                                        "NA",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineMedium
                                            ?.copyWith(
                                            color: Colors.white)),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(
                                    vertical: 12.h, horizontal: 22.w),
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondary,
                                  borderRadius:
                                  BorderRadius.circular(16.r),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    ImageIcon(
                                      AssetImage(
                                          "assets/icons/star_ic.png"),
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary,
                                      size: 28.sp,
                                    ),
                                    Text(movie.data?.movie?.rating.toString() ??
                                        "NA",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineMedium
                                            ?.copyWith(
                                            color: Colors.white)),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: 16.h,),),
                //Screen Shots section
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.stretch,
                    spacing: 16.h,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w),
                        child: Text("Screen Shots",
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(color: Colors.white)),
                      ),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        padding:
                        EdgeInsets.symmetric(horizontal: 16.w),
                        itemBuilder: (context, index) {
                          return ClipRRect(
                            borderRadius:
                            BorderRadius.circular(16.r),
                            child: Image.network(
                              screenshots[index] ?? "https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png",
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
                ),
                // Similar Movies section
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        if (similarMovies == null || similarMovies.isEmpty) ...[
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: Text(
                              "No similar movies available",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium
                                  ?.copyWith(color: Colors.white),
                            ),
                          ),
                        ] else ...[
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: Text(
                              "Similar",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium
                                  ?.copyWith(color: Colors.white),
                            ),
                          ),
                          SizedBox(height: 12.h),
                          GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 16.h,
                              crossAxisSpacing: 16.w,
                              childAspectRatio: 0.7,
                            ),
                            itemBuilder: (context, index) {
                              return SimilarMovieItem(
                                movie: similarMovies[index],
                              );
                            },
                            itemCount: similarMovies.length,
                          ),
                        ]
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
