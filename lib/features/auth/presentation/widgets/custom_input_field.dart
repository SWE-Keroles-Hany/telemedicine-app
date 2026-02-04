import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:telemedicine/core/theme/app_theme.dart';

class CustomInputField extends StatefulWidget {
  const CustomInputField({
    super.key,
    this.isPasswordField = false,
    required this.title,
    required this.controller,
    required this.validator,
  });
  final TextEditingController controller;
  final bool isPasswordField;
  final String title;
  final String? Function(String?)? validator;

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return TextFormField(
      style: TextStyle(color: AppTheme.white),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: widget.validator,
      controller: widget.controller,
      obscureText: showPassword,
      decoration: InputDecoration(
        errorStyle: textTheme.labelMedium!.copyWith(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: AppTheme.red,
        ),
        suffixIcon: widget.isPasswordField
            ? IconButton(
                icon: Icon(
                  showPassword ? Icons.visibility_off : Icons.visibility,
                  color: AppTheme.red,
                ),
                onPressed: () {
                  setState(() {
                    showPassword = !showPassword;
                  });
                },
              )
            : null,
        hint: Text(
          widget.title,
          style: textTheme.titleMedium!.copyWith(color: AppTheme.mediumGray),
        ),
        filled: true,
        fillColor: AppTheme.darkTealGreen,
        border: border(),
        enabled: true,
        enabledBorder: border(),
        errorBorder: errorBorder(),
      ),
    );
  }

  OutlineInputBorder border() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey, width: 1.5),
      borderRadius: BorderRadius.circular(8),
    );
  }

  OutlineInputBorder errorBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: AppTheme.red, width: 1.5),
      borderRadius: BorderRadius.circular(8),
    );
  }
}
