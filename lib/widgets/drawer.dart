
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/c2.png'),
                ),
                SizedBox(width: width*0.03,),
                Text('Aya Yasser',style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),)
              ],
            ),
            SizedBox(height: height*0.03,),
            const Divider(
              height: 1,
              thickness: 2,
              indent: 20,
              endIndent: 20,
            ),
            SizedBox(height: height*0.09,),
            Text('Your Reservations ',style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),),
            SizedBox(height: height*0.04,),
            Text('Payment ',style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),),
            SizedBox(height: height*0.04,),
            Text('Startup ',style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),),
            SizedBox(height: height*0.04,),
            Text('Sittings ',style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),),
            SizedBox(height: height*0.04,),
            Text('help ',style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),),
            SizedBox(height: height*0.04,),
            Text('Logout ',style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),),
          ],
        ),
      ),
    );
  }
}
