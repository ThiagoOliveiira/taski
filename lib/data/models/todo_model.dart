import 'package:hive/hive.dart';
import 'package:taski/domain/domain.dart';

part 'todo_model.g.dart';

@HiveType(typeId: 0)
class TodoModel extends TodoEntity {
  @HiveField(0)
  int? id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String description;

  @HiveField(3)
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
