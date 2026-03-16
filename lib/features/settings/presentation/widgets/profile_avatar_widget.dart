import 'package:flutter/material.dart';
import 'package:telemedicine/core/theme/color_manger.dart';

import '../../../../core/theme/app_text_styles.dart';

class ProfileAvatarWidget extends StatelessWidget {
  final String name;
  final String? avatarUrl;
  final VoidCallback? onEditTap;

  const ProfileAvatarWidget({
    super.key,
    required this.name,
    this.avatarUrl,
    this.onEditTap,
  });

  String get _initials {
    final parts = name.trim().split(' ');
    if (parts.length >= 2) return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    if (parts[0].isNotEmpty) return parts[0][0].toUpperCase();
    return '?';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _ProfileAvatarCircle(initials: _initials, avatarUrl: avatarUrl),
        const SizedBox(height: 12),
        Text(name, style: AppTextStyles.s20bold),
        const SizedBox(height: 4),
        GestureDetector(
          onTap: onEditTap,
          child: Text('View/Edit Profile', style: AppTextStyles.s13teal),
        ),
      ],
    );
  }
}

class _ProfileAvatarCircle extends StatelessWidget {
  final String initials;
  final String? avatarUrl;

  const _ProfileAvatarCircle({required this.initials, this.avatarUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 88,
      height: 88,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: ColorManager.avatarBg,
        border: Border.all(color: ColorManager.avatarRing, width: 2.5),
      ),
      child: _buildContent(),
    );
  }

  Widget _buildContent() {
    final hasImage = avatarUrl != null && avatarUrl!.isNotEmpty;
    if (hasImage) {
      return ClipOval(
        child: Image.network(
          avatarUrl!,
          fit: BoxFit.cover,
          errorBuilder: (_, _, _) => _ProfileAvatarInitials(initials: initials),
        ),
      );
    }
    return _ProfileAvatarInitials(initials: initials);
  }
}

class _ProfileAvatarInitials extends StatelessWidget {
  final String initials;

  const _ProfileAvatarInitials({required this.initials});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        initials,
        style: AppTextStyles.s22bold.copyWith(color: ColorManager.teal),
      ),
    );
  }
}
