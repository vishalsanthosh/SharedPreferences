import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TodoListExp extends StatefulWidget {
  const TodoListExp({super.key});

  @override
  State<TodoListExp> createState() => _TodoListExpState();
}

class _TodoListExpState extends State<TodoListExp> {
  TextEditingController _controller=TextEditingController();
  List<Color> colorList=[
    Colors.green,
    Colors.blue,
    Colors.red,
    Colors.purple,
    Colors.yellow
  ];
  List<String> nameList=[];

   void initState(){
    super.initState();
    loadItems();
  }
  loadItems()async{
    
    SharedPreferences prefs=await SharedPreferences.getInstance();
    setState(() {
      nameList=prefs.getStringList("items")?? [];
    });
  }
saveItems(List<String>items)async{
  SharedPreferences prefs=await SharedPreferences.getInstance();
  prefs.setStringList("items:", items);
}

  void addItem (String item){
setState(() {
  nameList.add(item);

});
saveItems(nameList);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TO DO LIST"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
        
          children: [
           Expanded(child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: nameList.length,
            itemBuilder: (context ,index){

              return Container(
              height: 70,
             width: double.infinity,
             
             
             child: Center(child: Text(nameList[index])),
              );
            }))
            
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
              showModalBottomSheet(context: context, builder: (BuildContext context){
                return Container(
                height: 300,
                width: double.infinity,
                child: Column(
                  children: [
                    TextField(
                  
                  
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "ENTER TASK"
                  ),
                  
                ),
                SizedBox(
                  height: 5,
                ),
                Text("Choose a Color"),
              Expanded(
                child: Column(
                  children: [
                   Expanded(
                     child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder:(context ,index){
                      
                      return CircleAvatar(
                        
                        radius: 30,
                      backgroundColor: colorList[index],
                       
                     
                      );
                     }, separatorBuilder: (context,index){
                      return SizedBox(width: 5,);
                     
                     }, itemCount: 5),
                   )
                  ],
                ),
              ),
              ElevatedButton(onPressed: (){
                if(_controller.text.isNotEmpty){
                  addItem(_controller.text);
                  _controller.clear();
                  Navigator.pop(context);
                }
              }, child: Text("ADD"))
              
                  ],
                  
                )
                
                
                

                );
                
              
              });
              
             
            },child: Text("+")),
    );
  }
}