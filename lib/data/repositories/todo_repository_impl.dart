import '../../domain/domain.dart';
import '../data.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoLocalDataSource localDataSource;

  TodoRepositoryImpl(this.localDataSource);

  @override
  Future<List<TodoEntity>> getTodos() async {
    final todos = await localDataSource.getTodos();
    return todos.map((model) => model.toEntity()).toList();
  }

  @override
  Future<void> addTodo(TodoEntity todo) async {
    return await localDataSource.addTodo(TodoModel.fromEntity(todo));
  }

  @override
  Future<void> updateTodo(TodoEntity todo) async {
    return await localDataSource.updateTodo(TodoModel.fromEntity(todo));
  }

  @override
  Future<void> deleteTodo(int id) async {
    return await localDataSource.deleteTodo(id);
  }

  @override
  Future<void> removeCompletedTodos() async {
    return await localDataSource.removeCompletedTodos();
  }
}
