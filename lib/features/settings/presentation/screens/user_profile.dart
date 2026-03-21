import 'package:flutter/material.dart';
import 'package:telemedicine/core/theme/color_manger.dart';

import '../widgets/health_stats_widget.dart';
import '../widgets/logout_button_widget.dart';
import '../widgets/profile_avatar_widget.dart';
import '../widgets/profile_menu_item_widget.dart';
import '../widgets/profile_menu_section_widget.dart';

class UserProfileScreen extends StatelessWidget {
  static const String routeName = "UserProfileScreen";
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorManager.backGroundColor,
          leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(Icons.arrow_back, color: ColorManager.white),
          ),
          actionsPadding: EdgeInsets.all(12),
          actions: [EditProfileIcon()],
        ),
        backgroundColor: ColorManager.backGroundColor,
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: ProfileAvatarWidget(
                  name: 'Ahmed Ali',
                  avatarUrl: '',
                  onEditTap: _onEditProfile,
                ),
              ),
              const SizedBox(height: 24),
              const HealthStatsWidget(
                bloodType: 'O+',
                weightKg: 75,
                heightCm: 180,
              ),
              const SizedBox(height: 28),
              ProfileMenuSectionWidget(
                title: 'Account',
                items: [
                  ProfileMenuItemWidget(
                    icon: Icons.person_outline_rounded,
                    title: 'Personal Information',
                    onTap: () {},
                  ),
                  ProfileMenuItemWidget(
                    icon: Icons.lock_outline_rounded,
                    title: 'Change Password',
                    onTap: () {},
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ProfileMenuSectionWidget(
                title: 'Medical',
                items: [
                  ProfileMenuItemWidget(
                    icon: Icons.medical_services_outlined,
                    title: 'My Doctors',
                    onTap: () {},
                  ),
                  ProfileMenuItemWidget(
                    icon: Icons.description_outlined,
                    title: 'Insurance Details',
                    onTap: () {},
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ProfileMenuSectionWidget(
                title: 'Preferences',
                items: [
                  ProfileMenuItemWidget(
                    icon: Icons.notifications_none_rounded,
                    title: 'Notifications',
                    onTap: () {},
                  ),
                  ProfileMenuItemWidget(
                    icon: Icons.language_rounded,
                    title: 'Language',
                    subtitle: 'English/Arabic',
                    onTap: () {},
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ProfileMenuSectionWidget(
                title: 'Support',
                items: [
                  ProfileMenuItemWidget(
                    icon: Icons.help_outline_rounded,
                    title: 'Help Center',
                    onTap: () {},
                  ),
                  ProfileMenuItemWidget(
                    icon: Icons.verified_user_outlined,
                    title: 'Privacy Policy',
                    onTap: () {},
                  ),
                ],
              ),
              const SizedBox(height: 28),
              LogoutButtonWidget(onTap: () {}),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  static void _onEditProfile() {}
}

class EditProfileIcon extends StatelessWidget {
  const EditProfileIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: ColorManager.profileCardBg,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: ColorManager.profileBorder, width: 1),
        ),
        child: const Icon(Icons.edit, color: ColorManager.white, size: 20),
      ),
    );
  }
}
