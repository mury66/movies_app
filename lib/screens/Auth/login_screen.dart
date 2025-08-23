import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/firebase/firebasemanger.dart';
import 'package:movies_app/screens/Auth/forget_password_screen.dart';
import 'package:movies_app/screens/Auth/register_screen.dart';
import 'package:movies_app/screens/home/home_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/LoginScreen';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formkey = GlobalKey<FormState>();

  bool isRePasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(19.0),
            child: SingleChildScrollView(
              child: Form(
                key: formkey,
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.07),
                    Image.asset(
                      "assets/images/logo_login.png",
                      fit: BoxFit.contain,
                      width: 121.w,
                      height: 118.h,
                    ),
                    SizedBox(height: 50.h),
                    TextFormField(
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty)
                          return 'Email is required';
                        return null;
                      },
                      decoration: InputDecoration(
                        fillColor: Theme.of(context).colorScheme.secondary,
                        filled: true,
                        hintText: "Email",
                        prefixIcon: Icon(Icons.email, size: 30),
                      ),
                    ),
                    SizedBox(height: 25.h),
                    TextFormField(
                      controller: passwordController,
                      obscureText: !isRePasswordVisible,
                      validator: (value) {
                        if (value == null || value.isEmpty)
                          return 'Password is required';
                        return null;
                      },
                      decoration: InputDecoration(
                        fillColor: Theme.of(context).colorScheme.secondary,
                        filled: true,
                        hintText: "Password",
                        prefixIcon: Icon(Icons.lock, size: 30),
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
                        onTap: () async {
                          setState(() => isLoading = true);
                          await Future.delayed(
                            const Duration(milliseconds: 200),
                          );
                          setState(() => isLoading = false);
                          Navigator.pushNamed(
                            context,
                            ForgetPasswordScreen.routeName,
                          );
                        },
                        child: Text(
                          "Forget Password ?",
                          style: Theme.of(context).textTheme.displayMedium!
                              .copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                      ),
                    ),
                    SizedBox(height: 25.h),
                    ElevatedButton(
                      onPressed: () async {
                        if (!formkey.currentState!.validate()) return;

                        setState(() => isLoading = true);

                        await Firebasemanger.login(
                          email: emailController.text,
                          password: passwordController.text,
                          onSuccess: () {
                            setState(() => isLoading = false);
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              HomeScreen.routeName,
                              (route) => false,
                            );
                          },
                          onError: (message) {
                            setState(() => isLoading = false);
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.error,
                              animType: AnimType.rightSlide,
                              title: 'Error',
                              desc: message,
                              descTextStyle: GoogleFonts.inter(
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.primary,
                                    ),
                              ),
                              btnCancelOnPress: () {},
                              btnOkOnPress: () {},
                            )..show();
                          },
                        );
                      },
                      child: Text("Login"),
                    ),
                    SizedBox(height: 25.h),
                    Center(
                      child: Text.rich(
                        TextSpan(
                          text: "Don't Have Account ? ",
                          style: GoogleFonts.roboto(
                            textStyle: Theme.of(
                              context,
                            ).textTheme.displayMedium,
                          ),
                          children: [
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () async {
                                  setState(() => isLoading = true);
                                  await Future.delayed(
                                    const Duration(milliseconds: 200),
                                  );
                                  setState(() => isLoading = false);
                                  Navigator.pushNamed(
                                    context,
                                    RegisterScreen.routeName,
                                  );
                                },
                              text: "Create One",
                              style: Theme.of(context).textTheme.displayMedium!
                                  .copyWith(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 25.h),
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
                              style: Theme.of(context).textTheme.displayMedium!
                                  .copyWith(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15.sp,
                                  ),
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
                      onPressed: () async {
                        setState(() => isLoading = true);

                        await Firebasemanger.signInWithGoogle(
                          onSuccess: () {
                            setState(() => isLoading = false);
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              HomeScreen.routeName,
                              (_) => false,
                            );
                          },
                          onError: (message) {
                            setState(() => isLoading = false);
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.error,
                              animType: AnimType.rightSlide,
                              title: 'Error',
                              desc: message,
                              descTextStyle: GoogleFonts.inter(
                                textStyle: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.primary,
                                    ),
                              ),
                              btnCancelOnPress: () {},
                              btnOkOnPress: () {},
                            )..show();
                          },
                        );
                      },
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
                  ],
                ),
              ),
            ),
          ),

          if (isLoading)
            Container(
              color: Colors.black.withOpacity(0.5),
              child: const Center(child: CircularProgressIndicator()),
            ),
        ],
      ),
    );
  }
}
