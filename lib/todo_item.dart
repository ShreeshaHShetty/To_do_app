import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  final Function(bool?) onChanged;
  final Function(BuildContext) deleteFunction;
  final Function editFunction;

  const TodoItem({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
    required this.editFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Checkbox(
          value: taskCompleted,
          onChanged: onChanged,
          activeColor: Colors.indigo,
        ),
        title: Text(
          taskName,
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            decoration: taskCompleted
                ? TextDecoration.lineThrough
                : TextDecoration.none,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.edit, color: Colors.blueAccent),
              onPressed: () => editFunction(),
            ),
            IconButton(
              icon: Icon(Icons.delete, color: Colors.redAccent),
              onPressed: () => deleteFunction(context),
            ),
          ],
        ),
      ),
    );
  }
}
