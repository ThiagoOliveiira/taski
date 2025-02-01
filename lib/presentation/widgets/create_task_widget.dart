import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/utils/utils.dart';
import '../presentation.dart';

class CreateTaskWidget extends StatelessWidget {
  final TodoCubit cubit;
  const CreateTaskWidget({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('lib/assets/images/undraw_no_data_re_kwbl.svg'),
          const SizedBox(height: 20),
          const Text('You have no task listed.', style: TextStyle(color: AppColors.slateBlue, fontWeight: FontWeight.w500)),
          const SizedBox(height: 20),
          TextButton.icon(
            onPressed: () => createTaskBottomSheet(context: context, cubit: cubit),
            icon: const Icon(Icons.add, color: AppColors.blue, weight: 0.1),
            label: const Text('Create task', style: TextStyle(color: AppColors.blue, fontSize: 18, fontWeight: FontWeight.w600)),
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(AppColors.blue.withOpacity(0.1)),
              shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
              fixedSize: WidgetStateProperty.all(Size.fromHeight(MediaQuery.sizeOf(context).height * 0.05)),
            ),
          ),
        ],
      ),
    );
  }
}
