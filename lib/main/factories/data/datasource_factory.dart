import '../../../data/data.dart';

class DataSourceFactory {
  static TodoLocalDataSource createTodoLocalDataSource() {
    return TodoLocalDataSourceImpl();
  }
}
