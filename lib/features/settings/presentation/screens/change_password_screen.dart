import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:telemedicine/core/helper/validations/app_validations.dart';
import 'package:telemedicine/core/theme/color_manger.dart';
import 'package:telemedicine/core/theme/app_text_styles.dart';
import 'package:telemedicine/core/utils/ui_utils.dart';
import 'package:telemedicine/features/auth/presentation/widgets/custom_button.dart';
import 'package:telemedicine/features/auth/presentation/widgets/custom_input_field.dart';
import 'package:telemedicine/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:telemedicine/features/settings/presentation/cubit/settings_states.dart';
import 'package:toastification/toastification.dart';

class ChangePasswordScreen extends StatefulWidget {
  static const String routeName = "ChangePasswordScreen";
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SettingsCubit>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.backGroundColor,
        appBar: AppBar(
          foregroundColor: ColorManager.white,
          backgroundColor: ColorManager.backGroundColor,

          title: Text(
            'settings.change_password'.tr(),
            style: AppTextStyles.s18bold,
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'change_password.enter_current_password'.tr(),
                  style: AppTextStyles.s14regular,
                ),
                SizedBox(height: 30.h),
                CustomInputField(
                  title: 'change_password.current_password'.tr(),
                  controller: _currentPasswordController,
                  isPasswordField: true,

                  validator: (value) =>
                      AppValidations.passwordValidator(value: value),
                ),
                SizedBox(height: 20.h),
                CustomInputField(
                  title: 'change_password.new_password'.tr(),
                  controller: _newPasswordController,
                  isPasswordField: true,

                  validator: (value) =>
                      AppValidations.passwordValidator(value: value),
                ),
                SizedBox(height: 20.h),
                CustomInputField(
                  title: 'change_password.new_password'.tr(),
                  controller: _confirmPasswordController,
                  isPasswordField: true,

                  validator: (value) =>
                      AppValidations.passwordValidator(value: value),
                ),
                SizedBox(height: 40.h),
                BlocListener<SettingsCubit, SettingsState>(
                  listener: (context, state) {
                    if (state is ChangePasswordLoading) {
                      UiUtils.showLoadingIndicator(context);
                    } else if (state is ChangePasswordSuccess) {
                      UiUtils.hideLoading(context);
                      UiUtils.showMessage(
                        message: 'change_password.password_changed_successfully'
                            .tr(),
                      );
                    } else if (state is ChangePasswordError) {
                      UiUtils.hideLoading(context);
                      UiUtils.showMessage(message: state.message);
                    }
                  },
                  child: CustomButton(
                    titleColor: ColorManager.black,
                    width: double.infinity,
                    radiusNumber: 20.r,
                    bgColor: ColorManager.teal,
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await cubit.changePassword(
                          currentPassword: _currentPasswordController.text,
                          newPassword: _newPasswordController.text,
                          confirmPassword: _confirmPasswordController.text,
                        );
                      }
                    },
                    title: 'change_password.change_password'.tr(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
