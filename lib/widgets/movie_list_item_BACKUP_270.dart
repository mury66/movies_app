import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/movies_model.dart';
import '../screens/movie_details/movie_details_screen.dart';

class MovieListItem extends StatelessWidget {
  final Movies movie;
  const MovieListItem({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
<<<<<<< HEAD
            builder: (context) => MovieDetailsScreen(movieId:movie.id??550),
=======
            builder: (context) => MovieDetailsScreen(movieId: movie?.id ?? 0),
>>>>>>> 9aa478207a924c93a0ab081b4bfd251a53d5befd
          ),
        );
      },

      child: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              image: DecorationImage(
<<<<<<< HEAD
                image: NetworkImage(movie.mediumCoverImage ??"https://via.placeholder.com/150"),
=======
                image: NetworkImage(
                  movie?.mediumCoverImage ?? "https://via.placeholder.com/150",
                ),
>>>>>>> 9aa478207a924c93a0ab081b4bfd251a53d5befd
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
<<<<<<< HEAD
              margin: EdgeInsets.only(top : 12.w , left:10.h),
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary.withAlpha(80),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(movie.rating?.toString() ?? "NA",style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontSize: 16.sp,
                  ),),
                  Icon(Icons.star, color: Theme.of(context).colorScheme.primary, size: 16.sp,)
                ],
              )
          )
=======
            margin: EdgeInsets.only(top: 12.w, left: 10.h),
            padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary.withAlpha(80),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  movie.rating.toString(),
                  style: Theme.of(
                    context,
                  ).textTheme.headlineSmall!.copyWith(fontSize: 16.sp),
                ),
                Icon(
                  Icons.star,
                  color: Theme.of(context).colorScheme.primary,
                  size: 16.sp,
                ),
              ],
            ),
          ),
>>>>>>> 9aa478207a924c93a0ab081b4bfd251a53d5befd
        ],
      ),
    );
  }
}
