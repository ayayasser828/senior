
import 'package:flutter/material.dart';
import 'package:senior/widgets/history.dart';

class Reservation extends StatefulWidget {
  static const String routeName = "/reservation";

  @override
  _ReservationState createState() => _ReservationState();
}

class _ReservationState extends State<Reservation> {
  bool u=true;

  bool f=false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Container(
        width: width,
        height: height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height*0.07,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: InkWell(
                  onTap: () { Navigator.of(context).pop();},
                  child: Icon(Icons.arrow_back,size: 30,)),
            ),
            SizedBox(height: height*0.03,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  SizedBox(width: width*0.13,),
                  InkWell(
                    onTap: (){
                      setState(() {
                        u =true;
                        f=false;
                      });
                    },
                    child: Container(
                      width: width*0.3,
                      height: height*0.05,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: u ? Colors.red[600] : Colors.white,
                          boxShadow: [
                           BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 8,
                            offset: Offset(0, 3), // changes position of shadow
                         ),]
                      ),
                      child: Text('Upcoming',style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: u ? Colors.white: Colors.black,

                      ),),
                    ),
                  ),
                  SizedBox(width: width*0.05,),
                  InkWell(
                    onTap: (){
                      setState(() {
                        f =true;
                        u=false;
                      });
                    },
                    child: Container(
                      width: width*0.3,
                      height: height*0.05,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: f ? Colors.red[600]:Colors.white,
                          boxShadow: [
                           BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 8,
                            offset: Offset(0, 3), // changes position of shadow
                         ),]
                      ),
                      child: Text('Past',style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: f ? Colors.white: Colors.black,

                      ),),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: height*0.6,
              width: width*0.9,
              child: GridView.builder(
                  itemCount: 4,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  crossAxisSpacing: 10,
                  childAspectRatio: 3/2,
                  mainAxisSpacing: 10
              ), itemBuilder: (context,index){
                    History();
              }),
            )
        ]
        ),
      ),
    );
  }
}
