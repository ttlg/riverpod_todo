import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_riverpod/entity/todo.dart';
import 'package:todo_riverpod/provider/todo_providers.dart';

class TodoTile extends HookConsumerWidget {
  final Todo todo;
  const TodoTile({required this.todo});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: ListTile(
        title: Text(todo.content),
        leading: IconButton(
          icon: todo.done
              ? const Icon(Icons.check_box, color: Colors.green)
              : const Icon(Icons.check_box_outline_blank),
          onPressed: () {
            ref.read(todoViewController).toggleDoneStatus(todo);
          },
        ),
        trailing: Text(todo.timestamp.toIso8601String()),
      ),
    );
  }
}

class SimpleTodo extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      ref.read(todoViewController).initState();
      return ref.read(todoViewController).dispose;
    }, []);
    final textController = useTextEditingController();
    final List<Todo>? todoList = ref.watch(sortedTodoListState);
    if (todoList == null) {
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
                  ref.read(todoViewController).toggleSortOrder();
                },
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: todoList.length,
              itemBuilder: (context, int index) =>
                  TodoTile(todo: todoList[index]),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          ref.read(todoViewController).addTodo(textController);
        },
      ),
    );
  }
}
