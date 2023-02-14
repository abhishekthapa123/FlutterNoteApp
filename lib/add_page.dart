import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:noteapp/database_services.dart';

class AddPage extends StatelessWidget {
 AddPage({Key? key}) : super(key: key);
 final formKey = GlobalKey<FormState>();
TextEditingController titleController = TextEditingController();
TextEditingController detailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
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
                validator: (value) {
                  if(value!.isEmpty)
                  {
                    return "please fill the tittle";
                  }
                  else{
                    return null;
                  }
                },
                decoration: InputDecoration(
                  labelText: "Enter title",
                  border: OutlineInputBorder(borderRadius:BorderRadius.circular(10)),
                ),
              ),
              SizedBox(height:20,),
        
              TextFormField(
                maxLines:7,
                minLines:1,
                controller:detailController,
                validator: (value) {
                  if(value!.isEmpty)
                  {
                    return "please fill the details";
                  }
                  else
                  {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  labelText: "Enter details",
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
                    DataBaseServices.addData(titleController.text,detailController.text);
                    titleController.text="";
                    detailController.text ="";
                  }
                }, child: Text("ADD"))
            ],
          ), 
          
          )),
        )

        
      ));
    
  }
}