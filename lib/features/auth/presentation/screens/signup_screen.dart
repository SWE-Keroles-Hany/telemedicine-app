import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:telemedicine/core/helper/validations/app_validations.dart';
import 'package:telemedicine/core/theme/color_manger.dart';
import 'package:telemedicine/core/utils/ui_utils.dart';
import 'package:telemedicine/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:telemedicine/features/auth/presentation/cubit/auth_states.dart';
import 'package:telemedicine/features/auth/presentation/screens/login_screen.dart';
import 'package:telemedicine/features/auth/presentation/widgets/blood_type_dropdown.dart';
import 'package:telemedicine/features/auth/presentation/widgets/custom_button.dart';
import 'package:telemedicine/features/auth/presentation/widgets/custom_input_field.dart';
import 'package:telemedicine/features/home/presentation/screens/home_screen.dart';

import '../../domain/entities/user_entity.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = "SignUpScreen";
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController dateOfBirth = TextEditingController();

  final globalKey = GlobalKey<FormState>();
  String? selectedBloodType;
  String? selectedGender;

  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
    phoneNumberController.dispose();
    addressController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
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
                  if (state is RegisterError) {
                    UiUtils.hideLoading(context);
                    UiUtils.showMessage(
                      message: state.message,
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
                          color: ColorManager.white,
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

                      CustomInputField(
                        title: "Enter Your Phone Number",
                        controller: phoneNumberController,
                        validator: (email) =>
                            AppValidations.emailValidator(email),
                      ),
                      SizedBox(height: 15.h),

                      CustomDropDown(
                        label: "Choose Your Blood Type",
                        items: [
                          'A+',
                          'A-',
                          'B+',
                          'B-',
                          'AB+',
                          'AB-',
                          'O+',
                          'O-',
                        ],
                        key: ValueKey(selectedBloodType),
                        value: selectedBloodType,
                        onChanged: (value) {
                          setState(() => selectedBloodType = value);
                        },
                      ),
                      SizedBox(height: 15.h),
                      CustomDropDown(
                        label: "Choose Your Gender",

                        items: ['Male', 'Female'],
                        key: ValueKey(selectedGender ?? ""),
                        value: selectedGender,
                        onChanged: (value) {
                          setState(() => selectedGender = value);
                        },
                      ),
                      SizedBox(height: 15.h),
                      CustomButton(
                        onPressed: () async {
                          if (globalKey.currentState!.validate()) {
                            await context.read<AuthCubit>().register(
                              user: UserEntity(
                                address: addressController.text.trim(),
                                allergies: "",
                                bloodType: selectedBloodType ?? "",
                                email: emailController.text.trim(),
                                existingConditions: "",
                                fullName: nameController.text.trim(),
                                gender: "male",
                                password: passwordController.text.trim(),
                                phoneNumber: phoneNumberController.text.trim(),
                              ),
                            );
                          }
                        },
                        title: "SignUp",
                        titleColor: ColorManager.black,
                        bgColor: ColorManager.aquaMint,
                        width: double.infinity,
                      ),

                      Row(
                        children: [
                          Text(
                            "Do you Have an Account ?",
                            style: textTheme.titleLarge!.copyWith(
                              color: ColorManager.grayF0,
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
                                color: ColorManager.aquaMint,
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
