import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileTab extends StatelessWidget {
  static const routeName = "/profile";
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Theme.of(context).colorScheme.secondary,
              child: Padding(
                padding: EdgeInsets.only(top: 60.h, left: 16.w, right: 16.w),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 60.r,
                          backgroundImage: const AssetImage(
                            "assets/images/avatar1.png",
                          ),
                        ),
                        SizedBox(width: 30.w),
                        _Stat(value: "12", label: "Wish List"),
                        SizedBox(width: 25.w),
                        _Stat(value: "10", label: "History"),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                        child: Text(
                          "John Safwat",
                          style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: Theme.of(
                              context,
                            ).textTheme.headlineSmall!.fontSize?.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(
                                context,
                              ).colorScheme.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.r),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 14.h),
                            ),
                            onPressed: () {},
                            child: Text(
                              "Edit Profile",
                              style: GoogleFonts.roboto(
                                fontSize: Theme.of(
                                  context,
                                ).textTheme.headlineSmall!.fontSize?.sp,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          flex: 1,
                          child: ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(
                                context,
                              ).colorScheme.error,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.r),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 14.h),
                            ),
                            onPressed: () {},
                            icon: Icon(
                              Icons.logout,
                              color: Colors.white,
                              size: 22.sp,
                            ),
                            label: Text(
                              "Exit",
                              style: GoogleFonts.roboto(
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontSize: Theme.of(
                                  context,
                                ).textTheme.headlineSmall!.fontSize?.sp,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    TabBar(
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorColor: Theme.of(context).colorScheme.primary,
                      labelColor: Theme.of(context).colorScheme.primary,
                      unselectedLabelColor: Theme.of(
                        context,
                      ).colorScheme.primary,
                      labelStyle: GoogleFonts.roboto(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                      ),
                      tabs: [
                        Tab(
                          icon: Icon(Icons.list_alt, size: 35.sp),
                          child: Text(
                            "Watch List",
                            style: GoogleFonts.roboto(
                              fontSize: 20.sp,
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                        ),
                        Tab(
                          icon: Icon(
                            Icons.folder,
                            size: 35.sp,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          child: Text(
                            "History",
                            style: GoogleFonts.roboto(
                              fontSize: 20.sp,
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Theme.of(context).scaffoldBackgroundColor,
                child: TabBarView(
                  children: [
                    Center(
                      child: Image.asset(
                        "assets/images/no_movies.png",
                        width: 125.w,
                        height: 125.h,
                      ),
                    ),
                    Center(
                      child: Image.asset(
                        "assets/images/no_movies.png",
                        width: 125.w,
                        height: 125.h,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  final String value;
  final String label;
  const _Stat({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: GoogleFonts.roboto(
            color: Theme.of(context).colorScheme.onPrimary,
            fontSize: Theme.of(context).textTheme.headlineLarge!.fontSize?.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          label,
          style: GoogleFonts.roboto(
            color: Theme.of(context).colorScheme.onPrimary,
            fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize?.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
