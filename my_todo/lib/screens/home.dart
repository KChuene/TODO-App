import 'package:flutter/material.dart';
import 'package:my_todo/constants/colors.dart';
import 'package:my_todo/widgets/todo_item.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: AppBar(
          backgroundColor: tdBGColor,
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

      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
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
                  ToDoItem(),
                  ToDoItem(),
                  ToDoItem()
                ]
              )
            )
        ],),
      ),
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