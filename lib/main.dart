import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:senior/screen/signin.dart';
import 'package:senior/screen/verify.dart';

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
        routes: {
          Signin.routeName: (context) => Signin(),
          Verify.routeName: (context) => Verify(),
        },

      ),

    )
  }
}

