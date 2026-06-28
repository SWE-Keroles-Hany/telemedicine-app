import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:telemedicine/core/theme/color_manger.dart';
import 'package:toastification/toastification.dart';

class UiUtils {
  static void showMessage({
    required String message,
    bool isErrorMessage = false,
    bool isSuccessMessage = false,
    // bool isSuccessMessage = false,
  }) {
    toastification.show(
      autoCloseDuration: const Duration(seconds: 3),
      title: Text(
        message,
        style: TextStyle(color: ColorManager.white, fontSize: 14),
      ),
      // progressBarTheme: true,
      alignment: Alignment.topRight,
      direction: TextDirection.ltr,
      animationDuration: const Duration(milliseconds: 300),
      icon: Icon(
        isErrorMessage ? Icons.error : Icons.check_circle,
        size: 25,
        color: isErrorMessage ? ColorManager.yellow : ColorManager.white,
      ),
      showIcon: true,
      // primaryColor: Colors.amberAccent,
      backgroundColor: isErrorMessage ? ColorManager.red : ColorManager.green,
      // foregroundColor: Colors.black,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      borderRadius: BorderRadius.circular(12),
      boxShadow: const [
        BoxShadow(
          color: Color(0x07000000),
          blurRadius: 16,
          offset: Offset(0, 16),
          spreadRadius: 0,
        ),
      ],
      // showProgressBar: true,
      closeButton: ToastCloseButton(
        showType: CloseButtonShowType.onHover,
        buttonBuilder: (context, onClose) {
          return OutlinedButton.icon(
            onPressed: onClose,
            icon: const Icon(Icons.close, size: 20),
            label: const Text('Close'),
          );
        },
      ),
      closeOnClick: false,
      pauseOnHover: true,
      dragToClose: true,
      // applyBlurEffect: true,
    );
  }

  static Future<dynamic> showLoadingIndicator(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return PopScope(
          canPop: false,
          child: SizedBox(
            child: AlertDialog(
              backgroundColor: Colors.transparent,
              content: Center(
                child: CircularProgressIndicator(
                  color: ColorManager.primary,

                  // value: 5,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  static void hideLoading(BuildContext context) => Navigator.of(context).pop();

  static void noInternetConnection() {
    Get.bottomSheet(
      PopScope(
        canPop: false,
        child: Container(
          height: 220.h,
          padding: EdgeInsets.all(16.w),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(Icons.wifi_off, size: 48, color: Colors.red),
              SizedBox(height: 12.h),
              const Center(
                child: Text(
                  'No Internet Connection',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 8.h),
              const Text(
                'Please check your internet connection',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
