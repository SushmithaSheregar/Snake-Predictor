
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:snake_breed_prediction/MainScreen.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimatedSplashScreen(
        backgroundColor: Colors.red.shade900,
        splashTransition: SplashTransition.scaleTransition,
        splashIconSize: 500,
        duration: 1500,
        splash:Center(
          child:Column(
           mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             CircleAvatar(
               
               backgroundImage: AssetImage('assets/s4.jpg'),
               radius: 140,
             ),
             SizedBox(
              height: 30,
             ),
             Text(
                'Snake Predictor',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Times New Roman',
                ),
              ) 
           ],
          ),
        ), 
        nextScreen: MainScreen()
        ),
    );
  }
}
