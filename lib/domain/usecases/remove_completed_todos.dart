import '../domain.dart';

class RemoveCompletedTodos {
  final TodoRepository repository;
  RemoveCompletedTodos(this.repository);

  Future<void> call() async {
    await repository.removeCompletedTodos();
  }
}
