import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:telemedicine/core/helper/validations/app_validations.dart';
import 'package:telemedicine/core/theme/color_manger.dart';
import 'package:telemedicine/core/utils/ui_utils.dart';
import 'package:telemedicine/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:telemedicine/features/auth/presentation/cubit/auth_states.dart';
import 'package:telemedicine/features/auth/presentation/screens/signup_screen.dart';
import 'package:telemedicine/features/auth/presentation/widgets/custom_button.dart';
import 'package:telemedicine/features/auth/presentation/widgets/custom_input_field.dart';
import 'package:telemedicine/features/home/presentation/screens/home_screen.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "LoginScreen";
  LoginScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final globalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final height = MediaQuery.sizeOf(context).height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.backGroundColor,
        body: Padding(
          padding: EdgeInsets.all(18.r),
          child: SingleChildScrollView(
            child: Form(
              key: globalKey,
              child: BlocListener<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is LoginError) {
                    UiUtils.hideLoading(context);

                    UiUtils.showMessage(
                      message: state.message,
                      isErrorMessage: true,
                    );
                  } else if (state is LoginSuccess) {
                    UiUtils.hideLoading(context);

                    Navigator.of(
                      context,
                    ).pushReplacementNamed(HomeScreen.routeName);
                  } else if (state is LoginLoading) {
                    UiUtils.showLoadingIndicator(context);
                  }
                },
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: height * 0.05),
                      Image.asset(
                        height: 100.h,
                        width: 100.w,
                        "assets/icons/telemedicine.png",
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        textAlign: TextAlign.center,
                        "Welcome Back!",
                        style: textTheme.titleLarge!.copyWith(
                          color: ColorManager.white,
                          fontSize: 27.sp,
                        ),
                      ),
                      SizedBox(height: 20.h),

                      Text(
                        textAlign: TextAlign.center,
                        "Login To Your Account to Continue",
                        style: textTheme.titleMedium!.copyWith(
                          color: ColorManager.white,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      CustomInputField(
                        title: "Enter Your E-mail",
                        controller: emailController,
                        validator: (value) =>
                            AppValidations.emailValidator(value),
                      ),
                      SizedBox(height: 15.h),

                      CustomInputField(
                        title: "Enter Your Password",
                        controller: passwordController,
                        validator: (value) =>
                            AppValidations.passwordValidator(value: value),
                      ),
                      SizedBox(height: 20.h),
                      CustomButton(
                        onPressed: () async {
                          if (globalKey.currentState!.validate()) {
                            await context.read<AuthCubit>().login(
                              emailController.text,
                              passwordController.text,
                            );
                          }
                        },
                        title: "Login",
                        titleColor: ColorManager.black,
                        bgColor: ColorManager.aquaMint,
                        width: double.infinity,
                      ),
                      SizedBox(height: 20.h),

                      Row(
                        children: [
                          Text(
                            "Don't Have an Account ?",
                            style: textTheme.titleLarge!.copyWith(
                              fontSize: 20.sp,
                              color: ColorManager.grayF0,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(
                                context,
                              ).pushReplacementNamed(SignUpScreen.routeName);
                            },
                            child: Text(
                              "SingUp",
                              style: textTheme.titleLarge!.copyWith(
                                color: ColorManager.aquaMint,
                                fontSize: 20.sp,
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
        ),
      ),
    );
  }
}
