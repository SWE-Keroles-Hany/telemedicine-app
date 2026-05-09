import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:telemedicine/core/theme/color_manger.dart';

class CustomInputField extends StatefulWidget {
  const CustomInputField({
    this.keyboardType,
    super.key,
    this.isPasswordField = false,
    this.isTabedEnabed = false,

    required this.title,
    required this.controller,
    required this.validator,
    this.maxLines = 1,
  });
  final TextEditingController controller;
  final bool isPasswordField;
  final bool isTabedEnabed;

  final String title;
  final String? Function(String?)? validator;
  final int maxLines;
  final TextInputType? keyboardType;
  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return TextFormField(
      onTap: () => pickDate(context, widget.isTabedEnabed),
      keyboardType: widget.keyboardType,
      // autofocus:keyboardTypez true,
      canRequestFocus: true,
      maxLines: widget.maxLines,
      focusNode: FocusNode(descendantsAreTraversable: true),
      style: TextStyle(color: ColorManager.white),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: widget.validator,
      controller: widget.controller,
      obscureText: showPassword,
      decoration: InputDecoration(
        errorStyle: textTheme.labelMedium!.copyWith(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: ColorManager.red,
        ),
        suffixIcon: widget.isPasswordField
            ? IconButton(
                icon: Icon(
                  showPassword ? Icons.visibility_off : Icons.visibility,
                  color: ColorManager.red,
                ),
                onPressed: () {
                  setState(() {
                    showPassword = !showPassword;
                  });
                },
              )
            : null,
        // hint: Text(
        //   widget.title,
        //   style: textTheme.titleMedium!.copyWith(
        //     color: ColorManager.mediumGray,
        //   ),
        // ),
        label: Text(
          widget.title,
          style: textTheme.titleMedium!.copyWith(
            color: ColorManager.mediumGray,
          ),
        ),
        filled: true,
        fillColor: ColorManager.darkTealGreen,
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
      borderSide: BorderSide(color: ColorManager.aquaMint, width: 1.5),
      borderRadius: BorderRadius.circular(8),
    );
  }

  OutlineInputBorder errorBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: ColorManager.red, width: 1.5),
      borderRadius: BorderRadius.circular(8),
    );
  }

  Future<void> pickDate(BuildContext context, bool isTabedEnabled) async {
    if (!isTabedEnabled) {
      return;
    }
    DateTime now = DateTime.now();
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(1900),
      lastDate: now,
    );
    if (pickedDate != null) {
      String formattedDate =
          "${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}";
      widget.controller.text = formattedDate;
    }
  }
}
