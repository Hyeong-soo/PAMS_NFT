import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class ToDo{
  bool isDone = false;
  String? title;

  ToDo(this.title);
}

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      title: 'Work ManageMent',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: ToDoListPage(),
    );
  }
}

class ToDoListPage extends StatefulWidget
{
  @override
  _ToDoListPageState createState() => _ToDoListPageState();
}

class _ToDoListPageState extends State<ToDoListPage>
{
  final _items = <ToDo>[];

  var _ToDoController = TextEditingController();

  @override
  void dispose() {
    _ToDoController.dispose();
    super.dispose();
  }

  void _addToDo(ToDo todo)
  {
    setState(() {
      _items.add(todo);
      _ToDoController.text = '';
    });
  }

  void _deleteDoTo(ToDo todo)
  {
    setState(() {
      _items.remove(todo);
    });
  }

  void _toggleToDo(ToDo todo)
  {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  Widget _buildItemWidget(ToDo todo)
  {
    return ListTile(
      onTap: () => _toggleToDo(todo),
      title: Text(
        todo.title!,
        style: todo.isDone
          ? TextStyle(
          decoration: TextDecoration.lineThrough,
          fontStyle: FontStyle.italic,
        )
          : null,
    ),
      trailing: IconButton(
        icon: Icon(Icons.delete_forever),
        onPressed: () => _deleteDoTo(todo),
      ),
    );
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
        appBar: AppBar(
          title: Text('ToDoList'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _ToDoController,
                    ),
                  ),
                  ElevatedButton(
                    child: Text('Add'),
                    onPressed: () => _addToDo(ToDo(_ToDoController.text)),
                  ),
                ],
              ),
              Expanded(
                child: ListView(
                  children: _items.map((todo) =>
                  _buildItemWidget(todo)).toList(),
                ),
              ),
            ],
          ),
        ),
    );
  }
}