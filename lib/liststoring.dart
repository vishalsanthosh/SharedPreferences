import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListStoringExp extends StatefulWidget {
  const ListStoringExp({super.key});

  @override
  State<ListStoringExp> createState() => _ListStoringExpState();
}

class _ListStoringExpState extends State<ListStoringExp> {
  List<String> _items=[];
  @override
  void initState(){
    super.initState();
    loadItems();
  }
  loadItems()async{
    
    SharedPreferences prefs=await SharedPreferences.getInstance();
    setState(() {
      _items=prefs.getStringList("items")?? [];
    });
  }
saveItems(List<String>items)async{
  SharedPreferences prefs=await SharedPreferences.getInstance();
  prefs.setStringList("items:", items);
}

  void addItem (String item){
setState(() {
  _items.add(item);

});
saveItems(_items);
  }
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("List Stored"),),
    body: Column(
      children: [
        TextField(
          onSubmitted: (val){
            addItem(val);
            
          },
          decoration: InputDecoration(
            hintText: "Enter Items"
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _items.length,
            itemBuilder: (Context, index){
           return ListTile(
            title: Text(_items[index]),
           );
            }),
        )
      ],
    ),
    );
  }
}