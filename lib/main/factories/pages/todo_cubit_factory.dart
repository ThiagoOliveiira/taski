import '../../../presentation/presentation.dart';
import '../factories.dart';

class TodoCubitFactory {
  static TodoCubit createTodoCubit() {
    final dataSource = DataSourceFactory.createTodoLocalDataSource();
    final repository = RepositoryFactory.createTodoRepository(dataSource);

    return TodoCubit(
      getTodos: UseCaseFactory.createGetTodos(repository),
      addTodo: UseCaseFactory.createAddTodo(repository),
      updateTodo: UseCaseFactory.createUpdateTodo(repository),
      deleteTodo: UseCaseFactory.createDeleteTodo(repository),
      removeCompletedTodos: UseCaseFactory.removeCompletedTodos(repository),
    );
  }
}
