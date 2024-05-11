import 'package:flutter/material.dart';
import 'package:my_todo/constants/colors.dart';

class ToDoItem extends StatelessWidget {
  const ToDoItem({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ),

        tileColor: Colors.white,
        leading: Icon(
          Icons.check_box,
          color: tdBlue
        ),

        title: Text(
          "A todo item.",
          style: TextStyle(
            fontSize: 16,
            color: tdBlack,
            decoration: TextDecoration.lineThrough
          ),
        ),

        trailing: Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(5)
          ),
          child: IconButton(
            onPressed: () {},
            iconSize: 18,
            icon: Icon(Icons.delete),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}