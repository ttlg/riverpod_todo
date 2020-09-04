import 'package:architect_test/entity/todo.dart';
import 'package:architect_test/provider/todo_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final _currentTodoProvider = ScopedProvider<Todo>(null);

class TodoTile extends HookWidget {
  const TodoTile();

  @override
  Widget build(BuildContext context) {
    final todo = useProvider(_currentTodoProvider);
    return Card(
      child: ListTile(
        title: Text(todo.content),
        leading: IconButton(
          icon: todo.done
              ? const Icon(Icons.check_box, color: Colors.green)
              : const Icon(Icons.check_box_outline_blank),
          onPressed: () {
            context.read(todosViewController).toggleStatus(todo);
          },
        ),
        trailing: Text(todo.timestamp.toIso8601String()),
      ),
    );
  }
}

class MySimpleTodo extends HookWidget {
  @override
  Widget build(BuildContext context) {
    useEffect(() {
      context.read(todosViewController).initState();
      return context.read(todosViewController).dispose;
    }, ['never']);
    final textController = useTextEditingController();

    final List<Todo> todos = useProvider(sortedTodos).state;

    if (todos == null) {
      return Container(child: const Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Simple Todo')),
      body: Column(
        children: [
          TextField(controller: textController),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: const Icon(Icons.sort),
                onPressed: () {
                  context.read(todosViewController).changeSortOrder();
                },
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (ctx, int idx) => ProviderScope(
                overrides: [
                  _currentTodoProvider.overrideWithValue(todos[idx]),
                ],
                child: const TodoTile(),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          context.read(todosViewController).addTodo(textController);
        },
      ),
    );
  }
}
