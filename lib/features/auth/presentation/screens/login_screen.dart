import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:telemedicine/core/helper/validations/app_validations.dart';
import 'package:telemedicine/core/theme/app_theme.dart';
import 'package:telemedicine/features/auth/presentation/screens/signup_screen.dart';
import 'package:telemedicine/features/auth/presentation/widgets/custom_button.dart';
import 'package:telemedicine/features/auth/presentation/widgets/custom_input_field.dart';
import 'package:telemedicine/features/home/presentation/screens/home_screen.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "LoginScreen";
  LoginScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final height = MediaQuery.of(context).size.height;
    final globalKey = GlobalKey<FormState>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppTheme.backGroundColor,
        body: Padding(
          padding: const EdgeInsets.all(18),
          child: SingleChildScrollView(
            child: Form(
              key: globalKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: height * 0.05),
                  Image.asset(
                    height: 120.h,
                    width: 100.w,
                    "assets/icons/telemedicine.png",
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    textAlign: TextAlign.center,
                    "Welcome Back!",
                    style: textTheme.titleLarge!.copyWith(
                      color: AppTheme.white,
                      fontSize: 27.sp,
                    ),
                  ),
                  SizedBox(height: 20.h),

                  Text(
                    textAlign: TextAlign.center,
                    "Login To Your Account to Continue",
                    style: textTheme.titleMedium!.copyWith(
                      color: AppTheme.white,
                    ),
                  ),
                  SizedBox(height: 20.h),

                  CustomInputField(
                    title: "Enter Your E-mail",
                    controller: emailController,
                    validator: (name) => AppValidations.nameValidator(name),
                  ),
                  SizedBox(height: 20.h),
                  CustomInputField(
                    isPasswordField: true,
                    title: "Enter Your Password",
                    controller: passwordController,
                    validator: (password) =>
                        AppValidations.nameValidator(password),
                  ),
                  SizedBox(height: 5.h),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      textAlign: TextAlign.end,
                      "Forgot Password ?",
                      style: textTheme.titleMedium!.copyWith(
                        color: AppTheme.aquaMint,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  CustomButton(
                    onPressed: () {
                      if (globalKey.currentState!.validate()) {
                        Navigator.of(
                          context,
                        ).pushReplacementNamed(HomeScreen.routeName);
                      }
                    },
                    title: "Login",
                    titleColor: AppTheme.black,
                    bgColor: AppTheme.aquaMint,
                    width: double.infinity,
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Text(
                        "Don't Have an Account ?",
                        style: textTheme.titleLarge!.copyWith(
                          color: AppTheme.grayF0,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(
                            context,
                          ).pushReplacementNamed(SignUpScreen.routeName);
                        },
                        child: Text(
                          "SignUp",
                          style: textTheme.titleLarge!.copyWith(
                            color: AppTheme.aquaMint,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
