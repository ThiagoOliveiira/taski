// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import '../../../domain/domain.dart';

enum TodoStatus { initial, loading, success, failure }

class TodoState extends Equatable {
  final List<TodoEntity>? todos;
  final TodoStatus? status;
  final String? error;
  final bool? statusTask;
  final int? menuIndex;

  const TodoState({this.todos, this.status, this.error, this.statusTask, this.menuIndex = 0});

  TodoState.initial()
      : todos = [],
        status = TodoStatus.initial,
        statusTask = false,
        menuIndex = 0,
        error = null;

  @override
  List<Object?> get props => [todos, status, error, statusTask, menuIndex];

  TodoState copyWith({List<TodoEntity>? todos, TodoStatus? status, String? error, bool? statusTask, int? menuIndex}) {
    return TodoState(
      todos: todos ?? this.todos,
      status: status ?? this.status,
      error: error ?? this.error,
      statusTask: statusTask ?? this.statusTask,
      menuIndex: menuIndex ?? this.menuIndex,
    );
  }
}
