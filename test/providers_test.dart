import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_riverpod/entity/todo.dart';
import 'package:todo_riverpod/provider/todo_providers.dart';
import 'package:todo_riverpod/repository/todo_repository.dart';

class _TodoRepositoryImplDummy implements TodoRepository {
  List<Todo> inMemoryTodoList = [];

  Future<List<Todo>> getTodoList() async {
    return inMemoryTodoList;
  }

  Future<void> saveTodoList(List<Todo> todoList) async {
    inMemoryTodoList = todoList;
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
      expect(container.read(sortedTodoListState), null);
    });

    test('initial load is empty array', () async {
      await container.read(todoViewController).initState();
      expect(container.read(sortedTodoListState), []);
    });

    test('add first todo', () async {
      await container
          .read(todoViewController)
          .addTodo(TextEditingController(text: 'first'));
      expect(container.read(sortedTodoListState)![0].content, 'first');
    });

    test('add second todo', () async {
      await container
          .read(todoViewController)
          .addTodo(TextEditingController(text: 'second'));
      expect(container.read(sortedTodoListState)![1].content, 'second');
    });

    test('toggle status', () async {
      final Todo firstTodo = container.read(sortedTodoListState)![0];
      await container.read(todoViewController).toggleDoneStatus(firstTodo);
      expect(container.read(sortedTodoListState)![0].done, true);
    });

    test('change sort order', () async {
      container.read(todoViewController).toggleSortOrder();
      expect(container.read(sortedTodoListState)![0].content, 'second');
    });

    test('dispose', () async {
      container.read(todoViewController).dispose();
      expect(container.read(sortedTodoListState), []);
    });
  });
}
