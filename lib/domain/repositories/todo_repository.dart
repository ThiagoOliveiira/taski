import '../domain.dart';

abstract class TodoRepository {
  Future<List<TodoEntity>> getTodos();
  Future<void> addTodo(TodoEntity todo);
  Future<void> updateTodo(TodoEntity todo);
  Future<void> deleteTodo(int id);
  Future<void> removeCompletedTodos();
}
