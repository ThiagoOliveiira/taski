import 'package:flutter/material.dart';

import '../../core/utils/utils.dart';

AppBar defaultAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.white,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(color: AppColors.blue, borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(MediaQuery.sizeOf(context).width * 0.007),
              child: const Icon(Icons.done_rounded, color: Colors.white),
            ),
            SizedBox(width: MediaQuery.sizeOf(context).width * 0.02),
            const Text('Taski', style: TextStyle(color: Color(0xFF3F3D56), fontWeight: FontWeight.w500, fontSize: 18))
          ],
        ),
        Row(
          children: [
            const Text('John', style: TextStyle(color: AppColors.slatePurple, fontWeight: FontWeight.w500, fontSize: 18)),
            SizedBox(width: MediaQuery.sizeOf(context).width * 0.03),
            const CircleAvatar(backgroundImage: AssetImage('lib/assets/images/avatar.jpg')),
          ],
        )
      ],
    ),
  );
}
