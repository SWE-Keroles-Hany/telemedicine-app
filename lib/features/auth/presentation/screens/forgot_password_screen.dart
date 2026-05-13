import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:telemedicine/core/helper/validations/app_validations.dart';
import 'package:telemedicine/core/theme/color_manger.dart';
import 'package:telemedicine/core/utils/ui_utils.dart';
import 'package:telemedicine/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:telemedicine/features/auth/presentation/cubit/auth_states.dart';
import 'package:telemedicine/features/auth/presentation/screens/login_screen.dart';
import 'package:telemedicine/features/auth/presentation/widgets/custom_button.dart';
import 'package:telemedicine/features/auth/presentation/widgets/custom_input_field.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static const String routeName = "ForgotPasswordScreen";

  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController codeController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final globalKey = GlobalKey<FormState>();

  // Step: 0 = Email, 1 = Code, 2 = New Password
  int currentStep = 0;

  @override
  void dispose() {
    emailController.dispose();
    codeController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

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
                  // Handle Send Code
                  if (state is ForgotPasswordSendCodeLoading) {
                    UiUtils.showLoadingIndicator(context);
                  } else if (state is ForgotPasswordSendCodeError) {
                    UiUtils.hideLoading(context);
                    UiUtils.showMessage(
                      message: "Some Thing went wrong, please try again",
                      isErrorMessage: true,
                    );
                  } else if (state is ForgotPasswordSendCodeSuccess) {
                    UiUtils.hideLoading(context);
                    setState(() {
                      currentStep = 1;
                    });
                    UiUtils.showMessage(
                      message: "Code sent to your email",
                      isErrorMessage: false,
                    );
                  }

                  // Handle Verify Code
                  if (state is ForgotPasswordVerifyCodeLoading) {
                    UiUtils.showLoadingIndicator(context);
                  } else if (state is ForgotPasswordVerifyCodeError) {
                    UiUtils.hideLoading(context);
                    UiUtils.showMessage(
                      message: "Some Thing went wrong, please try again",
                      isErrorMessage: true,
                    );
                  } else if (state is ForgotPasswordVerifyCodeSuccess) {
                    UiUtils.hideLoading(context);
                    setState(() {
                      currentStep = 2;
                    });
                    UiUtils.showMessage(
                      message: "Code verified successfully",
                      isErrorMessage: false,
                    );
                  }

                  // Handle Reset Password
                  if (state is ForgotPasswordResetLoading) {
                    UiUtils.showLoadingIndicator(context);
                  } else if (state is ForgotPasswordResetError) {
                    UiUtils.hideLoading(context);
                    UiUtils.showMessage(
                      message: "Some Thing went wrong, please try again",
                      isErrorMessage: true,
                    );
                  } else if (state is ForgotPasswordResetSuccess) {
                    UiUtils.hideLoading(context);
                    UiUtils.showMessage(
                      message: "Password reset successfully",
                      isErrorMessage: false,
                    );
                    // Navigate back to login
                    Future.delayed(Duration(seconds: 1), () {
                      Navigator.of(
                        context,
                      ).pushReplacementNamed(LoginScreen.routeName);
                    });
                  }
                },
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
                      'Forgot Password',
                      style: textTheme.titleLarge!.copyWith(
                        color: ColorManager.white,
                        fontSize: 27.sp,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Text(
                      textAlign: TextAlign.center,
                      _getStepDescription(),
                      style: textTheme.titleMedium!.copyWith(
                        color: ColorManager.white,
                      ),
                    ),
                    SizedBox(height: 30.h),
                    // Step 0: Enter Email
                    if (currentStep == 0) _buildEmailStep(textTheme),
                    // Step 1: Enter Code
                    if (currentStep == 1) _buildCodeStep(textTheme),
                    // Step 2: Enter New Password
                    if (currentStep == 2) _buildPasswordStep(textTheme),
                    SizedBox(height: 20.h),
                    _buildActionButton(context, textTheme),
                    SizedBox(height: 20.h),
                    // Back to Login button
                    Align(
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(
                            context,
                          ).pushReplacementNamed(LoginScreen.routeName);
                        },
                        child: Text(
                          'Back to Login',
                          style: textTheme.titleMedium!.copyWith(
                            color: ColorManager.aquaMint,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  String _getStepDescription() {
    switch (currentStep) {
      case 0:
        return 'Enter your email address to receive a reset code';
      case 1:
        return 'Enter the verification code sent to your email';
      case 2:
        return 'Enter your new password';
      default:
        return '';
    }
  }

  Widget _buildEmailStep(TextTheme textTheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomInputField(
          title: 'Email Address',
          controller: emailController,
          validator: (value) => AppValidations.emailValidator(value),
          keyboardType: TextInputType.emailAddress,
        ),
      ],
    );
  }

  Widget _buildCodeStep(TextTheme textTheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomInputField(
          title: 'Verification Code',
          controller: codeController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter the verification code';
            }
            return null;
          },
          keyboardType: TextInputType.text,
        ),
        SizedBox(height: 10.h),
        Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: () {
              // Resend code logic
              if (emailController.text.isNotEmpty) {
                context.read<AuthCubit>().forgotPasswordSendCode(
                  email: emailController.text,
                );
              }
            },
            child: Text(
              'Resend Code',
              style: textTheme.titleMedium!.copyWith(
                color: ColorManager.aquaMint,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordStep(TextTheme textTheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomInputField(
          title: 'New Password',
          controller: newPasswordController,
          isPasswordField: true,
          validator: (value) => AppValidations.passwordValidator(value: value),
        ),
        SizedBox(height: 15.h),
        CustomInputField(
          title: 'Confirm Password',
          controller: confirmPasswordController,
          isPasswordField: true,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please confirm your password';
            }
            if (value != newPasswordController.text) {
              return 'Passwords do not match';
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildActionButton(BuildContext context, TextTheme textTheme) {
    String buttonTitle = '';
    VoidCallback? onPressed;

    switch (currentStep) {
      case 0:
        buttonTitle = 'Send Code';
        onPressed = () {
          if (globalKey.currentState!.validate()) {
            context.read<AuthCubit>().forgotPasswordSendCode(
              email: emailController.text,
            );
          }
        };
        break;
      case 1:
        buttonTitle = 'Verify Code';
        onPressed = () {
          if (globalKey.currentState!.validate()) {
            context.read<AuthCubit>().forgotPasswordVerifyCode(
              email: emailController.text,
              code: codeController.text,
            );
          }
        };
        break;
      case 2:
        buttonTitle = 'Reset Password';
        onPressed = () {
          if (globalKey.currentState!.validate()) {
            context.read<AuthCubit>().forgotPasswordReset(
              email: emailController.text,
              code: codeController.text,
              newPassword: newPasswordController.text,
              confirmPassword: confirmPasswordController.text,
            );
          }
        };
        break;
    }

    return CustomButton(
      onPressed: onPressed,
      title: buttonTitle,
      titleColor: ColorManager.black,
      bgColor: ColorManager.aquaMint,
      width: double.infinity,
    );
  }
}
