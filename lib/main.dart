import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  List<int> list=[];
  List resultList=[];
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Hello Mister"),),
        body: Column(
          children: [
            Expanded(child: Form(
              key:_formKey ,
              child: ListView.builder(
                shrinkWrap: true,
                  itemCount: list.length,
                  itemBuilder: (context,index){
                    return TextFormField(
                      decoration:const InputDecoration(
                        hintText: "Input here"
                      ),
                        validator: (value){
                          if(value!.isEmpty){
                            return "Empty Field";
                          }

                        },
                      onSaved: (value){
                          resultList.insert(index, value);
                          print(resultList);
                      },
                    );
              }),
            )),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceAround,
             children: [
               InkWell(
                   onTap: (){
                   setState(() {
                     list.add(0);
                   });
                   },
                   child:const SizedBox(height: 100.0,child: Text("ADD"),)),
               InkWell(
                   onTap: (){
                     if(_formKey.currentState!.validate()){
                       _formKey.currentState!.save();
                     }
                   },
                   child:const SizedBox(height: 100.0,child: Text("SAVE"),)),
             ],
           )



          ],
        ),
      ),



    );
  }
}
