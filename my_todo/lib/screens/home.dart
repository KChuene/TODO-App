import 'package:flutter/material.dart';
import 'package:my_todo/constants/colors.dart';
import 'package:my_todo/model/todo.dart';
import 'package:my_todo/widgets/todo_item.dart';


class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todoList = ToDo.list();
  final todoController = TextEditingController();

  List<ToDo> filteredList = [];

  /*
  _HomeState() {
    filteredList = todoList;
  }
  */

  @override
  void initState() {
    filteredList = todoList;
    super.initState();
  }


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

                      for(ToDo item in filteredList.reversed)
                        ToDoItem(
                          todoItem: item, 
                          onToDoChanged: _handleToDoChange, 
                          onItemDelete: _handleItemDelete,
                        )
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
                      controller: todoController,
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
                    onPressed: () { 
                      _handleItemAdd(todoController.text);
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
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

  void _handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _handleItemDelete(String id) {
    setState(() {
      todoList.removeWhere((item) => item.id == id);
    });
  }

  void _handleItemAdd(String todoText) {
    if(todoText.isEmpty) {
      return;
    }

    setState(() {
      todoList.add(ToDo(
        id: DateTime.now().millisecondsSinceEpoch.toString(), 
        text: todoText
      ));
      
      todoController.clear();
    });
  }

  void _handleToDoSearch(String searchText) {
    List<ToDo> results = [];
    if(searchText.isEmpty) {
      results = todoList;
    }
    else {
      results = todoList.where(
        (item) => item.text!.toLowerCase().contains(searchText.toLowerCase())
      ).toList();
    }

    setState(() {
      filteredList = results;
    });
  }

  Widget searchBox() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20)
      ),
      child: TextField(
        onChanged: (value) { _handleToDoSearch(value); },
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