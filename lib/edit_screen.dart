import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:noteapp/database_services.dart';
import 'package:noteapp/showData.dart';

class EditDataPage extends StatelessWidget {
  navigation(BuildContext context)

  {
    Navigator.push(context, MaterialPageRoute(builder:(_)=>ShowDataPage()));
  }
  String? title;
  String? detail;
  String? id;
 EditDataPage({Key? key,this.id,this.title,this.detail}) : super(key: key);
 final formKey = GlobalKey<FormState>();
TextEditingController titleController = TextEditingController();
TextEditingController detailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    titleController.text= title!;
    detailController.text =detail!;

    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){},child: Icon(Icons.add)),
      appBar: AppBar(
        title: const Center(child: Text("NOTES",style: TextStyle(color:Colors.red,))),
        

      ),
      body: SafeArea(
        child:SingleChildScrollView(
          child: Form(
          key: formKey,
          child: Padding(
          
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: [
        
              TextFormField(
              
                controller: titleController,
              
                decoration: InputDecoration(
                  
                  labelText: "$title",

                  border: OutlineInputBorder(borderRadius:BorderRadius.circular(10)),
                ),
              ),
              SizedBox(height:20,),
        
              TextFormField(
              
                maxLines:7,
                minLines:1,
                controller:detailController
                
                ,
                decoration: InputDecoration(
                  labelText: "$detail",
                  border:OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                ),
              ),
              SizedBox(height: 20,),
              ElevatedButton(
        
                style: ButtonStyle(
                  minimumSize:MaterialStateProperty.all(Size(double.infinity,40)),
                  backgroundColor: MaterialStateProperty.all(Colors.pink)
        
                ),
                
                onPressed: (){
                  if(formKey.currentState!.validate())
                  {
                    DataBaseServices.update(id!,titleController.text,detailController.text);
                    titleController.text="";
                    detailController.text ="";
                    navigation(context);
                  }
                }, child: Text("UPDATE"))
            ],
          ), 
          
          )),
        )

        
      ));
    
  }
}