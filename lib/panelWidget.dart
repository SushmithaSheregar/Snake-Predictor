import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class PanelWidget extends StatelessWidget {
  final ScrollController controller;
  final PanelController panelController;
  final String value ;
  final db =FirebaseFirestore.instance;
  PanelWidget({
    Key? key,required this.controller,required this.panelController,required this.value
  }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(5),
      controller:controller,
      children: [
        SizedBox(
          height: 12,
        ),
        buildDragHandle(),
        SizedBox(
          height: 12,
        ),
        SizedBox(
          height: 10,
        ),
        buildAboutText(),
        SizedBox(height: 20,),
      ],

    );
  }

Widget  buildAboutText() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: Text(
              "HOSPITALS",
              style: TextStyle(
                fontFamily: 'Times New Roman',
                fontSize: 24,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              height: 700,
              child:StreamBuilder<QuerySnapshot>(
              stream: db.collection('Hospitals').snapshots(),
              builder:(context, snapshot) {
                if(snapshot.hasData){
                  return ListView.builder(
                    padding: EdgeInsets.all(10),
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder:(context, index){
                      DocumentSnapshot ds = snapshot.data!.docs[index];
                      if(value==ds['Area']){
                        return ListTile(
                        title: Text(
                          ds['Hospital Name'],
                          style: TextStyle(
                            fontFamily: 'Times New Roman',
                            fontWeight: FontWeight.bold,
                            color: Colors.orange.shade900,
                            fontSize: 23,
                          ),
                        ),
                        subtitle: Column(
                          children: [
                            Row(
                              children: [
                                // Text(
                                //   'Vaccine :',
                                //   style: TextStyle(
                                //     fontSize: 19,
                                //     fontFamily: 'Times New Roman',
                                //     color: Colors.black,
                                //   ),
                                // ),
                                // SizedBox(
                                //   width: 10,
                                // ),
                                Text(
                                  ds['Vaccine'],
                                  style: TextStyle(
                                    fontSize: 19,
                                    fontFamily: 'Times New Roman',
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600
                                  ),
                                )
                              ],
                            ),
                            Text(
                              ds['Address'],
                              style: TextStyle(
                                fontFamily: 'Times New Roman',
                                fontSize: 19,
                                fontWeight: FontWeight.w700
                              ),
                            )
                          ],
                        ),
                      );
                      }
                      else{
                        return Container(height: 0,);
                      }
                    },
                    );

                }else if(snapshot.hasError){
                  return CircularProgressIndicator();
                }else{
                  return CircularProgressIndicator();
                }
              }
            ), 
            ),
          )
        ],
      ),

    );
  }

Widget  buildDragHandle() {
    return GestureDetector(
      onTap: togglePanel,
      child:Center(
      child:Container(
      width: 40,
      height: 10,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    ),
    );
    
    
  }
  void togglePanel() => panelController.isPanelOpen
  ? panelController.close()
  : panelController.open() ;
}