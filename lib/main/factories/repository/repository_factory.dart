import '../../../data/data.dart';
import '../../../domain/domain.dart';

class RepositoryFactory {
  static TodoRepository createTodoRepository(TodoLocalDataSource localDataSource) {
    return TodoRepositoryImpl(localDataSource);
  }
}
