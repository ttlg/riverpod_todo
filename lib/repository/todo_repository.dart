import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_riverpod/entity/todo.dart';

final todoRepository =
    Provider.autoDispose<TodoRepository>((ref) => TodoRepositoryImpl(ref.read));

abstract class TodoRepository {
  Future<List<Todo>> getTodoList();
  Future<void> saveTodoList(List<Todo> todoList);
}

const _todoListKey = 'todoListKey';

class TodoRepositoryImpl implements TodoRepository {
  final Reader _read;
  TodoRepositoryImpl(this._read);

  Future<List<Todo>> getTodoList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<Map<String, dynamic>> todoListJsonList =
        List<Map<String, dynamic>>.from(
            jsonDecode(prefs.getString(_todoListKey) ?? '[]'));
    return todoListJsonList.map((json) => Todo.fromMap(json)).toList();
  }

  Future<void> saveTodoList(List<Todo> todoList) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_todoListKey,
        jsonEncode(todoList.map((todo) => todo.toMap()).toList()));
  }
}
