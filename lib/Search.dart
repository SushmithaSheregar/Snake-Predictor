import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:snake_breed_prediction/detailsScreen.dart';
import 'package:tflite/tflite.dart';

class Search extends StatefulWidget {
  const Search({ Key? key }) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  // GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final _formKey = GlobalKey<FormState>();
  bool _loading= true;
  late File _image;
  late List _output;
  final picker =ImagePicker();
  File? image;
  String? value;
  final items =['Mulund','Thane','Govandi','Vidyavihar','Mankhurd','Bhandup','Kanjurmarg','Powai'];

  @override
  void initState(){
    super.initState();
    loadModel().then((value){
      setState((){});
    });
  }

  @override
  void dispose(){
    super.dispose();
    Tflite.close();
  }
  
  classifyImage(File image) async {
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 13,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    
  }

  loadModel() async {
    await Tflite.loadModel(
      model: 'assets/model1.tflite',
      labels: 'assets/labels.txt'
    );
  }

  pickImage() async {
    var image = await picker.pickImage(source: ImageSource.camera);
    if(image == null)
    return null;
    setState(() {
      _image=File(image.path);
    });
    classifyImage(_image);
  }
  pickGalleryImage() async {
    var image = await picker.pickImage(source: ImageSource.gallery);
    if(image == null)
    return null;
    setState(() {
      _image=File(image.path);
    });
    classifyImage(_image);
  }

  

  // Future pickImage(ImageSource source) async{
  //   try {
  //     final image =await ImagePicker().pickImage(
  //       source:source );
  //       if(image==null)
  //       return;
  //       // final imageTeporary= File(image.path);
  //       final imagePermanent =await saveImagePermanently(image.path);
  //       setState(() {
  //         this.image = imagePermanent;
  //         });
  //   } on PlatformException catch (e) {
  //     print('Failed to pick image: $e');
      
  //   }
  // }
  // Future<File> saveImagePermanently(String imagePath) async {
  //   final directory = await getApplicationDocumentsDirectory();
  //   final name = basename(imagePath);
  //   final image = File('${directory.path}/$name');
  //   return File(imagePath).copy(image.path);

  // }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:Container(
        height:800,
        width:MediaQuery.of(context).size.width,
      child: Scaffold(
        backgroundColor: Colors.black87,
        resizeToAvoidBottomInset:true,
        appBar: AppBar(
          elevation: 10,
          shadowColor: Colors.red,
          backgroundColor:Colors.black ,
          centerTitle: true,
          title: Text(
            "Upload Image",
            style: TextStyle(
                  color: Colors.blue.shade400,
                  fontSize: 23,
                  fontFamily:'Times New Roman',
                  fontWeight: FontWeight.w500,
                ),
          ),

        ),
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment:   CrossAxisAlignment.center,
          children: [
            image!=null?
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 70,0 , 30),
              child: Container(
                height: 290,
                width: 290,
                child:ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child:Image.file(
                image!,
                fit: BoxFit.fill,
                // scale: 3.0,
              ), 
                ),
              )
              
            ):Padding(
              padding:EdgeInsets.fromLTRB(0, 70, 0, 30),
              child:Container(
                decoration: BoxDecoration(
                  boxShadow: [BoxShadow(color: Colors.red)],
                  shape: BoxShape.circle,
                  color: Colors.grey.shade200,
                ),
              padding:EdgeInsets.all(20) ,
              width: 260,
              height: 260,
              child:Center(
                child: Text(
                "Upload an Image",
                style: TextStyle(
                  color: Colors.red,
                  fontFamily: 'Times New Roman',
                  fontSize: 24,
                ),
              ),
              ),
            ), 
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding:EdgeInsets.fromLTRB(30, 0,10, 10),
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
                Padding(
                  padding:EdgeInsets.fromLTRB(30, 0, 50, 10),
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
                // autovalidateMode:AutovalidateMode.always,
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
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SnakeDescription()));
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
      ),
    ) ,
    );
    
  }
}