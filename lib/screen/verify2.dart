
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:senior/screen/homepage.dart';


class Verify2 extends StatelessWidget {
  static  String smsCode = '';
  static const String routeName = "/verify2";
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
                                return'من فضلك ادخل كود التفعيل';
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
                            //errorAnimationController: errorController,
                            //controller: textEditingController,
                            onCompleted: (v) {
                              print("Completed");
                            },
                            onChanged: (value) {
                              print(value);
                              smsCode = value;
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
                        onTap: (){
                          Navigator.pushNamed(context, HomePage.routeName);
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
