import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_riverpod/entity/todo.dart';
import 'package:todo_riverpod/repository/todo_repository.dart';

enum SortOrder {
  ASC,
  DESC,
}

final _sortOrderState = StateProvider<SortOrder>((ref) => SortOrder.ASC);
final _todoListState = StateProvider<List<Todo>?>((ref) => null);

final sortedTodoListState = StateProvider<List<Todo>?>((ref) {
  final List<Todo>? todoList = ref.watch(_todoListState);

  if (ref.watch(_sortOrderState) == SortOrder.ASC) {
    todoList?.sort((a, b) => a.timestamp.compareTo(b.timestamp));
  } else {
    todoList?.sort((a, b) => b.timestamp.compareTo(a.timestamp));
  }
  return todoList;
});

final todoViewController =
    Provider.autoDispose((ref) => TodoViewController(ref.read));

class TodoViewController {
  final Reader _read;
  TodoViewController(this._read);

  Future<void> initState() async {
    _read(_todoListState.notifier).state =
        await _read(todoRepository).getTodoList();
  }

  void dispose() {
    _read(_todoListState)?.clear();
  }

  Future<void> addTodo(TextEditingController textController) async {
    final String text = textController.text;
    if (text.trim().isEmpty) {
      return;
    }
    textController.text = '';
    final now = DateTime.now();
    final newTodo = Todo(
      content: text,
      done: false,
      timestamp: now,
      id: "${now.millisecondsSinceEpoch}",
    );
    final List<Todo> newTodoList = [newTodo, ...(_read(_todoListState) ?? [])];
    _read(_todoListState.notifier).state = newTodoList;
    await _read(todoRepository).saveTodoList(newTodoList);
  }

  Future<void> toggleDoneStatus(Todo todo) async {
    final List<Todo> newTodoList = [
      ...(_read(_todoListState) ?? [])
          .map((e) => (e.id == todo.id) ? e.copyWith(done: !e.done) : e)
    ];
    _read(_todoListState.notifier).state = newTodoList;
    await _read(todoRepository).saveTodoList(newTodoList);
  }

  void toggleSortOrder() {
    _read(_sortOrderState.notifier).state =
        _read(_sortOrderState) == SortOrder.ASC
            ? SortOrder.DESC
            : SortOrder.ASC;
  }
}
