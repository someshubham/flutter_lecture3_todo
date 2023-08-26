import 'package:flutter/material.dart';
import 'package:flutter_lecture3_todo/todo_item.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final TextEditingController textController = TextEditingController();

  List<TodoItem> todoitems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo App"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: textController,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                todoitems.add(TodoItem(
                  title: textController.text,
                  isDone: false,
                ));
              });
            },
            child: const Text("Save"),
          ),
          for (int i = 0; i < todoitems.length; i++)
            Row(
              children: [
                Checkbox(
                  value: todoitems[i].isDone,
                  onChanged: (value) {
                    setState(() {
                      todoitems[i].isDone = value!;
                    });
                  },
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.all(8),
                  child: Text(
                    todoitems.elementAt(i).title,
                    style: TextStyle(
                      decoration: (todoitems[i].isDone)
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                ),
              ],
            )
        ],
      ),
    );
  }
}
