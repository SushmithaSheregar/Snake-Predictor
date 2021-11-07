import 'package:flutter/material.dart';
import 'package:snake_breed_prediction/detailsScreen.dart';

class Prediction extends StatefulWidget {
  const Prediction({ Key? key }) : super(key: key);

  @override
  _PredictionState createState() => _PredictionState();
}

class _PredictionState extends State<Prediction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 10,
          shadowColor: Colors.red,
          backgroundColor: Colors.black,
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
        ),
        body:Column(
          children: [
            
          ],
        )
      
    );
  }
}