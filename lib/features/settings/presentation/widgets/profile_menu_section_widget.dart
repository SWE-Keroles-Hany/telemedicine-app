import 'package:flutter/material.dart';

import '../../../../core/theme/app_text_styles.dart';

class ProfileMenuSectionWidget extends StatelessWidget {
  final String title;
  final List<Widget> items;

  const ProfileMenuSectionWidget({
    super.key,
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionTitleWidget(title: title),
        const SizedBox(height: 12),
        _SectionItemsWidget(items: items),
      ],
    );
  }
}

class _SectionTitleWidget extends StatelessWidget {
  final String title;

  const _SectionTitleWidget({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(title, style: AppTextStyles.s17bold);
  }
}

class _SectionItemsWidget extends StatelessWidget {
  final List<Widget> items;

  const _SectionItemsWidget({required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: items
          .map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: item,
            ),
          )
          .toList(),
    );
  }
}
