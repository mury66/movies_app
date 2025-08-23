import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTab extends StatefulWidget {
  HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int selectedAvatar = 0;

  final avatars = [
    "assets/images/movie_card.png",
    "assets/images/movie_card.png",
    "assets/images/movie_card.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/home_bg.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: ListView(
        children: [
          Image.asset(
            'assets/images/available_now.png',
            fit: BoxFit.contain,
            width: 276.w,
            height: 93.h,
          ),
          SizedBox(height: 20.h),
          CarouselSlider.builder(
            itemCount: avatars.length,
            itemBuilder: (context, index, realIndex) {
              final isSelected = index == selectedAvatar;
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                child: AnimatedScale(
                  scale: isSelected ? 1.1 : 0.9,
                  duration: const Duration(milliseconds: 150),
                  child: Image.asset(avatars[index], fit: BoxFit.contain),
                ),
              );
            },
            options: CarouselOptions(
              height: 400.h,
              enlargeCenterPage: true,
              enableInfiniteScroll: true,
              viewportFraction: 0.6,
              pageSnapping: true,
              onPageChanged: (index, reason) {
                setState(() {
                  selectedAvatar = index;
                });
              },
            ),
          ),
          SizedBox(height: 20.h),
          Image.asset(
            'assets/images/watch_now.png',
            fit: BoxFit.contain,
            width: 276.w,
            height: 93.h,
          ),
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Action",
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
          SizedBox(
            height: 200.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: avatars.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                  child: SizedBox(
                    width: 146.w,
                    height: 220.h,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.r),
                      child: Image.asset(avatars[index]),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
