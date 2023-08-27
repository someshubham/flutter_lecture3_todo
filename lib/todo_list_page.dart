import 'package:flutter/material.dart';
import 'package:flutter_lecture3_todo/todo_item.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

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
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    onSubmitted: (value) {
                      setState(() {
                        todoitems.add(TodoItem(
                          title: textController.text,
                          isDone: false,
                        ));
                      });
                      textController.clear();
                    },
                    controller: textController,
                  ),
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
              const SizedBox(width: 8),
            ],
          ),
          Expanded(
            child: Scrollbar(
              thickness: 20,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: todoitems.length,
                itemBuilder: (context, i) {
                  return Slidable(
                    key: ValueKey(i),
                    endActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (_) {
                            setState(() {
                              todoitems.removeAt(i);
                            });
                          },
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: 'Delete',
                        ),
                      ],
                    ),
                    startActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (_) {
                            setState(() {
                              todoitems.removeAt(i);
                            });
                          },
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: 'Delete',
                        ),
                      ],
                    ),
                    child: ListTile(
                      leading: Checkbox(
                        value: todoitems[i].isDone,
                        onChanged: (value) {
                          setState(() {
                            todoitems[i].isDone = value!;
                          });
                        },
                      ),
                      title: Text(
                        todoitems.elementAt(i).title,
                        style: TextStyle(
                          decoration: (todoitems[i].isDone)
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
