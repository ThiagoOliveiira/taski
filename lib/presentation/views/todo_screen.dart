import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taski/domain/domain.dart';

import '../presentation.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final todoCubit = context.read<TodoCubit>();
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: defaultAppBar(context),
      bottomNavigationBar: const BottomNavigationBarWidget(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).width * 0.04, vertical: MediaQuery.sizeOf(context).height * 0.03),
        child: BlocBuilder<TodoCubit, TodoState>(
          builder: (context, state) {
            switch (state.status) {
              case TodoStatus.loading:
                return const Center(child: CircularProgressIndicator());
              case TodoStatus.failure:
                return Center(child: Text("Erro: ${state.error}"));
              default:
                return state.menuIndex == 2
                    ? SearchScreen(todos: state.todos!)
                    : state.todos?.isEmpty == true
                        ? const CreateScreen()
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              state.menuIndex == 3 && todoCubit.completedTodos?.isNotEmpty == true
                                  ? const CompletedTodoWidget()
                                  : TitleSubtitleWidget(subtitle: 'You’ve got ${todoCubit.pendingTodos?.length} tasks to do.'),
                              const SizedBox(height: 20),
                              (todoCubit.pendingTodos?.isNotEmpty == true && state.menuIndex == 0) || (todoCubit.completedTodos?.isNotEmpty == true && state.menuIndex == 3)
                                  ? Expanded(
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
                                  : const Expanded(child: CreateTaskWidget()),
                            ],
                          );
            }
          },
        ),
      ),
    );
  }
}
