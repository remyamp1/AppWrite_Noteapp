import 'package:flutter/material.dart';

class NoteApp extends StatefulWidget {
  

  @override
  State<NoteApp> createState() => _NoteAppState();
}

class _NoteAppState extends State<NoteApp> {
  
   List<Map<String,String>> itemList=[];

  TextEditingController titleController=TextEditingController();
  TextEditingController categortController=TextEditingController();
  TextEditingController descriptionController=TextEditingController();
  TextEditingController dateController=TextEditingController();
 
  @override
  void initState(){
    super.initState();
     
     
     

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NOTEAPP'),backgroundColor: Colors.blue,
      ),
body: 
GridView.builder(
  itemCount: itemList.length,
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
 itemBuilder: (
  
  context,index){
  final item=itemList[index];
  return Container(
    height: 300,
    width: double.infinity,
    child: Column(
      children: [
        Text(item['title']?? 'No title'),
        Text(item['category']?? 'No catrgory'),
        Text(item['description']?? 'No description'),
        Text(item['date']?? 'No date')
      ],
    ),
  );
 }),

floatingActionButton: FloatingActionButton(onPressed: (){
      showModalBottomSheet(context: context, builder: (BuildContext context){
        
        return Container(
height: 400,
width: double.infinity,
child: Padding(
  padding: const EdgeInsets.all(15.0),
  child: Column(
    children: [
      SizedBox(
        height: 50,
        width: 300,
        child: TextField(
          controller: titleController,
          decoration: InputDecoration(border: OutlineInputBorder(),label:Text('Title')),)),
      SizedBox(height: 10),
       SizedBox(
        height:50,
        width: 300,
        child: TextField(
          controller: categortController,
          decoration: InputDecoration(border: OutlineInputBorder(),label:Text('Categort')),)),
      SizedBox(height: 10),
       SizedBox(
        height: 50,
        width: 300,
        child: TextField(
          controller: descriptionController,
          decoration: InputDecoration(border: OutlineInputBorder(),label:Text('Description')),)),
      SizedBox(height: 10),
       SizedBox(
        height: 50,
        width: 300,
        child: TextField(
          controller: dateController,
          decoration: InputDecoration(border: OutlineInputBorder(),label:Text('Date')),)),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(onPressed: (){
              setState(() {
                itemList.add({'title':titleController.text,
                'category':categortController.text,
                'description':descriptionController.text,
                'date':dateController.text,

              });
          
            });
              titleController.clear();
              categortController.clear();
              descriptionController.clear();
              dateController.clear();
            Navigator.pop(context);
            },

             child: Text('Add')
             ),
            SizedBox(width: 5),
              TextButton(onPressed: (){
                Navigator.of(context);
              }, child: Text('Cancle')),
          ],
        )
      
    ],
  ),
),

        );
      });
    },
    child: Icon(Icons.add),),
    );
  }
}