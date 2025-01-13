import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int no = 50;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadCounter();
  }
  Future<void> loadCounter()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      no = prefs.getInt('CounterValue')??50;
    });
  }
  Future<void> saveCounter()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('CounterValue', no);
  }
  void counteradd( ){

    setState(() {
      no++;

    });
    saveCounter();
  }
void counterminus(){
    setState(() {
      no--;

    });
    saveCounter();
}
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text("Counter App"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
        Center(
          child: Text('$no',style: TextStyle(
            fontSize: 30
          ),),
        ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed:counteradd, child:  Icon(Icons.add,color: Colors.black,),style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green
              ),),
              SizedBox(width: 10,),
              ElevatedButton(onPressed: counterminus, child: Icon(Icons.minimize,color: Colors.black),style:
                ElevatedButton.styleFrom(
                  backgroundColor: Colors.red
                ))
            ],
          ),
        ],
      ),

    );
  }
}
