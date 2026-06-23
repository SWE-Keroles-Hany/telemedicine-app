import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:telemedicine/core/theme/color_manger.dart';

class ImageViewerScreen extends StatelessWidget {
  const ImageViewerScreen({
    required this.imageUrl,
    required this.title,
    super.key,
  });

  final String imageUrl;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: ColorManager.white,
              ),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: ColorManager.white),
      ),
      body: Center(
        child: InteractiveViewer(
          minScale: 0.5,
          maxScale: 4.0,
          child: Image.network(
            imageUrl,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.broken_image,
                      size: 64.sp,
                      color: ColorManager.mediumGray,
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'Failed to load image',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: ColorManager.white,
                          ),
                    ),
                  ],
                ),
              );
            },
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(
                child: CircularProgressIndicator(
                  color: ColorManager.white,
                  strokeWidth: 3,
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
