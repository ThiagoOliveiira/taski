import '../../../domain/domain.dart';

class UseCaseFactory {
  static GetTodos createGetTodos(TodoRepository repository) => GetTodos(repository);
  static AddTodo createAddTodo(TodoRepository repository) => AddTodo(repository);
  static UpdateTodo createUpdateTodo(TodoRepository repository) => UpdateTodo(repository);
  static DeleteTodo createDeleteTodo(TodoRepository repository) => DeleteTodo(repository);
  static RemoveCompletedTodos removeCompletedTodos(TodoRepository repository) => RemoveCompletedTodos(repository);
}
