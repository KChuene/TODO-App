class ToDo {
  String? id;
  String? text;
  bool isDone;

  ToDo({
    required this.id,
    required this.text,
    this.isDone = false
  });

  static List<ToDo> list() {
    return [
      ToDo(id: "01", text: "Buy groceries."),
      ToDo(id: "02", text: "Take the dog for a walk.", isDone: true)
    ];
  }
}