import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference extends StatefulWidget {
  const SharedPreference({super.key});

  @override
  State<SharedPreference> createState() => _SharedPreferenceState();
}

class _SharedPreferenceState extends State<SharedPreference> {
  String _name= '';
  @override
  void initState(){
    super.initState();
    loadName();
  }
  loadName() async{
    SharedPreferences prefs =await SharedPreferences.getInstance();
    setState(() {
      _name=prefs.getString("name") ?? "No Name Saved";

    });
  }
  saveName(String name) async {
    SharedPreferences prefs= await SharedPreferences.getInstance();
    prefs.setString("name",name);
    loadName();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shared Preference"),
        
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget> [
            Text("Saved Name: $_name"),
            TextField(
              onSubmitted: (val){
                saveName(val);
              },
              decoration: InputDecoration(
                hintText: "Enter your Name"
              ),
            )
          ],
        ),
      ),
    );
  }
}