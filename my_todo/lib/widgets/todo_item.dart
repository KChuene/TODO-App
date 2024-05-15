import 'package:flutter/material.dart';
import 'package:my_todo/constants/colors.dart';
import 'package:my_todo/model/todo.dart';

class ToDoItem extends StatelessWidget {
  final ToDo todoItem;
  final onToDoChanged;
  final onItemDelete;

  const ToDoItem({Key? key, required this.todoItem, required this.onToDoChanged, required this.onItemDelete}) : super(key: key);

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          onToDoChanged(todoItem);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        // contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: Colors.white,

        leading: Icon(
          todoItem.isDone? Icons.check_box: Icons.check_box_outline_blank,
          color: tdBlue
        ),

        title: Text(
          todoItem.text!,
          style: TextStyle(
            fontSize: 16,
            color: tdBlack,
            decoration: todoItem.isDone? TextDecoration.lineThrough : null
          ),
        ),

        trailing: Container(
          // padding: EdgeInsets.all(0),
          // margin: EdgeInsets.symmetric(vertical: 12),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: tdRed,
            borderRadius: BorderRadius.circular(5)
          ),
          child: IconButton(
            onPressed: () {
              onItemDelete(todoItem.id);
            },
            iconSize: 18,
            icon: Icon(Icons.delete),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}