import 'package:flutter/material.dart';
import 'package:testtodo/models/models.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Todo> todos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
            onPressed: onPressedAddButton,
            child: const Text("Add Todo"),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) => TodoListItemWidget(
                todo: todos[index],
                onPressed: onPressedListItemWidget,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onPressedAddButton() {
    //navigate to edit
    //result add todo

  }

  void onPressedListItemWidget() {
    //navigate to edit
    // result operation
  }
}

class TodoListItemWidget extends StatelessWidget {
  const TodoListItemWidget({
    super.key,
    required this.todo,
    required this.onPressed,
  });

  final Todo todo;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Text(todo.title),
            Icon(todo.done ? Icons.check : Icons.minimize_outlined),
          ],
        ),
      ),
    );
  }
}
