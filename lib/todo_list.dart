import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final List<String> toDolist = [];
  final TextEditingController _controller = TextEditingController();
  final List<bool> checkBoxStates = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadData();
  }

  Future<void> _saveData()async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setStringList('todoList', toDolist);
    await pref.setStringList('checkBox',
        checkBoxStates.map((e)=>e.toString()).toList());

}
Future<void> _loadData()async{
    final SharedPreferences pref = await SharedPreferences.getInstance();
   List<String>? loadedTasks = await pref.getStringList('todoList');
   List<bool>? checkState = await pref.getStringList('checkBox')!
       .map((e)=>e== 'true').toList();
   if(loadedTasks!=null && checkState!=null){
     setState(() {
       toDolist.addAll(loadedTasks);
       checkBoxStates.addAll(checkState);
     });
   }
}

  void addItem() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        toDolist.add(_controller.text);
        checkBoxStates.add(false); // Add corresponding entry in checkBoxStates
      });
      _controller.clear();
      _saveData();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter the text")),
      );
    }
  }

  void deleteItem(int index) {
    setState(() {
      toDolist.removeAt(index);
      checkBoxStates.removeAt(index);// Remove the corresponding checkbox state
    });
    _saveData();
  }

  void toggle(int index) {
    setState(() {
      checkBoxStates[index] = !checkBoxStates[index]; // Toggle the checkbox state
    });
    _saveData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To-Do List"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter the value";
                }
                return null;
              },
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Enter your tasks',
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: addItem,
            child: Text("Add"),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
          ),
          SizedBox(height: 20),
          Expanded(
            child: Card(

              color: Colors.transparent,
              borderOnForeground: false,
              child: ListView.builder(
                itemCount: toDolist.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Text(
                      toDolist[index],
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 18),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          onTap: () => deleteItem(index),
                          child: Icon(
                            Icons.delete,
                            color: Colors.red.shade600,
                          ),
                        ),
                        SizedBox(width: 10),
                        InkWell(
                          onTap: () => toggle(index),
                          child: Icon(
                            checkBoxStates[index]
                                ? Icons.check_box
                                : Icons.check_box_outline_blank,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
