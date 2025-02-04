import 'package:flutter/material.dart';

import '../../domain/domain.dart';
import '../presentation.dart';

class TodoPageContentWidget extends StatelessWidget {
  final TodoState state;
  final TodoCubit todoCubit;
  const TodoPageContentWidget({super.key, required this.state, required this.todoCubit});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        state.menuIndex == 3 && todoCubit.completedTodos?.isNotEmpty == true ? const CompletedTodoWidget() : TitleSubtitleWidget(subtitle: 'You’ve got ${todoCubit.pendingTodos?.length} tasks to do.'),
        const SizedBox(height: 20),
        (todoCubit.pendingTodos?.isNotEmpty == true && state.menuIndex == 0) || (todoCubit.completedTodos?.isNotEmpty == true && state.menuIndex == 3)
            ? Expanded(
                child: ListView.builder(
                  itemCount: state.menuIndex == 0 ? todoCubit.pendingTodos?.length : todoCubit.completedTodos?.length,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    TodoEntity? todo = state.menuIndex == 0 ? todoCubit.pendingTodos![index] : todoCubit.completedTodos![index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: ExpansionItemWidget(
                        id: todo.id ?? 0,
                        title: todo.title,
                        description: todo.description,
                        isCompleted: todo.isCompleted ?? false,
                        onChanged: (value) => todoCubit.modifyTodo(TodoEntity(id: todo.id, title: todo.title, description: todo.description, isCompleted: value)),
                      ),
                    );
                  },
                ),
              )
            : const Expanded(child: CreateTaskWidget()),
      ],
    );
  }
}
