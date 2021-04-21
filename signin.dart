import 'package:flutter/material.dart';

class Signin extends StatelessWidget {
  static const String routeName = "/signin";
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              "https://www.google.com/imgres?imgurl=https%3A%2F%2Fi.pinimg.com%2Foriginals%2F5a%2F15%2F97%2F5a1597dd2755b133a83f1df77a7d82df.jpg&imgrefurl=https%3A%2F%2Fwww.pinterest.com%2Fpin%2F391461392587007329%2F&tbnid=IVRCox0OSLE3SM&vet=12ahUKEwjVsPfhn5DwAhUJ3RoKHZYPD40QMygBegUIARDXAQ..i&docid=1vH0yO_RoAps4M&w=640&h=1136&q=study%20wallpaper&safe=active&ved=2ahUKEwjVsPfhn5DwAhUJ3RoKHZYPD40QMygBegUIARDXAQ"),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Here We are',
            ),
            Text(
              'Create an account or login',
            ),
            TextButton(
              onPressed: () {
                print('button pressed');
              },
              child: Text('Continue with phone'),
            ),
            TextButton(
              onPressed: () {
                print('button pressed');
              },
              child: Text('Continue with facebook'),
            ),
            TextButton(
              onPressed: () {
                print('button pressed');
              },
              child: Text('Continue with google'),
            ),
          ],
        ),
      ),
    );
  }
}
