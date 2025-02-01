import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../presentation/presentation.dart';
import '../factories.dart';

class TodoScreenFactory {
  static Widget createTodoPage() {
    return BlocProvider<TodoCubit>(
      create: (context) => TodoCubitFactory.createTodoCubit()..loadTodos(),
      child: const TodoScreen(),
    );
  }
}
