
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:snake_breed_prediction/Precautions.dart';
import 'package:snake_breed_prediction/detailsScreen.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({ key }) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin{
   
  
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.black87,Colors.black87],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          ),
      ),
      child: Scaffold(
        backgroundColor: Colors.black87,
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
            ),
            Center(
              child: CircleAvatar(
                backgroundColor:Colors.indigo.shade900,
                radius: 113,
                child: CircleAvatar(
                backgroundImage: AssetImage("assets/s4.jpg"),
                radius: 110,
              ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Center(
              child: Text(
                "Welcome to Snake Predictor !",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 24,
                  fontFamily:'Times New Roman',
                  fontWeight: FontWeight.bold,
                ),
              )
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  "Want to Identify the snake ?\nJust Click on Search Button.",
                  style: TextStyle(
                    fontSize: 17,
                    fontFamily: 'Times New Roman',
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              MaterialButton(
                height: 70,
                minWidth: 195,
                hoverColor: Colors.red,
                padding: EdgeInsets.all(20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)
                ),
                splashColor: Colors.red,
                elevation: 10,
                color: Colors.indigo.shade700,
                textColor: Colors.white,
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SnakeDescription()));
                },
                child: Text(
                  "Search",
                  style: TextStyle(
                    fontSize:23,
                    fontFamily: 'Times New Roman',
                    fontWeight: FontWeight.bold,
                  ),
                  ),
              ),
              SizedBox(
                height: 18,
              ),
              MaterialButton(
                height: 70,
                minWidth: 190,
                hoverColor: Colors.red,
                padding: EdgeInsets.all(20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)
                ),
                splashColor: Colors.red,
                elevation: 10,
                color: Colors.indigo.shade700,
                textColor: Colors.white,
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Precautions()));
                },
                child: Text(
                  "Precautions",
                  style: TextStyle(
                    fontSize:23,
                    fontFamily: 'Times New Roman',
                    fontWeight: FontWeight.bold,
                  ),
                  ),
              )
            
          ],
        ),
      ),
      

    );
}
}