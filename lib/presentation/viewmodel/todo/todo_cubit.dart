import 'package:bloc/bloc.dart';

import '../../../domain/domain.dart';
import './todo.dart';

class TodoCubit extends Cubit<TodoState> {
  final GetTodos getTodos;
  final AddTodo addTodo;
  final UpdateTodo updateTodo;
  final DeleteTodo deleteTodo;
  final RemoveCompletedTodos removeCompletedTodos;

  TodoCubit({
    required this.getTodos,
    required this.addTodo,
    required this.updateTodo,
    required this.deleteTodo,
    required this.removeCompletedTodos,
  }) : super(TodoState.initial());

  List<TodoEntity>? get pendingTodos => state.todos?.where((todo) => todo.isCompleted == false).toList();
  List<TodoEntity>? get completedTodos => state.todos?.where((todo) => todo.isCompleted == true).toList();

  Future<void> loadTodos() async {
    emit(TodoState(todos: state.todos, status: TodoStatus.loading));
    try {
      final todos = await getTodos();
      emit(state.copyWith(todos: todos, status: todos.isEmpty ? TodoStatus.initial : TodoStatus.success));
    } catch (e) {
      emit(TodoState(todos: state.todos, status: TodoStatus.failure, error: e.toString()));
    }
  }

  void navigateBottomSheetItem(int index) => emit(state.copyWith(menuIndex: index));

  Future<void> createTodo(TodoEntity todo) async {
    await addTodo(todo);
    loadTodos();
  }

  Future<void> modifyTodo(TodoEntity todo) async {
    await updateTodo(todo);
    loadTodos();
    emit(state.copyWith(status: pendingTodos?.isEmpty == true ? TodoStatus.initial : TodoStatus.success));
  }

  Future<void> removeTodo(int id) async {
    await deleteTodo(id);
    loadTodos();
  }

  Future<void> removeAll() async {
    await removeCompletedTodos();
    loadTodos();
  }

  void updateStatusTask(bool? value) {
    emit(state.copyWith(statusTask: value));
  }
}
