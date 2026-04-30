import 'package:flutter/material.dart';
import 'package:telemedicine/core/theme/app_text_styles.dart';

class AboutDoctorSection extends StatefulWidget {
  final String text;
  const AboutDoctorSection({super.key, required this.text});

  @override
  State<AboutDoctorSection> createState() => _AboutDoctorSectionState();
}

class _AboutDoctorSectionState extends State<AboutDoctorSection> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('About Doctor', style: AppTextStyles.s17bold),
          const SizedBox(height: 10),
          AnimatedCrossFade(
            duration: const Duration(milliseconds: 200),
            crossFadeState: _expanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            firstChild: Text(
              widget.text,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.s14regular,
            ),
            secondChild: Text(widget.text, style: AppTextStyles.s14regular),
          ),
          const SizedBox(height: 4),
          GestureDetector(
            onTap: () => setState(() => _expanded = !_expanded),
            child: Text(
              _expanded ? 'Show less' : 'Read more',
              style: AppTextStyles.s13medium,
            ),
          ),
        ],
      ),
    );
  }
}
