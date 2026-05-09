import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:telemedicine/core/shared_models/user/entities/user_entity.dart';
import 'package:telemedicine/core/theme/color_manger.dart';

import 'personal_information_screen.dart';
import 'change_password_screen.dart';
import 'language_screen.dart';
import 'help_center_screen.dart';
import 'privacy_policy_screen.dart';
import '../widgets/health_stats_widget.dart';
import '../widgets/logout_button_widget.dart';
import '../widgets/profile_avatar_widget.dart';
import '../widgets/profile_menu_item_widget.dart';
import '../widgets/profile_menu_section_widget.dart';
import '../cubit/settings_cubit.dart';
import '../cubit/settings_states.dart';

class UserProfileScreen extends StatefulWidget {
  static const String routeName = "UserProfileScreen";
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  UserEntity user = UserEntity();
  @override
  void initState() {
    super.initState();
    context.read<SettingsCubit>().getUserProfile();
  }

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
        ),
        backgroundColor: ColorManager.backGroundColor,
        body: BlocBuilder<SettingsCubit, SettingsState>(
          builder: (context, state) {
            if (state is GetUserProfileSuccess) {
              user.dateOfBirth = state.userProfile.dateOfBirth;
              user.fullName = state.userProfile.fullName;
              user.email = state.userProfile.email;
              user.phoneNumber = state.userProfile.phoneNumber;
              user.imgURL = state.userProfile.imgURL;
              user.address = state.userProfile.address;
              user.bloodType = state.userProfile.bloodType;
              user.gender = state.userProfile.gender;
            }

            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: ProfileAvatarWidget(
                      name: user.fullName ?? "0",
                      avatarUrl: user.imgURL,
                      onEditTap: () {},
                    ),
                  ),
                  const SizedBox(height: 24),
                  HealthStatsWidget(
                    bloodType: user.bloodType ?? "0",
                    weightKg: 75,
                    heightCm: 180,
                  ),
                  const SizedBox(height: 28),
                  ProfileMenuSectionWidget(
                    title: 'settings.account'.tr(),
                    items: [
                      ProfileMenuItemWidget(
                        icon: Icons.person_outline_rounded,
                        title: 'settings.personal_information'.tr(),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  PersonalInformationScreen(user: user),
                            ),
                          );
                        },
                      ),
                      ProfileMenuItemWidget(
                        icon: Icons.lock_outline_rounded,
                        title: 'settings.change_password'.tr(),
                        onTap: () {
                          Navigator.of(
                            context,
                          ).pushNamed(ChangePasswordScreen.routeName);
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ProfileMenuSectionWidget(
                    title: 'settings.preferences'.tr(),
                    items: [
                      ProfileMenuItemWidget(
                        icon: Icons.notifications_none_rounded,
                        title: 'settings.notifications'.tr(),
                        onTap: () {},
                      ),
                      ProfileMenuItemWidget(
                        icon: Icons.language_rounded,
                        title: 'settings.language'.tr(),
                        onTap: () {
                          Navigator.of(
                            context,
                          ).pushNamed(LanguageScreen.routeName);
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ProfileMenuSectionWidget(
                    title: 'settings.support'.tr(),
                    items: [
                      ProfileMenuItemWidget(
                        icon: Icons.help_outline_rounded,
                        title: 'settings.help_center'.tr(),
                        onTap: () {
                          Navigator.of(
                            context,
                          ).pushNamed(HelpCenterScreen.routeName);
                        },
                      ),
                      ProfileMenuItemWidget(
                        icon: Icons.verified_user_outlined,
                        title: 'settings.privacy_policy'.tr(),
                        onTap: () {
                          Navigator.of(
                            context,
                          ).pushNamed(PrivacyPolicyScreen.routeName);
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 28),
                  LogoutButtonWidget(onTap: () {}),
                  const SizedBox(height: 32),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
