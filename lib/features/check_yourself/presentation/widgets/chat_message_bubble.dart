import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:telemedicine/core/theme/color_manger.dart';

class ChatMessageBubble extends StatelessWidget {
  final String text;
  final bool isUser;
  final List<File>? files;

  const ChatMessageBubble({
    super.key,
    required this.text,
    required this.isUser,
    this.files,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 6.h),
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 12.h,
        ),
        decoration: BoxDecoration(
          color: isUser
              ? ColorManager.aquaMint
              : ColorManager.lightGray,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.r),
            topRight: Radius.circular(16.r),
            bottomLeft: isUser ? Radius.circular(16.r) : Radius.zero,
            bottomRight: isUser ? Radius.zero : Radius.circular(16.r),
          ),
        ),
        constraints: BoxConstraints(
          maxWidth: 0.75.sw,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (files != null && files!.isNotEmpty)
              Padding(
                padding: EdgeInsets.only(bottom: 8.h),
                child: Wrap(
                  spacing: 8.w,
                  runSpacing: 8.h,
                  children: files!.map((file) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(8.r),
                      child: Image.file(
                        file,
                        width: 150.w,
                        height: 150.h,
                        fit: BoxFit.cover,
                      ),
                    );
                  }).toList(),
                ),
              ),
            if (text.isNotEmpty)
              Text(
                text,
                style: textTheme.bodyMedium?.copyWith(
                  color: isUser ? ColorManager.white : ColorManager.black,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
