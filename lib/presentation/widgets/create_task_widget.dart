import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/utils/utils.dart';
import '../presentation.dart';

class CreateTaskWidget extends StatelessWidget {
  const CreateTaskWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final todoCubit = context.read<TodoCubit>();
    return BlocBuilder<TodoCubit, TodoState>(
      builder: (context, state) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('lib/assets/images/undraw_no_data_re_kwbl.svg'),
              const SizedBox(height: 20),
              Text(state.menuIndex == 3 ? 'No tasks completed' : 'You have no task listed.', style: const TextStyle(color: AppColors.slateBlue, fontWeight: FontWeight.w500)),
              const SizedBox(height: 20),
              state.menuIndex == 3
                  ? const SizedBox.shrink()
                  : TextButton.icon(
                      onPressed: () => createTaskBottomSheet(context: context, cubit: todoCubit),
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
      },
    );
  }
}
