import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:senior/provider/room_provider.dart';


class Rooms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var rooms = Provider.of<RoomProvider>(context).item;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: width,
            height: height * 0.7,
            child: Image.asset(
              'assets/images/w2.jpg',
              width: width,
              height: height * 0.5,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
          SizedBox(
            height: height * 0.06,
          ),
          Text(
            '',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
