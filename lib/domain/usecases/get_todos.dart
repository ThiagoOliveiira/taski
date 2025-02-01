import '../domain.dart';

class GetTodos {
  final TodoRepository repository;

  GetTodos(this.repository);

  Future<List<TodoEntity>> call() async {
    return await repository.getTodos();
  }
}
