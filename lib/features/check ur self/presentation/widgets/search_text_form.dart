// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:telemedicine/core/theme/app_theme.dart';

class SearchTextForm extends StatelessWidget {
  SearchTextForm({
    super.key,
    required this.controller,
    required this.searchHint,
    required this.onSearch,
  });
  final TextEditingController controller;
  final String searchHint;
  final Function(String)? onSearch;
  List<BoxShadow>? boxShadow = [
    BoxShadow(
      color: AppTheme.black.withAlpha((0.15 * 255).toInt()), // 0.15 opacity
      spreadRadius: 1,
      blurRadius: 12,
      offset: Offset(0, 6),
    ),
    BoxShadow(
      color: AppTheme.black.withAlpha((0.05 * 255).toInt()), // 0.05 opacity
      spreadRadius: 1,
      blurRadius: 4,
      offset: Offset(0, 2),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      decoration: BoxDecoration(boxShadow: boxShadow),
      child: TextField(
        style: TextStyle(color: AppTheme.white),
        onChanged: onSearch,
        controller: controller,
        cursorColor: AppTheme.white,
        cursorRadius: Radius.circular(2.r),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 14.h),
          fillColor: AppTheme.midnightTeal,
          filled: true,
          hint: Text(
            searchHint,
            style: textTheme.titleMedium!.copyWith(color: AppTheme.blueGray),
          ),
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 8.w, right: 6.w),
            child: Icon(Icons.search, size: 30.r, color: AppTheme.blueGray),
          ),
          border: border(),
          focusedBorder: border(),
        ),
      ),
    );
  }

  OutlineInputBorder border() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: AppTheme.blueGray, width: 2),
      borderRadius: BorderRadius.circular(18.r),
    );
  }
}
