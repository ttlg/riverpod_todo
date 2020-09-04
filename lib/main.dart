import 'package:architect_test/view/my_simple_todo.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        home: MySimpleTodo(),
      ),
    ),
  );
}
