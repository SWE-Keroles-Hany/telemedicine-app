import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:telemedicine/core/theme/color_manger.dart';
import 'package:telemedicine/core/theme/app_text_styles.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  static const String routeName = "PrivacyPolicyScreen";
  const PrivacyPolicyScreen({super.key});

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
            'Privacy Policy',
            style: AppTextStyles.s18bold,
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              SizedBox(height: 24.h),
              _buildSection(
                title: 'Information We Collect',
                content:
                    'We collect information you provide directly to us, including:\n\n• Personal information (name, email, phone number)\n• Medical history and health information\n• Payment information\n• Appointment history\n• Usage data and preferences',
              ),
              SizedBox(height: 20.h),
              _buildSection(
                title: 'How We Use Your Information',
                content:
                    'We use your information to:\n\n• Provide and improve our telemedicine services\n• Schedule and manage your appointments\n• Facilitate communication with healthcare providers\n• Process payments\n• Send important notifications\n• Ensure the security of our platform',
              ),
              SizedBox(height: 20.h),
              _buildSection(
                title: 'Data Security',
                content:
                    'We implement industry-standard security measures to protect your personal and medical information:\n\n• End-to-end encryption for all communications\n• Secure servers with regular security audits\n• Limited access to sensitive data\n• Compliance with healthcare data protection regulations\n• Regular security updates and monitoring',
              ),
              SizedBox(height: 20.h),
              _buildSection(
                title: 'Sharing Your Information',
                content:
                    'We may share your information with:\n\n• Healthcare providers you connect with\n• Payment processors for transactions\n• Legal authorities when required by law\n• We never sell your personal or medical information to third parties',
              ),
              SizedBox(height: 20.h),
              _buildSection(
                title: 'Your Rights',
                content:
                    'You have the right to:\n\n• Access your personal information\n• Update or correct your information\n• Delete your account and data\n• Opt-out of non-essential communications\n• Request a copy of your data',
              ),
              SizedBox(height: 20.h),
              _buildSection(
                title: 'Cookies and Tracking',
                content:
                    'We use cookies and similar technologies to:\n\n• Remember your preferences\n• Analyze app usage\n• Improve our services\n• You can manage cookie settings in your device preferences',
              ),
              SizedBox(height: 20.h),
              _buildSection(
                title: 'Children\'s Privacy',
                content:
                    'Our services are not intended for children under 18. We do not knowingly collect personal information from children without parental consent.',
              ),
              SizedBox(height: 20.h),
              _buildSection(
                title: 'Changes to This Policy',
                content:
                    'We may update this privacy policy from time to time. We will notify you of any significant changes by posting the new policy on this page and updating the "Last Updated" date.',
              ),
              SizedBox(height: 20.h),
              _buildSection(
                title: 'Contact Us',
                content:
                    'If you have questions about this privacy policy or your personal information, please contact us at:\n\nEmail: privacy@telemedicine.com\nPhone: +1 (555) 123-4567',
              ),
              SizedBox(height: 20.h),
              _buildFooter(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: ColorManager.profileCardBg,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: ColorManager.profileBorder),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: ColorManager.teal.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Icon(
              Icons.verified_user_outlined,
              color: ColorManager.teal,
              size: 28.sp,
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your Privacy Matters',
                  style: AppTextStyles.s16bold,
                ),
                SizedBox(height: 4.h),
                Text(
                  'Last Updated: January 2025',
                  style: AppTextStyles.s13regular,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection({required String title, required String content}) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: ColorManager.profileCardBg,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: ColorManager.profileBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyles.s16bold,
          ),
          SizedBox(height: 12.h),
          Text(
            content,
            style: AppTextStyles.s14regular,
          ),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: ColorManager.teal.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: ColorManager.teal),
      ),
      child: Column(
        children: [
          Icon(
            Icons.shield_rounded,
            color: ColorManager.teal,
            size: 32.sp,
          ),
          SizedBox(height: 12.h),
          Text(
            'We are committed to protecting your privacy',
            style: AppTextStyles.s14medium,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8.h),
          Text(
            'Your health information is safe with us',
            style: AppTextStyles.s13regular,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
