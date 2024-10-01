import 'package:flutter/material.dart';
import 'package:shared_pref/counter.dart';
import 'package:shared_pref/liststoring.dart';
import 'package:shared_pref/shared.dart';
import 'package:shared_pref/todolist.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shared Preferences',
      theme: ThemeData(
      ),
      home: TodoListExp (),
    );
  }
}

