import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:telemedicine/core/theme/color_manger.dart';

class FilePreviewItem extends StatelessWidget {
  final File file;
  final VoidCallback onRemove;

  const FilePreviewItem({
    super.key,
    required this.file,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    final isImage = file.path.toLowerCase().endsWith('.jpg') ||
        file.path.toLowerCase().endsWith('.jpeg') ||
        file.path.toLowerCase().endsWith('.png');

    return Stack(
      children: [
        Container(
          width: 80.w,
          height: 80.h,
          margin: EdgeInsets.only(right: 8.w),
          decoration: BoxDecoration(
            color: ColorManager.bookingCardBg,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(
              color: ColorManager.bookingBorder,
            ),
          ),
          child: isImage
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: Image.file(
                    file,
                    fit: BoxFit.cover,
                  ),
                )
              : Center(
                  child: Icon(
                    Icons.insert_drive_file,
                    color: ColorManager.bookingIconDefault,
                    size: 32.sp,
                  ),
                ),
        ),
        Positioned(
          top: 4,
          right: 4,
          child: GestureDetector(
            onTap: onRemove,
            child: Container(
              padding: EdgeInsets.all(4.w),
              decoration: BoxDecoration(
                color: ColorManager.red,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.close,
                color: ColorManager.white,
                size: 14.sp,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
