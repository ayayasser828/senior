import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:senior/screen/Reservations.dart';
import 'package:senior/screen/homepage.dart';
import 'package:senior/screen/payment.dart';
import 'package:senior/screen/signin.dart';
import 'package:senior/screen/splashScreen.dart';
import 'package:senior/screen/verify.dart';
import 'package:senior/screen/verify2.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp().whenComplete(() {
    print("completed");

  });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MultiProvider(
        providers: [


          ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
        routes: {
          Signin.routeName: (context) => Signin(),
          Verify.routeName: (context) => Verify(),
          Verify2.routeName: (context) => Verify2(),
          HomePage.routeName: (context) => HomePage(),
          Payment.routeName: (context) => Payment(),
          Reservation.routeName: (context) => Reservation(),
        },

      ),

    );
  }
}

