import '../domain.dart';

class AddTodo {
  final TodoRepository repository;

  AddTodo(this.repository);

  Future<void> call(TodoEntity todo) async {
    return await repository.addTodo(todo);
  }
}
