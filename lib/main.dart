import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:senior/screen/homepage.dart';
import 'package:senior/screen/signin.dart';
import 'package:senior/screen/verify.dart';
import 'package:senior/screen/verify2.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
        home: Signin(),
        routes: {
          Signin.routeName: (context) => Signin(),
          Verify.routeName: (context) => Verify(),
          Verify2.routeName: (context) => Verify2(),
          HomePage.routeName: (context) => HomePage(),
        },

      ),

    );
  }
}

