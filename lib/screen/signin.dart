


import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:senior/screen/verify.dart';

class Signin extends StatelessWidget {
  static const String routeName = "/signin";
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ListView(
        children: [
          Stack(
           // alignment: Alignment.center,
            children: [
              Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/b.jpg'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.white.withOpacity(0.6), BlendMode.dstATop),
                  ),
                ),
              ),
              Positioned(
                width: width,
                height: height,
                left: 20,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: height*0.2,),
                    Text('HELLO!',style: TextStyle(
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),),
                    Text('We are WorkySpace.',style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),),
                    SizedBox(height: height*0.01,),
                    Text('Create an account or login to begin adventure.',style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),),
                    SizedBox(height: height*0.15,),
                    InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, Verify.routeName);
                      },
                      child: Container(
                        height: height*0.08,
                        width: width*0.9,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(20),
                          
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.phone_android),
                            SizedBox(width: width*0.02,),
                            Text('Continue with phone',style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),),
                          ],
                        )
                      ),
                    ),
                    SizedBox(height: height*0.02,),
                    InkWell(
                      child: Container(
                        height: height*0.08,
                        width: width*0.9,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(20),

                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(width: width*0.01,),
                            Container(
                              width: width*0.04,
                              height: height*0.03,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/images/g.png'),
                                  fit: BoxFit.cover,
                                  ),
                              ),
                            ),
                            SizedBox(width: width*0.02,),
                            Text('Continue with Google',style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),),
                          ],
                        )
                      ),
                    ),
                    SizedBox(height: height*0.02,),
                    InkWell(
                      child: Container(
                        height: height*0.08,
                        width: width*0.9,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(20),

                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(width: width*0.05,),
                            Container(
                              width: width*0.04,
                              height: height*0.04,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/images/fb.png'),
                                  fit: BoxFit.cover,
                                  ),
                              ),
                            ),
                            SizedBox(width: width*0.02,),
                            Text('Continue with Facebook',style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),),
                          ],
                        )
                      ),
                    ),
                  ],
                ),
              ),

            ],
          )
        ],
      ),
    );
  }
}
