import 'package:flutter/material.dart';
import 'package:my_todo/constants/colors.dart';
import 'package:my_todo/model/todo.dart';
import 'package:my_todo/widgets/todo_item.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final todoList = ToDo.list();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: AppBar(
          backgroundColor: tdBGColor,
          // elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Icon(
              Icons.menu, 
              color: tdBlack, 
              size: 30
            ),
            Container(
              height: 40, 
              width: 40, 
              child: ClipRRect( 
                borderRadius: BorderRadius.circular(20),
                child: Image.asset("assets/images/gojo.jpeg"),
              ),
            )
          ]),
      ),

      body: Stack( 
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(children: [
                searchBox(),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: 50,
                          bottom: 20
                        ),
                        child: Text(
                          'All ToDos',
                          style: TextStyle(
                            fontSize: 30, 
                            fontWeight: FontWeight.w500
                          )
                        ),
                      ),

                      for(ToDo item in todoList)
                        ToDoItem(todoItem: item)
                    ]
                  )
                )
            ],),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                    margin: EdgeInsets.only(
                      bottom: 20,
                      right: 20,
                      left: 20
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [BoxShadow(
                        color: Colors.grey,
                        blurRadius: 10.0
                      )],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Add new todo item',
                        border: InputBorder.none
                      ),
                    ),
                  )
                ),
                Container(
                  margin: EdgeInsets.only(
                    bottom: 20,
                    right: 10
                  ),
                  child: ElevatedButton(
                    child: Text("+", style: TextStyle(fontSize: 20, color: Colors.white)),
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: tdBlue,
                      minimumSize: Size(60, 60),
                      elevation: 10,
                    ),
                  ),
                )
              ],
            ),
          )
      ])
    );
  }

  Widget searchBox() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20)
      ),
      child: TextField(
        decoration: InputDecoration(
          // contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            color: tdBlack,
            size: 20
          ),
          border: InputBorder.none,
          hintText: "Search",
          hintStyle: TextStyle(color: tdGrey)
        ),
      ),
    );
  }
}