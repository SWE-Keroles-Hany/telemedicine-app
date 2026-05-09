import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:telemedicine/core/theme/color_manger.dart';
import 'package:telemedicine/core/theme/app_text_styles.dart';
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

  bool _obscureCurrentPassword = true;
  bool _obscureNewPassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _changePassword() {
    if (_formKey.currentState!.validate()) {
      toastification.show(
        context: context,
        type: ToastificationType.success,
        style: ToastificationStyle.fillColored,
        title: Text('common.success'.tr()),
        description: Text('change_password.success_message'.tr()),
        autoCloseDuration: Duration(seconds: 3),
      );
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
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
            'settings.change_password'.tr(),
            style: AppTextStyles.s18bold,
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'change_password.enter_current_password'.tr(),
                  style: AppTextStyles.s14regular,
                ),
                SizedBox(height: 30.h),
                _buildPasswordField(
                  label: 'change_password.current_password'.tr(),
                  controller: _currentPasswordController,
                  obscureText: _obscureCurrentPassword,
                  onToggle: () {
                    setState(() {
                      _obscureCurrentPassword = !_obscureCurrentPassword;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'change_password.please_enter_current_password'.tr();
                    }
                    if (value.length < 6) {
                      return 'change_password.password_must_be_6_chars'.tr();
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.h),
                _buildPasswordField(
                  label: 'change_password.new_password'.tr(),
                  controller: _newPasswordController,
                  obscureText: _obscureNewPassword,
                  onToggle: () {
                    setState(() {
                      _obscureNewPassword = !_obscureNewPassword;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'change_password.please_enter_new_password'.tr();
                    }
                    if (value.length < 6) {
                      return 'change_password.password_must_be_6_chars'.tr();
                    }
                    if (value == _currentPasswordController.text) {
                      return 'change_password.new_password_different'.tr();
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.h),
                _buildPasswordField(
                  label: 'change_password.confirm_new_password'.tr(),
                  controller: _confirmPasswordController,
                  obscureText: _obscureConfirmPassword,
                  onToggle: () {
                    setState(() {
                      _obscureConfirmPassword = !_obscureConfirmPassword;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'change_password.please_confirm_password'.tr();
                    }
                    if (value != _newPasswordController.text) {
                      return 'change_password.passwords_do_not_match'.tr();
                    }
                    return null;
                  },
                ),
                SizedBox(height: 40.h),
                _buildChangeButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordField({
    required String label,
    required TextEditingController controller,
    required bool obscureText,
    required VoidCallback onToggle,
    required String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.s14medium,
        ),
        SizedBox(height: 8.h),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          validator: validator,
          style: AppTextStyles.s15regular,
          decoration: InputDecoration(
            filled: true,
            fillColor: ColorManager.profileCardBg,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: ColorManager.profileBorder),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: ColorManager.profileBorder),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.r),
              borderSide: BorderSide(color: ColorManager.teal),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 14.h,
            ),
            suffixIcon: IconButton(
              onPressed: onToggle,
              icon: Icon(
                obscureText ? Icons.visibility_off : Icons.visibility,
                color: ColorManager.textSecondary,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildChangeButton() {
    return SizedBox(
      width: double.infinity,
      height: 50.h,
      child: ElevatedButton(
        onPressed: _changePassword,
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorManager.teal,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
        child: Text(
          'change_password.change_password'.tr(),
          style: AppTextStyles.s15bold,
        ),
      ),
    );
  }
}
