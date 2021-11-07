
import 'dart:io';
import 'package:snake_breed_prediction/prediction.dart';
import 'package:tflite/tflite.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SnakeDescription extends StatefulWidget {
  const SnakeDescription({ key }) : super(key: key);

  @override
  _SnakeDescriptionState createState() => _SnakeDescriptionState();
}

class _SnakeDescriptionState extends State<SnakeDescription> {
  final _formKey = GlobalKey<FormState>();
  String? value;
  final items =['Mulund','Thane','Govandi','Vidyavihar','Mankhurd','Bhandup','Kanjurmarg','Powai'];
  bool _loading=true;//check if an image has been chosen or not
  late File _image;//image that is chosen
  late List _output;//prediction made
  final picker=ImagePicker();//pick an image from gallery or camera
// first method that is called
  @override
  void initState() {
    super.initState();
    loadModel().then((value){
      setState(() {
        
      });
    });
  }
// disposes and clears our memory
  @override
  void dispose() {
    super.dispose();
    Tflite.close();
  }
//runs the classification model
  classifyImage(File image) async{
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 13,//Number of classes
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
      );
      setState(() {
        _output=output!;
        _loading=false;
      });
      print(_output);
  }
//Loads the model
  loadModel()async{
    await Tflite.loadModel(
      model: "assets/model1.tflite",
      labels: "assets/labels.txt"
    );
  }

  pickImage() async{
    var image = await picker.pickImage(source: ImageSource.camera);
    if(image == null) 
    return null;

    setState(() {
      _image=File(image.path);
    }); 
    classifyImage(_image);
  }

  pickGalleryImage() async{
    var image= await picker.pickImage(source: ImageSource.gallery);
    if(image == null)
    return null;

    setState(() {
      _image=File(image.path);
    });
    classifyImage(_image);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child:Container(
          height: 850,
          width:MediaQuery.of(context).size.width,
          child: 
          Scaffold(
            appBar: AppBar(
          elevation: 10,
          shadowColor: Colors.red,
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text(
            "Enter Details",
          style:TextStyle(
            fontFamily: 'Times New Roman',
            fontSize: 23,
            color: Colors.blue.shade400,
            fontWeight: FontWeight.w500,
          ) ,
          ),
        ),
        body: Container(
          color: Colors.black,
          padding: EdgeInsets.symmetric(horizontal: 25,
          vertical: 35),
          child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 _loading == true?
                    Padding(
                      padding: EdgeInsets.fromLTRB(15, 80, 15, 30),
                      child:Text('\t\t\t\t\t\tUpload \t\tthe \t\tSnake\t \t\t\t\t\t\t\t\t\t\t\t\t\t\t Image !!!',
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Times New Roman',
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.italic,
                      color: Colors.pinkAccent,
                    ),
                    ),
                    ):
                    Container(
                      padding:EdgeInsets.fromLTRB(10, 20, 10, 20),
                      child: Column(
                        children: [
                          Container(
                            height: 285,
                            width: 285,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.file(
                                _image,
                              fit:BoxFit.fill,
                              ),
                            ),
                          ),
                          // Divider(
                          //   height: 25,
                          //   thickness: 1,
                          // ),
                          // _output!= null?Text(
                          //   'The snake is:${_output[0]['label']}!',
                          //   style: TextStyle(
                          //     color: Colors.white,
                          //     fontSize: 18,
                          //     fontWeight: FontWeight.w400,

                          //   ),
                          // ):Container(),
                          Divider(
                            height:25,
                            thickness: 1,
                          )
                        ],
                      ),
                ),
                Container(
                  child: Column(
                    children: [
                       Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding:EdgeInsets.fromLTRB(30, 0,10, 15),
                  child: MaterialButton(
                    padding: EdgeInsets.all(15),
                    splashColor: Colors.red,
                    shape: CircleBorder(),
                    onPressed: (){
                      pickImage();
                    },
                    elevation:10 ,
                    color: Colors.deepPurple.shade900,
                    child: Icon(
                      Icons.camera_alt_rounded,
                      color:Colors.white,
                      size: 40,
                    ),
                    ),
                ),
                SizedBox(
                  width: 10,
                ),
                Padding(
                  padding:EdgeInsets.fromLTRB(30, 0, 50, 15),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.deepPurple.shade900,
                      elevation: 10,
                      shape:CircleBorder(),
                      padding: EdgeInsets.all(15),  
                      onPrimary: Colors.red,
                    ),
                    onPressed: (){
                      pickGalleryImage();
                    }, 
                    child:Icon(
                      Icons.image,
                      color: Colors.white,
                      size: 40,
                    ) , 
                    ),
                  ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child:Text(
                'Location:',
                style: TextStyle(
                  fontSize: 23,
                  fontFamily: 'Times New Roman',
                  color: Colors.white,
                  
                ),
              ) ,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(50, 15, 50, 10),
              child:Form(
                key: _formKey,
                child: DropdownButtonFormField(
                      autofocus: true,
                      focusColor:Colors.blue,
                      alignment:Alignment.center,
                      decoration:InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.blue,
                            width: 2
                            ),
                            borderRadius: BorderRadius.circular(25),
                        ),
                        border:OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 2
                            ),
                        ),

                      ),
                      items: items.map((valueItem) =>
                      DropdownMenuItem(
                        alignment: Alignment.center,
                      value:valueItem ,
                      child: Text(valueItem,
                      style: TextStyle(
                        fontFamily: 'Times New Roman',
                      ),),
              ),
               ).toList(),
               elevation: 15,
              hint: Text(
                    'Select a location',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Times New Roman',
                      color: Colors.greenAccent.shade700,
                    )
              ),
              dropdownColor: Colors.blue.shade900,
              icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.indigo,
                    size: 40,
              ),
              iconSize: 40,
              style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
              ),
              value: value,
              onChanged: (newValue){
                    setState(() {
                    value=newValue.toString();
                    },
              );
              },
              validator: (value) => value == null ? 'Please enter the location where snake was found' : null,
              ),
              ), 
              ),
            
            SizedBox(
              height: 20,
            ),
            MaterialButton(
              padding: EdgeInsets.all(15),
              onPressed: (){
                 if(_formKey.currentState!.validate()){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>Prediction()));
                }
              },
              textColor: Colors.white,
              color:Colors.red.shade900,
              splashColor: Colors.redAccent,
              elevation: 10,
              shape:RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
                side: BorderSide(color: Colors.red.shade900),
              ) ,
              height:60 ,
              minWidth:160 ,
              child:Text(
                "Submit",
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Times New Roman',
                  fontWeight: FontWeight.bold,
                ),
              ) ,

            ),
                      
                    ],
                  ),
                )
              ],
            ),
          ),

        ),
          ),
      
    );

  }

  
}