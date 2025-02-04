import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            return switch (state.status) {
              TodoStatus.loading => const Center(child: CircularProgressIndicator()),
              TodoStatus.failure => Center(child: Text("Erro: ${state.error}")),
              _ => state.menuIndex == 2
                  ? SearchScreen(todos: state.todos!)
                  : state.todos?.isEmpty == true
                      ? const CreateScreen()
                      : TodoPageContentWidget(state: state, todoCubit: todoCubit),
            };
          },
        ),
      ),
    );
  }
}
