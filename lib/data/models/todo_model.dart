// ignore_for_file: overridden_fields

import 'package:hive/hive.dart';
import 'package:taski/domain/domain.dart';

part 'todo_model.g.dart';

@HiveType(typeId: 0)
// ignore: must_be_immutable
class TodoModel extends TodoEntity {
  @HiveField(0)
  // ignore: annotate_overrides
  int? id;

  @HiveField(1)
  // ignore: annotate_overrides
  final String title;

  @HiveField(2)
  // ignore: annotate_overrides
  final String description;

  @HiveField(3)
  // ignore: annotate_overrides
  final bool? isCompleted;

  TodoModel({
    required this.id,
    required this.title,
    required this.description,
    required this.isCompleted,
  }) : super(id: id, title: title, description: description, isCompleted: isCompleted);

  factory TodoModel.fromEntity(TodoEntity todo) {
    return TodoModel(
      id: int.tryParse(todo.id.toString()),
      title: todo.title,
      description: todo.description,
      isCompleted: todo.isCompleted,
    );
  }

  TodoEntity toEntity() {
    return TodoEntity(
      id: id,
      title: title,
      description: description,
      isCompleted: isCompleted,
    );
  }
}
