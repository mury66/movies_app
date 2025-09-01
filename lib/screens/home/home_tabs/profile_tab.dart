import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/bloc/profile_tab_cubit/profile_cubit.dart';
import 'package:movies_app/bloc/profile_tab_cubit/profile_states.dart';
import 'package:movies_app/screens/home/update_profile/update_profile.dart';
import 'package:movies_app/widgets/stat_profile';
import 'package:movies_app/screens/Auth/login_screen.dart';

class ProfileTab extends StatelessWidget {
  static const routeName = "/profile";
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is ProfileLoggedOut) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const LoginScreen()),
          );
        }
      },
      builder: (context, state) {
        if (state is ProfileLoading) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (state is ProfileLoggedOut || state is ProfileDeleted) {
          return const Scaffold(body: Center(child: Text("No Profile Data")));
        }

        if (state is ProfileInitial || state is ProfileUpdated) {
          return DefaultTabController(
            length: 2,
            child: Scaffold(
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Theme.of(context).colorScheme.secondary,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 60.h,
                        left: 16.w,
                        right: 16.w,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 60.r,
                                backgroundImage: AssetImage(state.avatar),
                              ),
                              SizedBox(width: 30.w),
                              const StatProfile(
                                value: "12",
                                label: "Watch List",
                              ),
                              SizedBox(width: 25.w),
                              const StatProfile(value: "10", label: "History"),
                            ],
                          ),
                          SizedBox(height: 8.h),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12.w),
                              child: Text(
                                state.name,
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
                                    padding: EdgeInsets.symmetric(
                                      vertical: 14.h,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => BlocProvider.value(
                                          value: context.read<ProfileCubit>(),
                                          child: const UpdateProfile(),
                                        ),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    "Edit Profile",
                                    style: GoogleFonts.roboto(
                                      fontSize: Theme.of(
                                        context,
                                      ).textTheme.headlineSmall!.fontSize?.sp,
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.secondary,
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
                                    padding: EdgeInsets.symmetric(
                                      vertical: 14.h,
                                    ),
                                  ),
                                  onPressed: () {
                                    context.read<ProfileCubit>().logout();
                                  },
                                  icon: Icon(
                                    Icons.logout,
                                    color: Colors.white,
                                    size: 22.sp,
                                  ),
                                  label: Text(
                                    "Exit",
                                    style: GoogleFonts.roboto(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.onPrimary,
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
                            indicatorColor: Theme.of(
                              context,
                            ).colorScheme.primary,
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
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.onPrimary,
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
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.onPrimary,
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

        return const Scaffold(body: Center(child: Text("Unknown State")));
      },
    );
  }
}
