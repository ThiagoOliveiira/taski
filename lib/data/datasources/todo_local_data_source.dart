import 'package:hive/hive.dart';

import '../../core/core.dart';
import '../data.dart';

abstract class TodoLocalDataSource {
  Future<List<TodoModel>> getTodos();
  Future<void> addTodo(TodoModel todo);
  Future<void> updateTodo(TodoModel todo);
  Future<void> deleteTodo(int id);
  Future<void> removeCompletedTodos();
}

class TodoLocalDataSourceImpl implements TodoLocalDataSource {
  static const String _boxName = Constants.todoBox;

  @override
  Future<List<TodoModel>> getTodos() async {
    final box = await Hive.openBox<TodoModel>(_boxName);
    return box.values.toList();
  }

  @override
  Future<void> addTodo(TodoModel todo) async {
    final box = await Hive.openBox<TodoModel>(_boxName);
    int generatedId = await box.add(todo);
    todo.id = generatedId;
    await box.put(generatedId, todo);
  }

  @override
  Future<void> updateTodo(TodoModel todo) async {
    final box = await Hive.openBox<TodoModel>(_boxName);
    if (todo.id != null) {
      await box.put(todo.id, todo);
    }
  }

  @override
  Future<void> deleteTodo(int id) async {
    final box = await Hive.openBox<TodoModel>(_boxName);
    await box.delete(id);
  }

  @override
  Future<void> removeCompletedTodos() async {
    final box = await Hive.openBox<TodoModel>(_boxName);
    final completedKeys = box.keys.where((key) {
      final todo = box.get(key) as TodoModel;
      return todo.isCompleted == true;
    }).toList();
    await box.deleteAll(completedKeys);
  }
}
