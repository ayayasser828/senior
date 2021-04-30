
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:senior/screen/verify2.dart';
import 'package:senior/services/auth.dart';


class Verify extends StatefulWidget {
  static const String routeName = "/verify";
  @override
  _VerifyState createState() => _VerifyState();
}
class _VerifyState extends State<Verify> {
  String _phone = Auth.phoneN;
  GlobalKey<ScaffoldState> scaffoldKey;
  final _formKey = GlobalKey<FormState>();

  TextEditingController _controller = TextEditingController();
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
                    Text('you will receive a 6 digit code for phone number verification.',
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
                                Form(
                                  key: _formKey,
                                  child: Container(
                                    width: width*0.7,
                                    height: height*0.08,
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      textAlignVertical: TextAlignVertical.bottom,
                                      validator: (input){
                                        if (input.isEmpty){
                                          return'Please enter your phone';
                                        }
                                        else if(input.length != 10){
                                          return 'valid number';
                                        }
                                        return null;
                                      },
                                      onSaved: (input) => _phone = input,
                                      onChanged: (input){
                                        setState(() {
                                          _phone = input;
                                        });
                                      },
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
                                      controller: _controller,

                                    ),
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
                      onTap: () async {
                        Auth.phoneN = "$_phone";
                        if(_formKey.currentState.validate()) {
                          print(3);
                          Auth().initVerifyCall(_phone, context);
                          Navigator.of(context).pushNamed(Verify2.routeName);
                          print(2);
                        }else{
                          print(1);
                        }
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
