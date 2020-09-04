import 'package:architect_test/entity/todo.dart';
import 'package:architect_test/provider/todo_providers.dart';
import 'package:architect_test/repository/todo_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

class _TodoRepositoryImplDummy implements TodoRepository {
  List<Todo> inMemoryTodoList = [];

  Future<List<Todo>> getTodos() async {
    return inMemoryTodoList;
  }

  Future<void> saveTodos(List<Todo> todos) async {
    inMemoryTodoList = todos;
  }
}

void main() {
  group('test ViewController behaviors:', () {
    final container = ProviderContainer(
      overrides: [
        todoRepository.overrideWithProvider(
            Provider.autoDispose((ref) => _TodoRepositoryImplDummy()))
      ],
    );
    test('initial value of todo list is null', () async {
      expect(container.read(sortedTodos).state, null);
    });

    test('initial load is empty array', () async {
      await container.read(todosViewController).initState();
      expect(container.read(sortedTodos).state, []);
    });

    test('add first todo', () async {
      await container
          .read(todosViewController)
          .addTodo(TextEditingController(text: 'first'));
      expect(container.read(sortedTodos).state[0].content, 'first');
    });

    test('add second todo', () async {
      await container
          .read(todosViewController)
          .addTodo(TextEditingController(text: 'second'));
      expect(container.read(sortedTodos).state[1].content, 'second');
    });

    test('toggle status', () async {
      final Todo firstTodo = container.read(sortedTodos).state[0];
      await container.read(todosViewController).toggleStatus(firstTodo);
      expect(container.read(sortedTodos).state[0].done, true);
    });

    test('change sort order', () async {
      await container.read(todosViewController).changeSortOrder();
      expect(container.read(sortedTodos).state[0].content, 'second');
    });

    test('dispose', () async {
      await container.read(todosViewController).dispose();
      expect(container.read(sortedTodos).state, []);
    });
  });
}
