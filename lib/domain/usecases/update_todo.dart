import '../domain.dart';

class UpdateTodo {
  final TodoRepository repository;

  UpdateTodo(this.repository);

  Future<void> call(TodoEntity todo) async {
    return await repository.updateTodo(todo);
  }
}
