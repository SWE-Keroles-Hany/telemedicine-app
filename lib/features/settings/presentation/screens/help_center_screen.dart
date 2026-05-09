import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:telemedicine/core/theme/color_manger.dart';
import 'package:telemedicine/core/theme/app_text_styles.dart';

class HelpCenterScreen extends StatelessWidget {
  static const String routeName = "HelpCenterScreen";
  const HelpCenterScreen({super.key});

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
            'Help Center',
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
                title: 'About Telemedicine App',
                content:
                    'Our Telemedicine App connects patients with qualified healthcare professionals for virtual consultations. You can book appointments, chat with doctors, and manage your health records all from your mobile device.',
              ),
              SizedBox(height: 20.h),
              _buildSection(
                title: 'How to Book an Appointment',
                content:
                    '1. Browse available doctors by specialty\n2. Select a doctor that suits your needs\n3. Choose a convenient date and time\n4. Confirm your booking\n5. Attend your virtual consultation at the scheduled time',
              ),
              SizedBox(height: 20.h),
              _buildSection(
                title: 'Managing Your Profile',
                content:
                    'You can update your personal information, change your password, and manage your preferences in the Settings section. Your health information is kept secure and private.',
              ),
              SizedBox(height: 20.h),
              _buildSection(
                title: 'Appointment History',
                content:
                    'Access all your past and upcoming appointments in the Appointments section. You can view consultation details, prescriptions, and medical notes from your doctors.',
              ),
              SizedBox(height: 20.h),
              _buildSection(
                title: 'Technical Support',
                content:
                    'If you experience any technical issues, please ensure you have a stable internet connection. For persistent problems, contact our support team through the app or email us at support@telemedicine.com',
              ),
              SizedBox(height: 20.h),
              _buildSection(
                title: 'Emergency Services',
                content:
                    'This app is not intended for medical emergencies. If you have a medical emergency, please call your local emergency services immediately or visit the nearest emergency room.',
              ),
              SizedBox(height: 20.h),
              _buildContactSection(),
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
              Icons.help_outline_rounded,
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
                  'How can we help?',
                  style: AppTextStyles.s16bold,
                ),
                SizedBox(height: 4.h),
                Text(
                  'Find answers to common questions',
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

  Widget _buildContactSection() {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: ColorManager.teal.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: ColorManager.teal),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.contact_support_rounded,
                color: ColorManager.teal,
                size: 24.sp,
              ),
              SizedBox(width: 12.w),
              Text(
                'Still need help?',
                style: AppTextStyles.s15semibold,
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Text(
            'Our support team is available 24/7 to assist you with any questions or concerns.',
            style: AppTextStyles.s14regular,
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Expanded(
                child: _buildContactButton(
                  icon: Icons.email_outlined,
                  label: 'Email Us',
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: _buildContactButton(
                  icon: Icons.chat_outlined,
                  label: 'Live Chat',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContactButton({required IconData icon, required String label}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      decoration: BoxDecoration(
        color: ColorManager.teal,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: ColorManager.white, size: 20.sp),
          SizedBox(width: 8.w),
          Text(
            label,
            style: AppTextStyles.s14medium.copyWith(
              color: ColorManager.white,
            ),
          ),
        ],
      ),
    );
  }
}
