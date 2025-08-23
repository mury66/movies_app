import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'home_tabs/home_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/homeScreen';
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          left: 8.w,
          right: 8.w,
          bottom: 20.h,
        ), // يخليه مش لازق
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem("home_ic", 0),
              _buildNavItem("search_ic", 1),
              _buildNavItem("explore_ic", 2),
              _buildNavItem("profile_ic", 3),
            ],
          ),
        ),
      ),
      body: HomeTab(),
    );
  }

  Widget _buildNavItem(String Img, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ImageIcon(
          AssetImage("assets/icons/$Img.png"),
          color: _selectedIndex != index
              ? Colors.white
              : Theme.of(context).colorScheme.primary,
          size: 24.sp,
        ),
      ),
    );
  }
}
