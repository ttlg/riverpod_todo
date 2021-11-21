import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo_riverpod/view/simple_todo.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        home: SimpleTodo(),
      ),
    ),
  );
}
