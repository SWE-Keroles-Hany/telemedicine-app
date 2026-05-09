import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:telemedicine/core/theme/color_manger.dart';
import 'package:telemedicine/core/theme/app_text_styles.dart';
import 'package:toastification/toastification.dart';

class LanguageScreen extends StatefulWidget {
  static const String routeName = "LanguageScreen";
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String _selectedLanguage = 'English';

  final List<Map<String, dynamic>> _languages = [
    {
      'name': 'English',
      'code': 'en',
      'flag': '🇺🇸',
    },
    {
      'name': 'Arabic',
      'code': 'ar',
      'flag': '��',
    },
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _selectedLanguage = context.locale.languageCode == 'ar' ? 'Arabic' : 'English';
      });
    });
  }

  void _selectLanguage(String language) {
    setState(() {
      _selectedLanguage = language;
    });
  }

  void _confirmLanguage() {
    final selectedLang = _languages.firstWhere(
      (lang) => lang['name'] == _selectedLanguage,
    );
    context.setLocale(Locale(selectedLang['code']));
    toastification.show(
      context: context,
      type: ToastificationType.success,
      style: ToastificationStyle.fillColored,
      title: Text('language_screen.language_changed'.tr()),
      description: Text('language_screen.language_changed_message'.tr() + _selectedLanguage),
      autoCloseDuration: Duration(seconds: 3),
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.backGroundColor,
        appBar: AppBar(
          backgroundColor: ColorManager.backGroundColor,
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(Icons.arrow_back, color: ColorManager.white),
          ),
          title: Text(
            'language_screen.title'.tr(),
            style: AppTextStyles.s18bold,
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                itemCount: _languages.length,
                itemBuilder: (context, index) {
                  final language = _languages[index];
                  final isSelected = _selectedLanguage == language['name'];
                  return Padding(
                    padding: EdgeInsets.only(bottom: 12.h),
                    child: GestureDetector(
                      onTap: () => _selectLanguage(language['name']),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 16.h,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? ColorManager.teal.withOpacity(0.2)
                              : ColorManager.profileCardBg,
                          borderRadius: BorderRadius.circular(12.r),
                          border: Border.all(
                            color: isSelected
                                ? ColorManager.teal
                                : ColorManager.profileBorder,
                            width: isSelected ? 2 : 1,
                          ),
                        ),
                        child: Row(
                          children: [
                            Text(
                              language['flag'],
                              style: TextStyle(fontSize: 28.sp),
                            ),
                            SizedBox(width: 16.w),
                            Expanded(
                              child: Text(
                                language['name'],
                                style: AppTextStyles.s16medium.copyWith(
                                  color: isSelected
                                      ? ColorManager.teal
                                      : ColorManager.white,
                                ),
                              ),
                            ),
                            if (isSelected)
                              Icon(
                                Icons.check_circle,
                                color: ColorManager.teal,
                                size: 24.sp,
                              ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: SizedBox(
                width: double.infinity,
                height: 50.h,
                child: ElevatedButton(
                  onPressed: _confirmLanguage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorManager.teal,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  child: Text(
                    'language_screen.confirm'.tr(),
                    style: AppTextStyles.s15bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
