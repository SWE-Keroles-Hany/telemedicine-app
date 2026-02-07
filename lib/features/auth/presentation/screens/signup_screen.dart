import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:telemedicine/core/helper/validations/app_validations.dart';
import 'package:telemedicine/core/theme/app_theme.dart';
import 'package:telemedicine/core/utils/ui_utils.dart';
import 'package:telemedicine/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:telemedicine/features/auth/presentation/cubit/auth_states.dart';
import 'package:telemedicine/features/auth/presentation/screens/login_screen.dart';
import 'package:telemedicine/features/auth/presentation/widgets/custom_button.dart';
import 'package:telemedicine/features/auth/presentation/widgets/custom_input_field.dart';
import 'package:telemedicine/features/home/presentation/screens/home_screen.dart';

class SignUpScreen extends StatelessWidget {
  static const String routeName = "SignUpScreen";
  SignUpScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final globalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppTheme.backGroundColor,
        body: Padding(
          padding: EdgeInsets.all(18.r),
          child: SingleChildScrollView(
            child: Form(
              key: globalKey,
              child: BlocListener<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is RegisterError) {
                    UiUtils.hideLoading(context);

                    UiUtils.showMessage(
                      message: "Some Thing Went Wrong, Try Again",
                      isErrorMessage: true,
                    );
                  } else if (state is RegisterSuccess) {
                    UiUtils.hideLoading(context);

                    Navigator.of(
                      context,
                    ).pushReplacementNamed(HomeScreen.routeName);
                  } else if (state is RegisterLoading) {
                    UiUtils.showLoadingIndicator(context);
                  }
                },
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 25.h),
                      Image.asset(
                        height: 100.h,
                        width: 100.w,
                        "assets/icons/telemedicine.png",
                      ),
                      SizedBox(height: 25.h),
                      Text(
                        textAlign: TextAlign.center,
                        "Create Account",
                        style: textTheme.titleLarge!.copyWith(
                          fontSize: 26.sp,
                          color: AppTheme.white,
                        ),
                      ),
                      SizedBox(height: 25.h),
                      CustomInputField(
                        title: "Enter Your Name",
                        controller: nameController,
                        validator: (name) => AppValidations.nameValidator(name),
                      ),
                      SizedBox(height: 15.h),

                      CustomInputField(
                        title: "Enter Your E-mail",
                        controller: emailController,
                        validator: (email) =>
                            AppValidations.emailValidator(email),
                      ),
                      SizedBox(height: 15.h),
                      CustomInputField(
                        isPasswordField: true,
                        title: "Enter Your Password",
                        controller: passwordController,
                        validator: (password) =>
                            AppValidations.passwordValidator(value: password),
                      ),
                      SizedBox(height: 15.h),
                      CustomInputField(
                        title: "Enter Your Address",
                        controller: addressController,
                        validator: (address) =>
                            AppValidations.addressValidator(address),
                      ),
                      SizedBox(height: 15.h),
                      CustomButton(
                        onPressed: () async {
                          if (globalKey.currentState!.validate()) {
                            await context.read<AuthCubit>().register(
                              emailController.text,
                              passwordController.text,
                            );
                          }
                        },
                        title: "SignUp",
                        titleColor: AppTheme.black,
                        bgColor: AppTheme.aquaMint,
                        width: double.infinity,
                      ),

                      Row(
                        children: [
                          Text(
                            "Do you Have an Account ?",
                            style: textTheme.titleLarge!.copyWith(
                              color: AppTheme.grayF0,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(
                                context,
                              ).pushReplacementNamed(LoginScreen.routeName);
                            },
                            child: Text(
                              "Login",
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
        ),
      ),
    );
  }
}
