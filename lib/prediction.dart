
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:snake_breed_prediction/MainScreen.dart';
import 'package:snake_breed_prediction/panelWidget.dart';

// ignore: must_be_immutable
class Prediction extends StatefulWidget {
  String value;
  List output;
  File image;
  Prediction({required this.value,required this.output,required this.image});
  @override
  _PredictionState createState() => _PredictionState(value,output,image);
}

class _PredictionState extends State<Prediction> {
  final db =FirebaseFirestore.instance;
  final panelController = PanelController();
  String value;
  List output;
  File image;
  _PredictionState(this.value,this.output,this.image);
  @override
  Widget build(BuildContext context) {
    final panelheightClosed = MediaQuery.of(context).size.height*0.14;
    final panelheightOpen = MediaQuery.of(context).size.height*0.5;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
          elevation: 10,
          backgroundColor: Colors.black,
          shadowColor: Colors.red,
          centerTitle: true,
          title: Text(
            "Description",
          style:TextStyle(
            fontFamily: 'Times New Roman',
            fontSize: 23,
            color: Colors.blue.shade400,
            fontWeight: FontWeight.w500,
          ) ,
          ),
          actions: [
            IconButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>MainScreen()));
              }, 
              icon:Icon(
                Icons.exit_to_app_sharp,
                size:23,
              ), 
              ),
          ],
        ),
        body:SlidingUpPanel(
          minHeight: panelheightClosed,
          maxHeight: panelheightOpen,
          // parallaxEnabled: true,
          // parallaxOffset:0.5,
          controller: panelController,
          borderRadius:BorderRadius.vertical(top: Radius.circular(18)),
          panelBuilder: (controller)=>PanelWidget(
            controller:controller,
            panelController:panelController,
            value:value
          ),
          body: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.all(15),
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            // border: Border.all(color: Colors.blue,width:1.5),
          ),
          child: Column(
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.all(25.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    color: Colors.blue,
                    height: 310,
                    width: 315,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child:Container(
                        height: 280,
                        width: 285,
                        child: Image.file(
                        image,
                        fit: BoxFit.fill,),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Card(
                  margin: EdgeInsets.all(10),
                  color: Colors.black,
                  shadowColor: Colors.red,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(35, 5, 20, 5),
                            child: Text(
                            output[0]['label'],
                            style: TextStyle(
                            fontFamily: 'Times New Roman',
                            fontSize: 24,
                            color: Colors.white,
                  ),
                ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                            child: CircleAvatar(
                              radius: 24,
                              backgroundColor:Colors.green ,
                              child: Text(
                              '${double.parse((output[0]['confidence']).toStringAsFixed(2))}',
                              style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Times New Roman',
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                  ),
                ),
                  ),
                          ),
                
                     ],
                      ),
                      
                      Container(
                        height: 25,
                        child: StreamBuilder<QuerySnapshot>(
                          stream: db.collection('Snake').snapshots(),
                          builder:(context,snapshot) {
                            if(snapshot.hasData){
                              return ListView.builder(
                                itemCount: snapshot.data!.docs.length,
                                itemBuilder:(context,index){
                                  DocumentSnapshot ds = snapshot.data!.docs[index];
                                  if(output[0]['label']== ds['Name']){
                                    return Padding(
                                      padding: EdgeInsets.fromLTRB(40, 0,5, 0),
                                      child: Text(
                                        ds['Type'],
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: 'TIMES NEW ROMAN',
                                          color: Colors.white
                                        ),
                                      ),
                                    );
                                  }else{
                                    return Container(
                                      height: 0,
                                    );
                                  }
                                } 
                                );
                            }else if(snapshot.hasError){
                  return CircularProgressIndicator();
                }else{
                  return CircularProgressIndicator();
                }

                          }
                          ),

                      ),
                      SizedBox(
                        height: 5,

                      ),

                    ],
                  ),
                ),
              ),
            ),
            
          ],
        ),
        ),
        
        )
        
      
    );
  }
}