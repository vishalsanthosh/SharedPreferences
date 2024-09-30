import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CounterExample extends StatefulWidget {
  const CounterExample({super.key});

  @override
  State<CounterExample> createState() => _CounterExampleState();
}

class _CounterExampleState extends State<CounterExample> {
  int _counter =0;
  @override
  void initState(){
    super.initState();
    loadCounter();
  }
  loadCounter () async{
    SharedPreferences prefs= await SharedPreferences.getInstance();
    setState(() {
      _counter=prefs.getInt("counter")?? 0;

    });
   
  }
  incrementCounter()async{
    SharedPreferences prefs =await SharedPreferences.getInstance();
    setState(() {
      _counter++;
    });
    prefs.setInt("counter",_counter);
  }
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(title: Text("Counter Example"),),
body: Center(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Text("Counter Value:$_counter"),
      Center(child: ElevatedButton(onPressed: incrementCounter, child: Text("increment Counter")))
    ],
  ),
),


    );
  }
}