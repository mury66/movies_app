import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/bloc/profile_tab_cubit/profile_cubit.dart';
import 'package:movies_app/bloc/profile_tab_cubit/profile_states.dart';
import 'package:movies_app/screens/Auth/forget_password_screen.dart';
import 'package:movies_app/screens/Auth/login_screen.dart';

class UpdateProfile extends StatefulWidget {
  static const String routeName = "updateProfile";

  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  late TextEditingController nameController;
  late TextEditingController phoneController;
  String selectedAvatar = "assets/images/avatar1.png";

  final List<String> avatars = [
    "assets/images/avatar1.png",
    "assets/images/avatar2.png",
    "assets/images/avatar3.png",
    "assets/images/avatar4.png",
    "assets/images/avatar5.png",
    "assets/images/avatar6.png",
    "assets/images/avatar7.png",
    "assets/images/avatar8.png",
    "assets/images/avatar9.png",
  ];

  @override
  void initState() {
    super.initState();
    final profileState = context.read<ProfileCubit>().state;
    nameController = TextEditingController(text: profileState.name);
    phoneController = TextEditingController(text: profileState.phone);
    selectedAvatar = profileState.avatar;
  }

  void _showLoading(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const Center(child: CircularProgressIndicator()),
    );
  }

  void _confirmDelete() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Confirm Delete"),
        content: const Text("Are you sure you want to delete your account?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                LoginScreen.routeName,
                (route) => false,
              );
            },
            child: const Text("Delete", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is ProfileLoading) {
          _showLoading(context);
        } else if (state is ProfileUpdated) {
          Navigator.pop(context);
          Navigator.pop(context);
        } else if (state is ProfileDeleted) {
          Navigator.pop(context);
          Navigator.pushNamedAndRemoveUntil(
            context,
            LoginScreen.routeName,
            (route) => false,
          );
        } else if (state is ProfileError) {
          Navigator.pop(context);
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).colorScheme.primary,
              size: Theme.of(context).textTheme.headlineLarge!.fontSize?.sp,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          title: Text(
            "Pick Avatar",
            style: GoogleFonts.roboto(
              color: Theme.of(context).colorScheme.primary,
              fontSize: Theme.of(context).textTheme.headlineSmall!.fontSize?.sp,
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20.w),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    builder: (_) => GridView.builder(
                      padding: EdgeInsets.all(20.w),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 10.w,
                        mainAxisSpacing: 10.h,
                      ),
                      itemCount: avatars.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedAvatar = avatars[index];
                            });
                            Navigator.pop(context);
                          },
                          child: CircleAvatar(
                            backgroundImage: AssetImage(avatars[index]),
                            radius: 40.r,
                          ),
                        );
                      },
                    ),
                  );
                },
                child: CircleAvatar(
                  radius: 60.r,
                  backgroundImage: AssetImage(selectedAvatar),
                ),
              ),
              SizedBox(height: 30.h),

              TextField(
                controller: nameController,
                style: GoogleFonts.roboto(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: Theme.of(
                    context,
                  ).textTheme.headlineSmall!.fontSize?.sp,
                ),
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.person,
                    color: Theme.of(context).colorScheme.onPrimary,
                    size: 22.sp,
                  ),
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.secondary,
                  labelText: "Name",
                  labelStyle: GoogleFonts.roboto(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: Theme.of(
                      context,
                    ).textTheme.headlineSmall!.fontSize?.sp,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
              ),
              SizedBox(height: 15.h),

              TextField(
                controller: phoneController,
                style: GoogleFonts.roboto(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: Theme.of(
                    context,
                  ).textTheme.headlineSmall!.fontSize?.sp,
                ),
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.phone,
                    color: Colors.white,
                    size: 22.sp,
                  ),
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.secondary,
                  labelText: "Phone",
                  labelStyle: GoogleFonts.roboto(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: Theme.of(
                      context,
                    ).textTheme.headlineSmall!.fontSize?.sp,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
              ),
              SizedBox(height: 20.h),

              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      ForgetPasswordScreen.routeName,
                    );
                  },
                  child: Text(
                    "Reset Password",
                    style: GoogleFonts.roboto(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: Theme.of(
                        context,
                      ).textTheme.headlineMedium!.fontSize?.sp,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 300.h),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.error,
                    side: BorderSide.none,
                    padding: EdgeInsets.symmetric(vertical: 15.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                  ),
                  onPressed: _confirmDelete,
                  child: Text(
                    "Delete Account",
                    style: GoogleFonts.roboto(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: Theme.of(
                        context,
                      ).textTheme.headlineSmall!.fontSize?.sp,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.h),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    side: BorderSide.none,
                    padding: EdgeInsets.symmetric(vertical: 15.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                  ),
                  onPressed: () {
                    context.read<ProfileCubit>().updateProfile(
                      nameController.text,
                      phoneController.text,
                      selectedAvatar,
                    );
                  },
                  child: Text(
                    "Update Data",
                    style: GoogleFonts.roboto(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: Theme.of(
                        context,
                      ).textTheme.headlineSmall!.fontSize?.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
