import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:taski/domain/domain.dart';

import '../../test_helper.mocks.dart';

@GenerateMocks([TodoRepository])
void main() {
  late AddTodo usecase;
  late MockTodoRepository mockTodoRepository;

  setUp(() {
    mockTodoRepository = MockTodoRepository();
    usecase = AddTodo(mockTodoRepository);
  });

  test('Deve adicionar uma tarefa no repositório', () async {
    TodoEntity todo = const TodoEntity(id: 1, title: 'Test Task', description: 'Test Desc', isCompleted: false);

    when(mockTodoRepository.addTodo(todo)).thenAnswer((_) async => Future.value());

    await usecase(todo);

    verify(mockTodoRepository.addTodo(todo));
    verifyNoMoreInteractions(mockTodoRepository);
  });

  test('Deve lançar uma exceção se a tarefa for inválida', () async {
    TodoEntity todo = const TodoEntity(id: 1, title: '', description: 'No title', isCompleted: false);

    when(mockTodoRepository.addTodo(todo)).thenThrow(Exception('Título não pode ser vazio'));

    expect(() => usecase(todo), throwsException);
  });

  test('Deve garantir que o método seja chamado apenas uma vez', () async {
    TodoEntity todo = const TodoEntity(id: 2, title: 'Unique Task', description: 'Test Desc', isCompleted: false);

    when(mockTodoRepository.addTodo(todo)).thenAnswer((_) async => Future.value());

    await usecase(todo);
    verify(mockTodoRepository.addTodo(todo)).called(1);
  });
}
