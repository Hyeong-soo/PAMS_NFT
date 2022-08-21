import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class ToDo{
  bool isDone = false;
  String? title;

  ToDo(this.title, {this.isDone = false});
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
  //final _items = <ToDo>[];

  var _ToDoController = TextEditingController();

  @override
  void dispose() {
    _ToDoController.dispose();
    super.dispose();
  }

  void _addToDo(ToDo todo)
  {
    setState(() {
      FirebaseFirestore.instance.collection('ToDo').add(
        {'title' : todo.title, 'isDone' : todo.isDone}
      );
      _ToDoController.text = '';
    });
  }

  void _deleteDoTo(DocumentSnapshot doc)
  {
    FirebaseFirestore.instance.collection('ToDo').doc(doc.id).delete();
  }

  void _toggleToDo(DocumentSnapshot doc)
  {
    FirebaseFirestore.instance.collection('ToDo').doc(doc.id).update(
      {'isDone' : !doc['isDone']}
    );
  }

  Widget _buildItemWidget(DocumentSnapshot doc)
  {
    final todo = ToDo(doc['title'], isDone: doc['isDone']);
    return ListTile(
      onTap: () => _toggleToDo(doc),
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
        onPressed: () => _deleteDoTo(doc),
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
              StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection('ToDo').snapshots(),
                builder: (context, snapshot) {
                  if(!snapshot.hasData)
                    {
                      return CircularProgressIndicator();
                    }
                  final documents = snapshot.data!.docs;
                  return Expanded(
                    child: ListView(
                      children: documents.map((doc) =>
                      _buildItemWidget(doc)).toList(),
                    ),
                  );
                }
              ),
            ],
          ),
        ),
    );
  }
}