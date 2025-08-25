import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/bloc/app_cubit.dart';

class WatchNowSectionItem extends StatelessWidget {
  int sectionIndex;
  AppCubit cubit;
  WatchNowSectionItem({super.key, required this.sectionIndex, required this.cubit});

  @override
  Widget build(BuildContext context) {
    var movies = cubit.categoryMovies[cubit.genres[sectionIndex]]?.data!.movies;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                cubit.genres[sectionIndex],
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
                "See More ➔",
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 16.sp,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20.h),
        SizedBox(
          height: 200.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movies?.length ?? 0,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                child: SizedBox(
                  width: 146.w,
                  height: 220.h,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20.r),
                        child: Image.network(movies?[index].largeCoverImage ?? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFQLq_zxU1kYiJ1If0mU0oITrego5NQa07hw&s", fit: BoxFit.cover),
                      ),
                      Container(
                          margin: EdgeInsets.only(top : 12.w , left:10.h),
                          padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.secondary.withAlpha(80),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("${movies?[index].rating} ",style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontSize: 16.sp,
                              ),),
                              Icon(Icons.star, color: Theme.of(context).colorScheme.primary, size: 16.sp,)
                            ],
                          )
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
