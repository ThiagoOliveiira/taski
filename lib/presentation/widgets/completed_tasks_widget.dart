import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utils/utils.dart';
import '../presentation.dart';

class CompletedTodoWidget extends StatelessWidget {
  const CompletedTodoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final todoCubit = context.read<TodoCubit>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Completed Tasks', style: TextStyle(fontSize: 24, color: AppColors.slatePurple, fontWeight: FontWeight.w700)),
        TextButton(onPressed: todoCubit.removeAll, child: const Text('Delete All', style: TextStyle(color: Colors.red, fontSize: 18, fontWeight: FontWeight.w600)))
      ],
    );
  }
}
