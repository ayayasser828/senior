
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:senior/provider/user_preferences.dart';
import 'package:senior/screen/homepage.dart';
import 'package:senior/services/auth.dart';


class Verify2 extends StatefulWidget {
  static  String smsCode = '';
  // String userId = Auth().auth.currentUser.uid;
  static const String routeName = "/verify2";

  @override
  _Verify2State createState() => _Verify2State();
}

class _Verify2State extends State<Verify2> {
  String _phone = Auth.phoneN;

  UserPreferences userPreferences;

  StreamController<ErrorAnimationType> errorController = StreamController<ErrorAnimationType>();

  TextEditingController textEditingController = TextEditingController();




  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Aya hhhhh'),
          actions: <Widget>[
            TextButton(
              child: Text('Back'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }


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
                          child: Icon(Icons.arrow_back)
                      ),
                      SizedBox(height: height*0.07,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 80),
                        child: Text('code is sent to your phone',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),),
                      ),
                      SizedBox(height: height*0.05,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          width: width * 0.8,
                          height: height*0.08,
                          alignment: Alignment.center,
                          child: PinCodeTextField(
                            validator: (input){
                              if (input.isEmpty){
                                return'please enter code';
                              }
                              return null;
                            },
                            backgroundColor: Colors.transparent,
                            cursorColor: Colors.black,
                            keyboardType: TextInputType.number,
                            appContext: context,
                            length: 6,
                            obscureText: false ,
                            animationType: AnimationType.fade,
                            pinTheme: PinTheme(
                                shape: PinCodeFieldShape.box,
                                borderWidth: 1,
                                inactiveColor: Colors.black,
                                activeColor: Colors.black,
                                borderRadius: BorderRadius.circular(10),
                                fieldHeight: height*0.08,
                                fieldWidth: width * 0.1,
                                activeFillColor: Colors.black,
                                inactiveFillColor: Colors.black
                            ),
                            animationDuration: Duration(milliseconds: 300),
                            enableActiveFill: false,
                            errorAnimationController: errorController,
                            controller: textEditingController,
                            onCompleted: (v) {
                              print("Completed");
                            },
                            onChanged: (value) {
                              print(value);
                              Verify2.smsCode = value;
                            },
                            beforeTextPaste: (text) {
                              print("Allowing to paste $text");
                              return true;
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: height*0.03,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 100),
                        child: Text('Didnt recieve a code ?',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 120),
                        child: Text('request again',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),),
                      ),
                      SizedBox(height: height*0.05,),
                      InkWell(
                        onTap: () async{
                          Auth.phoneN = _phone;

                         await Auth().signInWithPhoneNumber(Verify2.smsCode, context);


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
                                Text('Verify and Create Account ',style: TextStyle(
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
                  ))
            ],
          )
        ],
      ),
    );
  }
}
