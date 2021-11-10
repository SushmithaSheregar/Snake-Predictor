import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Precautions extends StatefulWidget {
  const Precautions({ Key? key }) : super(key: key);

  @override
  _PrecautionsState createState() => _PrecautionsState();
}

class _PrecautionsState extends State<Precautions> {
  final controller=CarouselController();
  int activeIndex=0;
  final images=[
    Image.asset('assets/p1.jpeg'),
    Image.asset('assets/p2.jpeg'),
    Image.asset('assets/p3.jpeg'),
    Image.asset('assets/p4.jpeg'),
    Image.asset('assets/p5.jpeg'),
    Image.asset('assets/p6.jpeg'),
    Image.asset('assets/p7.jpeg'),
    Image.asset('assets/p8.jpeg'),
    Image.asset('assets/p9.jpeg'),
    Image.asset('assets/p10.jpeg'),
    Image.asset('assets/p11.jpeg'),
    Image.asset('assets/p12.jpeg')
    ];
  @override
  Widget build(BuildContext context) {
    
    return Container(
      child: Scaffold(
        appBar: AppBar(
          elevation: 10,
          shadowColor: Colors.red,
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text(
            "Precautions",
          style:TextStyle(
            fontFamily: 'Times New Roman',
            fontSize: 23,
            color: Colors.blue.shade400,
            fontWeight: FontWeight.w500,
          ) ,
          ),
        ),
       resizeToAvoidBottomInset:true,
      //  backgroundColor: Colors.black54,
      body: Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CarouselSlider(
              carouselController: controller,
              items: [
                Container(
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.black87,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child:Image(
                          height: 200,
                        image:AssetImage(
                          'assets/p1.jpeg',
                        ), 
                        ), 
                      ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            "Try to see the snakes color, body scales, head.\nIf not don't waste your time looking for the snake or trying to kill it",
                            style: TextStyle(
                              fontFamily: 'Times New Roman',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        )
                    ],
                  ),
                  
                ),

                Container(
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.black87,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child:Image(
                        image:AssetImage(
                          'assets/p2.jpeg',
                        ), 
                        ), 
                      ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            "The most important thing is the victim should remain calm, relaxed and fearless. Otherwise it will increase the blood flow and the heart rate resulting in rapid spread of venom",
                            style: TextStyle(
                              fontFamily: 'Times New Roman',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        )
                    ],
                  ),
                  
                ),

                Container(
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.black87,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child:Image(
                        image:AssetImage(
                          'assets/p3.jpeg',
                        ), 
                        ), 
                      ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            "The affected part of the victim should move as less as possible while moving the victim and it should remain below the level of the victim's heart",
                            style: TextStyle(
                              fontFamily: 'Times New Roman',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        )
                    ],
                  ),
                  
                ),

                Container(
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.black87,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child:Image(
                          height: 300,
                        image:AssetImage(
                          'assets/p4.jpeg',
                        ), 
                        ), 
                      ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            "Let the victim sit on the floor, that will result in load stretched",
                            style: TextStyle(
                              fontFamily: 'Times New Roman',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        )
                    ],
                  ),
                  
                ),

                Container(
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.black87,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child:Image(
                          height: 200,
                        image:AssetImage(
                          'assets/p5.jpeg',
                        ), 
                        ), 
                      ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            "Remove tight fitting clothes, any rings, wrist watch etc from the affected body part or on the wound itself, otherwise it might cause swelling",
                            style: TextStyle(
                              fontFamily: 'Times New Roman',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        )
                    ],
                  ),
                  
                ),

                Container(
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.black87,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child:Image(
                          height:250,
                        image:AssetImage(
                          'assets/p6.jpeg',
                        ), 
                        ), 
                      ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            "Do not cut the wound as it will increase the chances for infection",
                            style: TextStyle(
                              fontFamily: 'Times New Roman',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        )
                    ],
                  ),
                  
                ),

                Container(
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.black87,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child:Image(
                          height: 250,
                        image:AssetImage(
                          'assets/p7.jpeg',
                        ), 
                        ), 
                      ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            "Do not suck the venom, because it not only removes a negligible amount of venom but also might poison the helper",
                            style: TextStyle(
                              fontFamily: 'Times New Roman',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        )
                    ],
                  ),
                  
                ),

                Container(
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.black87,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child:Image(
                          height: 250,
                        image:AssetImage(
                          'assets/p8.jpeg',
                        ), 
                        ), 
                      ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            "Do not eat drink anything, particularly caffeine or alcohol as it increases the heart rate and blood flow",
                            style: TextStyle(
                              fontFamily: 'Times New Roman',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        )
                    ],
                  ),
                  
                ),

                Container(
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.black87,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child:Image(
                          height: 250,
                        image:AssetImage(
                          'assets/p9.jpeg',
                        ), 
                        ), 
                      ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            "Arrange a long bandage or clean cloth, wrap up the wound loose enough to insert a finger and wrap it up till the top",
                            style: TextStyle(
                              fontFamily: 'Times New Roman',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        )
                    ],
                  ),
                  
                ),

                Container(
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.black87,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child:Image(
                        image:AssetImage(
                          'assets/p10.jpeg',
                        ), 
                        ), 
                      ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            "Do not use a tourniquet as it could potentially restrict the blood flow to the affected area",
                            style: TextStyle(
                              fontFamily: 'Times New Roman',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        )
                    ],
                  ),
                  
                ),

                Container(
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.black87,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child:Image(
                        image:AssetImage(
                          'assets/p11.jpeg',
                        ), 
                        ), 
                      ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            "Do not use ice on the wound because it might increase the damage",
                            style: TextStyle(
                              fontFamily: 'Times New Roman',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        )
                    ],
                  ),
                  
                ),

                Container(
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.black87,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child:Image(
                        image:AssetImage(
                          'assets/p12.jpeg',
                        ), 
                        ), 
                      ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            "Immobilized the body part with a wooden stick and tie to the bandage or a cloth before you transfer the victim to the hospital",
                            style: TextStyle(
                              fontFamily: 'Times New Roman',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        )
                    ],
                  ),
                  
                ),
              ],
              options:CarouselOptions(
                enableInfiniteScroll: true,
                initialPage: 0,
                height: 450,
                // autoPlay:true, 
                autoPlayInterval: Duration(
                  seconds: 3,
                ),
                enlargeCenterPage: true,
                onPageChanged: (index,reason)=>
                setState(()=> activeIndex=index),
                ) ,
            ),

              SizedBox(
                height: 32,
              ),
              buildIndicator(),
              SizedBox(
                height: 32,
              ),
              buildButton(stretch:false),
          ],
        ) ,
        ),

      ),
      
    );
  }
  buildIndicator() {
    return AnimatedSmoothIndicator(
      onDotClicked:(int index){
        controller.animateToPage(index);
      } ,

      activeIndex: activeIndex, 
      count: images.length,
      effect: SlideEffect(
        dotHeight: 12,
        dotWidth: 12,
        activeDotColor: Colors.black,
        dotColor: Colors.grey,

      ),
      );
  }

  buildButton({bool stretch=false})=>
  Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      ClipOval(
        child:ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 5,
          primary: Colors.indigo.shade900,
          onPrimary: Colors.white,
          padding: EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 15,
          )
        ),
        onPressed:previous, 
        child: Icon(
          Icons.arrow_back,
          size:32
        ),
        ), 
      ),
      
        stretch?Spacer():SizedBox(width: 32,),
        ClipOval(
        child:ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 5,
          primary: Colors.indigo.shade900,
          onPrimary: Colors.white,
          padding: EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 15,
          )
        ),
        onPressed:next, 
        child: Icon(
          Icons.arrow_forward,
          size:32
        ),
        ), 
      ),

    ],

  );

  void previous() {
    controller.previousPage(duration: Duration(milliseconds: 500));
  }

  void next() {
    controller.nextPage(duration: Duration(milliseconds: 500));
  }
}