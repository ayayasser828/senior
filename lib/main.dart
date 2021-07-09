import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:senior/model/history_model.dart';
import 'package:senior/model/workspaceAPImodel.dart';
import 'package:senior/provider/WorkspaceProvider.dart';
import 'package:senior/provider/history_provider.dart';
import 'package:senior/provider/search_provider.dart';
import 'package:senior/screen/Reservations.dart';
import 'package:senior/screen/homepage.dart';
import 'package:senior/screen/payment.dart';
import 'package:senior/screen/room.dart';
import 'package:senior/screen/signin.dart';
import 'package:senior/screen/splashScreen.dart';
import 'package:senior/screen/startup.dart';
import 'package:senior/screen/verify.dart';
import 'package:senior/screen/verify2.dart';
import 'package:senior/screen/ws_profile.dart';



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
          ChangeNotifierProvider.value(
            value: WorkspaceProvider(),
          ),
          ChangeNotifierProvider.value(
            value: WorkspaceApImodel(),
          ),
          ChangeNotifierProvider.value(
            value: HistoryProvider(),
          ),
          ChangeNotifierProvider.value(
            value: HistoryModel(),
          ),
          ChangeNotifierProvider.value(
            value: SearchProvider(),
          ),

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
          WsProfile.routeName: (context) => WsProfile(),
          Rooms.routeName: (context) => Rooms(),
          Startup.routeName: (context) => Startup(),
        },

      ),

    );
  }
}

