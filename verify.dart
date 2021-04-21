import 'package:flutter/material.dart';

class Verify extends StatelessWidget {
  static const String routeName = "/verify";
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'phone number',
            ),
          ),
          OutlinedButton(
            onPressed: () {
              print('Button pressed');
            },
            child: Text('Continue'),
          ),
        ],
      ),
    );
  }
}
