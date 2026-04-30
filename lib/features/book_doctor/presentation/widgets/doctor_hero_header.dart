import 'package:flutter/material.dart';
import 'package:telemedicine/core/constants/constants_assets.dart';

class DoctorHeroHeader extends StatelessWidget {
  final String imageAsset;
  final bool isFavorite;
  final VoidCallback onFavoriteToggle;

  const DoctorHeroHeader({
    super.key,
    required this.imageAsset,
    required this.isFavorite,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: Center(
        child: Image.network(
          imageAsset,
          // height: 250.h,
          fit: BoxFit.cover,
          errorBuilder: (_, _, _) =>
              Image.network(ConstantAssetImages.defaultDoctorImage),
        ),
      ),
    );
  }
}
