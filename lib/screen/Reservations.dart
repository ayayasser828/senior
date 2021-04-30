
import 'package:flutter/material.dart';

class Reservation extends StatelessWidget {
  static const String routeName = "/reservation";
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Container(
        width: width,
        height: height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height*0.07,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: InkWell(
                  onTap: () { Navigator.of(context).pop();},
                  child: Icon(Icons.arrow_back,size: 30,)),
            ),
            SizedBox(height: height*0.03,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  SizedBox(width: width*0.15,),
                  Container(
                    width: width*0.3,
                    height: height*0.05,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.red[600],
                        boxShadow: [
                         BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 8,
                          offset: Offset(0, 3), // changes position of shadow
                       ),]
                    ),
                    child: Text('Upcoming',style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,

                    ),),
                  ),
                  SizedBox(width: width*0.01,),
                  Container(
                    width: width*0.3,
                    height: height*0.05,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white,
                        boxShadow: [
                         BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 8,
                          offset: Offset(0, 3), // changes position of shadow
                       ),]
                    ),
                    child: Text('Past',style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,

                    ),),
                  ),
                ],
              ),
            )
        ]
        ),
      ),
    );
  }
}
