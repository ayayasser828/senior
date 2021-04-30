
import 'package:flutter/material.dart';

class Payment extends StatelessWidget {
  static const String routeName = "/payment";
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
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
            SizedBox(height: height*0.02,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text('Payment Methods',style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,

              ),),
            ),
            SizedBox(height: height*0.04,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: [
                  Container(
                    width: width*0.1,
                    height: height*0.05,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/cash.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: width*0.04,),
                  Text('Cash',style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,

                  ),),
                ],
              ),
            ),
            SizedBox(height: height*0.04,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text('Add a credit or debit card',style: TextStyle(
                fontSize: 20,
                //fontWeight: FontWeight.bold,
                color: Colors.lightBlue[900],

              ),),
            ),

          ],
        ),
      ),
    );
  }
}
