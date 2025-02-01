import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taski/domain/domain.dart';

import '../../core/utils/utils.dart';
import '../presentation.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  List<({String path, String label})> get _items => [
        (path: 'lib/assets/icons/todo.svg', label: 'Todo'),
        (path: 'lib/assets/icons/plus.svg', label: 'Create'),
        (path: 'lib/assets/icons/search.svg', label: 'Search'),
        (path: 'lib/assets/icons/checked.svg', label: 'Done'),
      ];

  @override
  Widget build(BuildContext context) {
    final todoCubit = context.read<TodoCubit>();
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: defaultAppBar(context),
      bottomNavigationBar: BlocBuilder<TodoCubit, TodoState>(
        builder: (context, state) {
          return SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.085,
            child: BottomNavigationBar(
              items: _items.mapIndexed((index, item) {
                return BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    item.path,
                    colorFilter: ColorFilter.mode(
                      index == state.menuIndex ? AppColors.blue : AppColors.mutedAzure,
                      BlendMode.srcIn,
                    ),
                  ),
                  label: item.label,
                );
              }).toList(),
              selectedLabelStyle: const TextStyle(color: AppColors.blue, fontSize: 14, fontWeight: FontWeight.w600, height: 2),
              unselectedLabelStyle: const TextStyle(color: AppColors.mutedAzure, fontSize: 14, fontWeight: FontWeight.w600, height: 2),
              selectedItemColor: AppColors.blue,
              unselectedItemColor: AppColors.mutedAzure,
              onTap: (index) {
                context.read<TodoCubit>().navigateBottomSheetItem(index);
                if (index == 1) {
                  createTaskBottomSheet(context: context, cubit: context.read<TodoCubit>());
                  context.read<TodoCubit>().navigateBottomSheetItem(0);
                }
              },
              currentIndex: state.menuIndex ?? 0,
              type: BottomNavigationBarType.fixed,
              backgroundColor: AppColors.paleWhite,
            ),
          );
        },
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).width * 0.04, vertical: MediaQuery.sizeOf(context).height * 0.03),
        child: BlocBuilder<TodoCubit, TodoState>(
          builder: (context, state) {
            switch (state.status) {
              case TodoStatus.loading:
                return const Center(child: CircularProgressIndicator());
              case TodoStatus.failure:
                return Center(child: Text("Erro: ${state.error}"));
              case TodoStatus.success:
                return state.menuIndex == 2
                    ? SearchScreen(todos: state.todos!)
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          state.menuIndex == 3
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('Completed Tasks', style: TextStyle(fontSize: 24, color: AppColors.slatePurple, fontWeight: FontWeight.w700)),
                                    TextButton(onPressed: todoCubit.removeAll, child: const Text('Delete All', style: TextStyle(color: Colors.red, fontSize: 18, fontWeight: FontWeight.w600)))
                                  ],
                                )
                              : const TitleSubtitleWidget(subtitle: 'You’ve got 7 tasks to do.'),
                          const SizedBox(height: 20),
                          Expanded(
                            child: ListView.builder(
                              itemCount: state.menuIndex == 0 ? todoCubit.pendingTodos?.length : todoCubit.completedTodos?.length,
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
                        ],
                      );
              default:
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const TitleSubtitleWidget(subtitle: 'You’ve got 7 tasks to do.'),
                    const Spacer(),
                    CreateTaskWidget(cubit: context.read<TodoCubit>()),
                    const Spacer(),
                  ],
                );
            }
          },
        ),
      ),
    );
  }
}
