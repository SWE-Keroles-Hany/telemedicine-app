import 'package:flutter/material.dart';
import 'package:telemedicine/core/theme/app_text_styles.dart';
import 'package:telemedicine/core/theme/color_manger.dart';

class BookingBottomBar extends StatelessWidget {
  final VoidCallback? onChat;
  final VoidCallback? onBook;

  const BookingBottomBar({super.key, this.onChat, this.onBook});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 14, 20, 20),
      decoration: const BoxDecoration(
        color: ColorManager.background,
        border: Border(top: BorderSide(color: ColorManager.borderLight)),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: onChat,
            child: Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: ColorManager.cardBg,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: ColorManager.borderLighter),
              ),
              child: const Icon(
                Icons.chat_bubble_outline_rounded,
                color: ColorManager.teal,
                size: 22,
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: GestureDetector(
              onTap: onBook,
              child: Container(
                height: 52,
                decoration: BoxDecoration(
                  color: ColorManager.teal,
                  borderRadius: BorderRadius.circular(14),
                ),
                alignment: Alignment.center,
                child: Text('Book Appointment', style: AppTextStyles.s15bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
