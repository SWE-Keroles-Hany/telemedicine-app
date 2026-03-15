import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:telemedicine/core/theme/color_manger.dart';

class CustomInputField extends StatefulWidget {
  const CustomInputField({
    super.key,
    this.isPasswordField = false,
    required this.title,
    required this.controller,
    required this.validator,
    this.maxLines = 1,
  });
  final TextEditingController controller;
  final bool isPasswordField;
  final String title;
  final String? Function(String?)? validator;
  final int maxLines;
  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return TextFormField(
      // autofocus: true,
      canRequestFocus: true,
      maxLines: widget.maxLines,
      focusNode: FocusNode(descendantsAreTraversable: true),
      style: TextStyle(color: ColorManger.white),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: widget.validator,
      controller: widget.controller,
      obscureText: showPassword,
      decoration: InputDecoration(
        errorStyle: textTheme.labelMedium!.copyWith(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: ColorManger.red,
        ),
        suffixIcon: widget.isPasswordField
            ? IconButton(
                icon: Icon(
                  showPassword ? Icons.visibility_off : Icons.visibility,
                  color: ColorManger.red,
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
          style: textTheme.titleMedium!.copyWith(color: ColorManger.mediumGray),
        ),
        filled: true,
        fillColor: ColorManger.darkTealGreen,
        border: border(),
        focusedBorder: focusedBorder(),
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

  OutlineInputBorder focusedBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: ColorManger.aquaMint, width: 1.5),
      borderRadius: BorderRadius.circular(8),
    );
  }

  OutlineInputBorder errorBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: ColorManger.red, width: 1.5),
      borderRadius: BorderRadius.circular(8),
    );
  }
}
