import 'dart:async';

import 'package:flutter/material.dart';
import 'package:senior/screen/homepage.dart';
import 'package:senior/screen/signin.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      checkData();
    });
    // TODO: implement initState

    super.initState();
  }
  checkData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.getString("uid") !=null){
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (context) => HomePage()),
              (route) => false);
    }else{
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (context) => Signin()),
              (route) => false);
    }
  }
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/w4.jpg'),
                fit: BoxFit.cover,

              ),
            ),
          ),
          Positioned(
            top: 120,
            left: 10,
            child: Text('Worky',style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.black,
                fontFamily:'Pacifico'
            ),),
          ),
          Positioned(
            bottom: 150,
            left: 45,
            child: Text('Space',style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontFamily:'Pacifico'
            ),),
          ),
        ],
      ),
    );
  }
}
