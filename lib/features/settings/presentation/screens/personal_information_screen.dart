import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telemedicine/core/helper/validations/app_validations.dart';
import 'package:telemedicine/core/shared_models/user/entities/user_entity.dart';
import 'package:telemedicine/core/theme/color_manger.dart';
import 'package:telemedicine/core/theme/app_text_styles.dart';
import 'package:telemedicine/core/utils/ui_utils.dart';
import 'package:telemedicine/features/auth/presentation/widgets/blood_type_dropdown.dart';
import 'package:telemedicine/features/auth/presentation/widgets/custom_button.dart';
import 'package:telemedicine/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:telemedicine/features/settings/presentation/cubit/settings_states.dart';

import '../../../auth/presentation/widgets/custom_input_field.dart';

class PersonalInformationScreen extends StatefulWidget {
  final UserEntity user;
  static const String routeName = "PersonalInformationScreen";
  const PersonalInformationScreen({super.key, required this.user});

  @override
  State<PersonalInformationScreen> createState() =>
      _PersonalInformationScreenState();
}

class _PersonalInformationScreenState extends State<PersonalInformationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _dateOfBirthController = TextEditingController();

  String? selectedBloodType = "";
  String? selectedGender = "";

  @override
  void initState() {
    super.initState();
    context.read<SettingsCubit>().getUserProfile();

    _nameController.text = widget.user.fullName ?? "null";
    _phoneController.text = widget.user.phoneNumber ?? "null";
    _addressController.text = widget.user.address ?? "null";
    _emailController.text = widget.user.email ?? "null";
    DateTime dateTime = DateTime.parse(widget.user.dateOfBirth ?? "");

    _dateOfBirthController.text = DateFormat('yyyy-MM-dd').format(dateTime);

    selectedBloodType = widget.user.bloodType ?? "";
    selectedGender = widget.user.gender ?? "";
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _addressController.dispose();
    _dateOfBirthController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SettingsCubit>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.backGroundColor,
        appBar: AppBar(
          backgroundColor: ColorManager.backGroundColor,
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(Icons.arrow_back, color: ColorManager.white),
          ),
          title: Text(
            'settings.personal_information'.tr(),
            style: AppTextStyles.s18bold,
          ),
        ),
        body: BlocConsumer<SettingsCubit, SettingsState>(
          listener: (context, state) {
            if (state is UpdateProfileSuccess) {
            } else if (state is UpdateProfileError) {}
          },
          builder: (context, state) {
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // name
                    CustomInputField(
                      title: 'personal_info.full_name'.tr(),
                      controller: _nameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'personal_info.full_name'.tr();
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20.h),

                    // email
                    CustomInputField(
                      readOnly: true,
                      title: 'personal_info.email'.tr(),
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) =>
                          AppValidations.emailValidator(value),
                    ),
                    SizedBox(height: 20.h),
                    // phone
                    CustomInputField(
                      title: 'personal_info.phone'.tr(),
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      validator: (value) =>
                          AppValidations.phoneNumberValidator(value),
                    ),
                    SizedBox(height: 20.h),
                    // address
                    CustomInputField(
                      title: 'personal_info.address'.tr(),
                      controller: _addressController,
                      validator: (value) =>
                          AppValidations.addressValidator(value),
                    ),
                    SizedBox(height: 20.h),
                    // date of birth
                    CustomInputField(
                      title: 'personal_info.date_of_birth'.tr(),
                      controller: _dateOfBirthController,
                      isTabedEnabed: true,
                      validator: (value) {
                        return null;
                      },
                    ),
                    SizedBox(height: 20.h),

                    // gender
                    CustomDropDown(
                      label: 'signup.choose_gender'.tr(),

                      items: ['Male', 'Female'],
                      key: ValueKey(selectedGender),
                      value: selectedGender,
                      onChanged: (value) {
                        setState(() => selectedGender = value);
                      },
                    ),
                    SizedBox(height: 20.h),
                    // blood type
                    CustomDropDown(
                      label: 'signup.choose_blood_type'.tr(),
                      items: ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-'],
                      key: ValueKey(selectedBloodType),
                      value: selectedBloodType,
                      onChanged: (value) {
                        setState(() => selectedBloodType = value);
                      },
                    ),

                    SizedBox(height: 40.h),
                    BlocConsumer<SettingsCubit, SettingsState>(
                      builder: (context, state) {
                        if (state is UpdateProfileLoading) {
                          return Center(child: CircularProgressIndicator());
                        }
                        return CustomButton(
                          bgColor: ColorManager.bookingBottomNavActive,
                          onPressed: () async {
                            await context.read<SettingsCubit>().updateProfile(
                              userProfile: UserEntity(
                                address: _addressController.text,
                                bloodType: selectedBloodType,
                                dateOfBirth: _dateOfBirthController.text,
                                email: _emailController.text,
                                fullName: _nameController.text,
                                gender: selectedGender,
                                phoneNumber: _phoneController.text,
                              ),
                            );
                          },
                          width: double.infinity,
                          radiusNumber: 20.r,
                          title: "Save Changes",
                          titleColor: ColorManager.black,
                        );
                      },
                      listener: (context, state) {
                        if (state is UpdateProfileError) {
                          UiUtils.showMessage(message: state.message);
                        }

                        if (state is UpdateProfileSuccess) {
                          Navigator.pop(context);
                          cubit.getUserProfile();
                        }
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
