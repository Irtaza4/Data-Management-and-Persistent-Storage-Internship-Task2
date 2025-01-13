import 'package:flutter/material.dart';
import 'package:internship_task2/counter.dart';
import 'package:internship_task2/todo_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),

        appBarTheme: AppBarTheme(
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
            color: Colors.grey
          ),
          backgroundColor:Colors.black
        ),
        scaffoldBackgroundColor: Colors.grey,


      ),
      home: TodoList() ,
    );
  }
}

