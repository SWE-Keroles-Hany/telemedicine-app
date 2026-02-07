import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:telemedicine/core/theme/app_theme.dart';
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
        style: TextStyle(color: AppTheme.white, fontSize: 18.sp),
      ),
      // progressBarTheme: true,
      alignment: Alignment.topRight,
      direction: TextDirection.ltr,
      animationDuration: const Duration(milliseconds: 300),
      icon: Icon(
        isErrorMessage ? Icons.error : Icons.check_circle,
        size: 28,
        color: isErrorMessage ? AppTheme.yellow : AppTheme.white,
      ),
      showIcon: true,
      // primaryColor: Colors.amberAccent,
      backgroundColor: isErrorMessage ? AppTheme.red : AppTheme.black,
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

  // static Widget showLoaidng() {
  //   return Card(
  //     elevation: 5.0,
  //     child: Padding(
  //       padding: const EdgeInsets.all(8.0),
  //       child: CircularWidgetLoading(
  //         // appearingDuration: Duration(seconds: 5),
  //         dotColor: AppTheme.w,
  //         dotCount: 100,
  //         animating: true,
  //         sizeCurve: Curves.ease,

  //         loading: true,
  //         child: Padding(
  //           padding: EdgeInsetsGeometry.all(20),
  //           child: ListTile(leading: Text('Counter')),
  //         ),
  //       ),
  //     ),
  //   );
  // }

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
                  color: AppTheme.aquaMint,

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
}
