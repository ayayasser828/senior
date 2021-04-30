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
    return Scaffold(
      body: Center(
        child: Text("Aya :)"),
      ),
    );
  }
}
