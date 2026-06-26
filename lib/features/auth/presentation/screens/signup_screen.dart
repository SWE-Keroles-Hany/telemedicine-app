import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
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

import '../../../../core/shared_models/user/entities/user_entity.dart';

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
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
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
    heightController.dispose();
    weightController.dispose();
    dateOfBirth.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.backGroundColor,
        body: Padding(
          padding: EdgeInsets.all(22.r),
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
                    ).pushReplacementNamed(LoginScreen.routeName);
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
                        'signup.create_account'.tr(),
                        style: textTheme.titleLarge!.copyWith(
                          fontSize: 26.sp,
                          color: ColorManager.white,
                        ),
                      ),
                      SizedBox(height: 25.h),
                      CustomInputField(
                        title: 'signup.enter_name'.tr(),
                        controller: nameController,
                        validator: (name) => AppValidations.nameValidator(name),
                      ),
                      SizedBox(height: 15.h),

                      CustomInputField(
                        title: 'signup.enter_email'.tr(),
                        controller: emailController,
                        validator: (email) =>
                            AppValidations.emailValidator(email),
                      ),
                      SizedBox(height: 15.h),
                      CustomInputField(
                        isPasswordField: true,
                        title: 'signup.enter_password'.tr(),
                        controller: passwordController,
                        validator: (password) =>
                            AppValidations.passwordValidator(value: password),
                      ),
                      SizedBox(height: 15.h),
                      CustomInputField(
                        title: 'signup.enter_address'.tr(),
                        controller: addressController,
                        validator: (address) =>
                            AppValidations.addressValidator(address),
                      ),
                      SizedBox(height: 15.h),

                      CustomInputField(
                        keyboardType: TextInputType.number,
                        title: 'signup.enter_phone'.tr(),
                        controller: phoneNumberController,
                        validator: (email) =>
                            AppValidations.phoneNumberValidator(email),
                      ),
                      SizedBox(height: 15.h),
                      Row(
                        children: [
                          Expanded(
                            child: CustomInputField(
                              keyboardType: TextInputType.number,
                              title: 'Enter Your Height'.tr(),
                              controller: heightController,
                              validator: (value) =>
                                  AppValidations.heightValidator(value),
                            ),
                          ),
                          SizedBox(width: 15.w),
                          Expanded(
                            child: CustomInputField(
                              keyboardType: TextInputType.number,
                              title: 'Enter Your Weight'.tr(),
                              controller: weightController,
                              validator: (value) =>
                                  AppValidations.heightValidator(value),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15.h),

                      Row(
                        children: [
                          CustomDropDown(
                            label: 'Blood Type'.tr(),
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
                          SizedBox(width: 15.w),
                          CustomDropDown(
                            label: 'Gender'.tr(),

                            items: ['Male', 'Female'],
                            key: ValueKey(selectedGender ?? ""),
                            value: selectedGender,
                            onChanged: (value) {
                              setState(() => selectedGender = value);
                            },
                          ),
                        ],
                      ),

                      SizedBox(height: 15.h),
                      CustomButton(
                        onPressed: onSignUp,
                        title: 'signup.signup'.tr(),
                        titleColor: ColorManager.black,
                        bgColor: ColorManager.aquaMint,
                        width: double.infinity,
                      ),
                      SizedBox(height: 10.h),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'signup.have_account'.tr(),
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
                              'signup.login'.tr(),
                              style: textTheme.titleLarge!.copyWith(
                                fontWeight: FontWeight.bold,
                                color: ColorManager.aquaMint,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 25.h),
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

  void onSignUp() async {
    if (globalKey.currentState!.validate()) {
      await context.read<AuthCubit>().register(
        user: UserEntity(
          imgURL: "",
          allergies: "",
          dateOfBirth: "2004/01/22",
          existingConditions: "",
          address: addressController.text.trim(),
          bloodType: selectedBloodType!,
          email: emailController.text.trim(),
          fullName: nameController.text.trim(),
          gender: selectedGender!,
          height: double.parse(heightController.text.trim()),
          weight: double.parse(weightController.text.trim()),
          password: passwordController.text.trim(),
          phoneNumber: phoneNumberController.text.trim(),
        ),
      );
    }
  }
}
