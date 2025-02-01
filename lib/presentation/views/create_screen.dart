import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../presentation.dart';

class CreateScreen extends StatelessWidget {
  const CreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final todoCubit = context.read<TodoCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TitleSubtitleWidget(subtitle: 'You’ve got ${todoCubit.pendingTodos?.length} tasks to do.'),
        const Spacer(),
        const CreateTaskWidget(),
        const Spacer(),
      ],
    );
  }
}
