import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:taski/domain/domain.dart';

import '../../test_helper.mocks.dart';

@GenerateMocks([TodoRepository])
void main() {
  late UpdateTodo usecase;
  late MockTodoRepository mockTodoRepository;

  setUp(() {
    mockTodoRepository = MockTodoRepository();
    usecase = UpdateTodo(mockTodoRepository);
  });

  test('Deve atualizar uma tarefa no repositório', () async {
    TodoEntity todo = const TodoEntity(id: 1, title: 'Updated Task', description: 'Updated Desc', isCompleted: true);

    when(mockTodoRepository.updateTodo(todo)).thenAnswer((_) async => Future.value());

    await usecase(todo);

    verify(mockTodoRepository.updateTodo(todo));
    verifyNoMoreInteractions(mockTodoRepository);
  });
}
