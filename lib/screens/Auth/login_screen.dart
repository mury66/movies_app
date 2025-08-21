import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/screens/Auth/forget_password_screen.dart';
import 'package:movies_app/screens/Auth/register_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/LoginScreen';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPasswordVisible = false;
  bool isRePasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(19.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              Image.asset(
                "assets/images/logo_login.png",
                fit: BoxFit.cover,
                width: 121.w,
                height: 118.h,
              ),
              SizedBox(height: 50.h),
              TextFormField(
                decoration: InputDecoration(
                  fillColor: Theme.of(context).colorScheme.secondary,
                  filled: true,
                  hintText: "Email",
                  prefixIcon: Icon(Icons.email, size: 30),
                ),
              ),
              SizedBox(height: 25.h),
              TextFormField(
                obscureText: !isRePasswordVisible,
                decoration: InputDecoration(
                  fillColor: Theme.of(context).colorScheme.secondary,
                  filled: true,
                  hintText: "Password",
                  prefixIcon: Icon(Icons.lock, color: Colors.white, size: 30),
                  suffixIcon: IconButton(
                    icon: Icon(
                      isRePasswordVisible
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: () {
                      setState(() {
                        isRePasswordVisible = !isRePasswordVisible;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 25.h),
              Container(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      ForgetPasswordScreen.routeName,
                    );
                  },
                  child: Text(
                    "Forget Password ?",
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    )
                  ),
                ),
              ),
              SizedBox(height: 25.h),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Login",
                ),
              ),
              SizedBox(height: 25.h),
              Center(
                child: Text.rich(
                  TextSpan(
                    text: "Don't Have Account ? ",
                    style: GoogleFonts.roboto(
                      textStyle: Theme.of(context).textTheme.displayMedium
                    ),
                    children: [
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(
                              context,
                              RegisterScreen.routeName,
                            );
                          },
                        text: "Create One",
                        style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold
                        )
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.0.w),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Theme.of(context).colorScheme.primary,
                        endIndent: 20.w,
                      ),
                    ),
                    Center(
                      child: Text(
                        "OR",
                        style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.sp,
                        )
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        indent: 20.w,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25),
              ElevatedButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/icon _google_.png",
                      width: 30.w,
                      height: 30.h,
                    ),
                    SizedBox(width: 10.w),
                    Text("Login with Google"),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.r),
                      border: Border.all(
                        color: Theme.of(context).colorScheme.primary,
                        width: 3.w,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: Image.asset(
                      "assets/images/LR.png",
                      width: 30.w,
                      height: 30.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.r),
                      border: Border.all(width: 3.w, style: BorderStyle.solid),
                    ),
                    child: Image.asset(
                      "assets/images/EG.png",
                      width: 30.w,
                      height: 30.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
