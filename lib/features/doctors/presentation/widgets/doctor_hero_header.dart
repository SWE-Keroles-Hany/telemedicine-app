import 'package:flutter/material.dart';
import 'package:telemedicine/core/theme/color_manger.dart';

class DoctorHeroHeader extends StatelessWidget {
  final String imageAsset;
  final bool isFavorite;
  final VoidCallback onBack;
  final VoidCallback onFavoriteToggle;

  const DoctorHeroHeader({
    super.key,
    required this.imageAsset,
    required this.isFavorite,
    required this.onBack,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF1A2E3A), ColorManager.background],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Center(
            child: Image.asset(
              imageAsset,
              height: 280,
              fit: BoxFit.contain,
              errorBuilder: (_, _, _) =>
                  const Icon(Icons.person, size: 160, color: ColorManager.teal),
            ),
          ),
          Positioned(
            top: 16,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _CircleIconButton(
                  icon: Icons.arrow_back_ios_new_rounded,
                  onTap: onBack,
                ),
                _CircleIconButton(
                  icon: isFavorite
                      ? Icons.favorite_rounded
                      : Icons.favorite_border_rounded,
                  onTap: onFavoriteToggle,
                  iconColor: isFavorite
                      ? ColorManager.favorite
                      : ColorManager.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CircleIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final Color? iconColor;
  const _CircleIconButton({
    required this.icon,
    required this.onTap,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: ColorManager.surface.withOpacity(0.85),
          shape: BoxShape.circle,
          border: Border.all(color: ColorManager.borderLighter),
        ),
        child: Icon(icon, color: iconColor ?? ColorManager.white, size: 18),
      ),
    );
  }
}
