import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:telemedicine/core/theme/color_manger.dart';
import 'package:telemedicine/features/check_yourself/presentation/widgets/file_preview_item.dart';

class ChatInputField extends StatelessWidget {
  final TextEditingController controller;
  final List<File> selectedFiles;
  final VoidCallback? onSend;
  final Function(List<File>) onFilesSelected;

  const ChatInputField({
    super.key,
    required this.controller,
    required this.selectedFiles,
    required this.onSend,
    required this.onFilesSelected,
  });

  Future<void> _pickFiles(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    final List<XFile>? pickedFiles = await picker.pickMultiImage(
      imageQuality: 80,
    );

    if (pickedFiles != null) {
      final files = pickedFiles.map((xfile) => File(xfile.path)).toList();
      onFilesSelected(files);
    }
  }

  void _removeFile(int index) {
    final updatedList = List<File>.from(selectedFiles)..removeAt(index);
    onFilesSelected(updatedList);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: Colors.black.withOpacity(0.05),
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Preview files
          if (selectedFiles.isNotEmpty)
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 8.h,
              ),
              child: SizedBox(
                height: 100.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: selectedFiles.length,
                  separatorBuilder: (ctx, idx) => SizedBox(width: 8.w),
                  itemBuilder: (ctx, index) {
                    return FilePreviewItem(
                      file: selectedFiles[index],
                      onRemove: () => _removeFile(index),
                    );
                  },
                ),
              ),
            ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 8.h,
            ),
            child: Row(
              children: [
                IconButton(
                  onPressed: () => _pickFiles(context),
                  icon: Icon(
                    Icons.attach_file,
                    color: ColorManager.aquaMint,
                  ),
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      filled: true,
                      fillColor: ColorManager.lightGray,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24.r),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 12.h,
                      ),
                    ),
                    maxLines: null,
                  ),
                ),
                SizedBox(width: 8.w),
                IconButton(
                  onPressed: onSend,
                  icon: Icon(
                    Icons.send,
                    color: ColorManager.aquaMint,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
