
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:senior/screen/verify2.dart';

class Verify extends StatelessWidget {
  static const String routeName = "/verify";
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ListView(
        children: [
          Stack(
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
                left: 20,
                top: 20,
                width: width,
                height: height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                        onTap: () { Navigator.of(context).pop();},
                        child: Icon(Icons.arrow_back)),
                    SizedBox(height: height*0.05,),
                    Text('Enter your phone',style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),),
                    SizedBox(height: height*0.01,),
                    Text('you will receive a 4 digit code for phone number verification.',
                      style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),),
                    SizedBox(height: height*0.03,),
                    Container(
                      height: height*0.15,
                      width: width*0.9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white.withOpacity(0.9),
                      ),
                      child: Column(
                        children: [
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(width: width*0.07,),
                                Container(
                                  width: width*0.07,
                                  height: height*0.03,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('assets/images/e.png'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(width: width*0.03,),
                                Text('Egypt',style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),),
                              ],
                            ),
                            width: width*0.9,
                            height: height*0.07,
                          ),
                          const Divider(
                            height: 1,
                            thickness: 2,
                            indent: 20,
                            endIndent: 20,
                          ),
                          Container(
                            width: width*0.9,
                            height: height*0.06,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(width: width*0.07,),
                                Text('+20',style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),),
                                SizedBox(width: width*0.02,),
                                Container(
                                  width: width*0.7,
                                  height: height*0.08,
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    textAlignVertical: TextAlignVertical.bottom,
                                    decoration: InputDecoration(
                                      alignLabelWithHint: true,
                                      hintText: 'Phone number ',
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                    cursorColor: Colors.white,
                                    cursorHeight: 0,
                                    cursorWidth: 0,
                                    showCursor: false,
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: height*0.03,),
                    InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, Verify2.routeName);
                      },
                      child: Container(
                          height: height*0.08,
                          width: width*0.9,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.9),
                            borderRadius: BorderRadius.circular(20),

                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('Continue ',style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),),
                              SizedBox(width: width*0.02,),
                              Icon(Icons.arrow_forward),
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
