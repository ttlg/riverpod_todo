import 'package:architect_test/entity/todo.dart';
import 'package:architect_test/repository/todo_repository.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum SortOrder {
  ASC,
  DESC,
}

final _sortOrder = StateProvider.autoDispose((ref) => SortOrder.ASC);
final _todos = StateProvider.autoDispose<List<Todo>>((ref) => null);

final sortedTodos = StateProvider<List<Todo>>((ProviderReference ref) {
  final List<Todo> todos = ref.watch(_todos).state;
  final SortOrder sortOrder = ref.watch(_sortOrder).state;

  if (sortOrder == SortOrder.ASC) {
    todos?.sort((a, b) => a.timestamp.compareTo(b.timestamp));
  } else {
    todos?.sort((a, b) => b.timestamp.compareTo(a.timestamp));
  }
  return todos;
});

final todosViewController =
    Provider.autoDispose((ref) => TodosViewController(ref.read));

class TodosViewController {
  final Reader read;
  TodosViewController(this.read);

  void initState() async {
    read(_todos).state = await read(todoRepository).getTodos();
  }

  void dispose() {
    read(_todos).state.clear();
  }

  void addTodo(TextEditingController controller) async {
    final String text = controller.text;
    if (text.trim().isEmpty) {
      return;
    }
    controller.text = '';
    final now = DateTime.now();
    final newTodo = Todo(text, false, now, "${now.millisecondsSinceEpoch}");
    final todos = read(_todos).state..add(newTodo);
    await read(todoRepository).saveTodos(todos);
    read(_todos).state = todos;
  }

  void toggleStatus(Todo todo) async {
    final todos = read(_todos).state;
    final idx = todos.indexWhere((elem) => todo.uid == elem.uid);
    if (idx < 0) {
      return;
    }
    todos[idx] = todo.copyWith(done: !todo.done);
    await read(todoRepository).saveTodos(todos);
    read(_todos).state = todos;
  }

  void changeSortOrder() {
    final SortOrder sortOrder = read(_sortOrder).state;
    read(_sortOrder).state =
        sortOrder == SortOrder.ASC ? SortOrder.DESC : SortOrder.ASC;
  }
}
