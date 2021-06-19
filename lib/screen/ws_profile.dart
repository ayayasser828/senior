
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:senior/model/workspaceAPImodel.dart';

class WsProfile extends StatelessWidget {

  static const String routeName = "/wsprofile";
  WsProfile({
    this.id,
    this.profilePicture,
    this.name,
    this.location,
    this.mobileOne,
    this.mobileTwo,
    this.openTime,
    this.closeTime,
    this.serveFood,
    this.wifi,
  });

  final int id;
  final String profilePicture;
  final String name;
  final String location;
  final String mobileOne;
  final String mobileTwo;
  final String openTime;
  final String closeTime;
  final String serveFood;
  final String wifi;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: width,
              height: height,
              child: Stack(
                children: [
                  Container(
                    width: width,
                    height: height*0.5,
                    child: Image.asset('assets/images/w2.jpg',
                      width: width,
                      height: height*0.5,
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: width,
                      height: height*0.55,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: height*0.05,),
                            Text(name,style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),),
                            Text(location,style: TextStyle(
                              fontSize: 17,
                              color: Colors.black54,
                            ),),
                            SizedBox(height: height*0.02,),
                            Container(
                              width:width,
                              height: height*0.13,
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          color: Colors.grey[300],
                                        ),
                                        width: width*0.15,
                                        height: height*0.08,
                                        alignment: Alignment.center,
                                        child: Icon(Icons.wifi,color: Colors.lightGreen[900],),
                                      ),
                                      Text(wifi,style: TextStyle(fontSize: 14),)
                                    ],
                                  ),
                                  SizedBox(width: width*0.02,),
                                  Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          color: Colors.grey[300],
                                        ),
                                        width: width*0.15,
                                        height: height*0.08,
                                        alignment: Alignment.center,
                                        child: Icon(Icons.fastfood_sharp,color: Colors.lightGreen[900],),
                                      ),
                                      Text(serveFood,style: TextStyle(fontSize: 14),)
                                    ],
                                  ),
                                  SizedBox(width: width*0.04,),
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Icon(Icons.access_time_sharp,size: 16,),
                                          SizedBox(width: width*0.01,),
                                          SizedBox(height: height*0.05,),
                                          Text('open at'),
                                          SizedBox(width: width*0.02,),
                                          Text(openTime,style: TextStyle(color: Colors.lightGreen[900],fontWeight: FontWeight.bold),)
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(width: width*0.01,),
                                          Icon(Icons.access_time_sharp,size: 16,),
                                          SizedBox(width: width*0.01,),
                                          Text('close at'),
                                          SizedBox(width: width*0.02,),
                                          Text(closeTime,style: TextStyle(color: Colors.lightGreen[900],fontWeight: FontWeight.bold),)
                                        ],
                                      ),
                                    ],
                                  )

                                ],
                              ),
                            ),
                            Row(children: [
                              Icon(Icons.phone),
                              SizedBox(width: width*0.02,),
                              Text(mobileOne,style: TextStyle(color: Colors.lightGreen[900],fontWeight: FontWeight.bold),),
                              SizedBox(width: width*0.08,),
                              Icon(Icons.phone_outlined),
                              SizedBox(width: width*0.02,),
                              Text(mobileTwo,style: TextStyle(color: Colors.lightGreen[900],fontWeight: FontWeight.bold),),

                            ],),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      child: Container(
                        width: width,
                        height: height*0.2,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(50)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text('price'),
                                Text('20 LE/hour')
                              ],
                            ),
                            InkWell(
                              child: Container(
                                width: width*0.3,
                                height: height*0.05,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.lightGreen[900],
                                  borderRadius: BorderRadius.circular(25)
                                ),
                                child: Text('Book Now',style: TextStyle(color: Colors.white),),
                              ),
                            )
                          ],
                        ),
                  ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
