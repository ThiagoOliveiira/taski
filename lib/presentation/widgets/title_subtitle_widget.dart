import 'package:flutter/material.dart';

import '../../core/utils/utils.dart';

class TitleSubtitleWidget extends StatelessWidget {
  final String subtitle;

  const TitleSubtitleWidget({super.key, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text.rich(
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20, color: Color(0xFF3F3D56)),
          TextSpan(
            children: [
              TextSpan(text: 'Welcome, '),
              TextSpan(text: 'John', style: TextStyle(color: AppColors.blue)),
              TextSpan(text: '.'),
            ],
          ),
        ),
        const SizedBox(height: 5),
        Text(subtitle, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: AppColors.slateBlue))
      ],
    );
  }
}
