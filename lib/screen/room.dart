import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:senior/model/workspaceAPImodel.dart';
import 'package:senior/provider/WorkspaceProvider.dart';


class Rooms extends StatelessWidget {
  static const String routeName = "/rooms";
  List<Room> rooms;
  int id;
  String number;
  String phone;
  Rooms({this.rooms,this.phone,this.number,this.id});
  @override
  Widget build(BuildContext context) {
    var _dateTime = DateTime.now();
    var ws = Provider.of<WorkspaceProvider>(context,listen: false);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ListView(
        children: [
          Container(
            width: width,
            height: height,
            child: GridView.builder(

              itemCount: rooms.length,
              itemBuilder: (context,index){
                return Container(
                    child: Stack(
                      children: [
                        Container(
                          width: width,
                          height: height,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage("https://coworkyspace.000webhostapp.com/images/Roomsimages/"+rooms[index].roomImage),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Positioned(
                            top: 70,
                            left: 40,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("${rooms[index].roomType}",
                                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 28,color: Colors.black)),
                                Text('room capacity:'+"${rooms[index].roomCapacity}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),),
                                Text("${rooms[index].roomDiscription}"),
                                Text("${rooms[index].rentRoom}"),
                                Text("${rooms[index].roomPrice}"+'/'"${rooms[index].roomPriceTime}"),
                                SizedBox(height: height*0.02,),
                                InkWell(
                                  onTap: (){
                                    print(id);
                                    return Alert(
                                        context: context,
                                        title: "Booking",
                                        content: Column(
                                          children: <Widget>[
                                            TextFormField(
                                              decoration: InputDecoration(
                                                icon: Icon(Icons.phone),
                                                labelText: 'Mobile',
                                              ),
                                              onChanged: (v){
                                                phone=v;
                                              },
                                            ),
                                            TextField(
                                              decoration: InputDecoration(
                                                icon: Icon(Icons.people),
                                                labelText: 'Number of Individual',
                                              ),
                                              onChanged: (v){
                                                number=v;
                                              },
                                            ),
                                            SizedBox(height: height*0.02,),
                                            SizedBox(
                                              width: width,
                                              height: height*0.15,
                                              child: CupertinoDatePicker(
                                                mode: CupertinoDatePickerMode.dateAndTime,
                                                initialDateTime: _dateTime,
                                                onDateTimeChanged: (datetime){
                                                  _dateTime = datetime;
                                                },
                                              ),
                                            )
                                          ],
                                        ),
                                        buttons: [
                                          DialogButton(
                                            onPressed: () {
                                              print(id);
                                              print(number);
                                              print(phone);
                                              print(_dateTime);
                                              print(rooms[index].id);
                                              ws.bookingRoom(id, number, phone, _dateTime,rooms[index].id).then((value) => {
                                                Navigator.pop(context),
                                                Alert(
                                                  context: context,
                                                  type: AlertType.success,
                                                  title: "BOOKED",
                                                  buttons: [
                                                    DialogButton(
                                                      child: Text(
                                                        "OK",
                                                        style: TextStyle(color: Colors.white, fontSize: 20),
                                                      ),
                                                      onPressed: () => Navigator.pop(context),
                                                      gradient: LinearGradient(colors: [
                                                        Color.fromRGBO(116, 116, 191, 1.0),
                                                        Color.fromRGBO(52, 138, 199, 1.0)
                                                      ]),
                                                    )
                                                  ],
                                                ).show()
                                              });
                                            },
                                            child: Container(
                                              width: width * 0.38,
                                              height: height * 0.06,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  color: Colors.lightGreen[900],
                                                  borderRadius: BorderRadius.circular(25)),
                                              child: Text(
                                                'Book Now',
                                                style: TextStyle(color: Colors.white),
                                              ),
                                            ),
                                            color: Colors.white,
                                          )
                                        ]).show();
                                  },
                                  child: Container(
                                    width: width * 0.38,
                                    height: height * 0.06,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Colors.lightGreen[900],
                                        borderRadius: BorderRadius.circular(25)),
                                    child: Text(
                                      'Book Now',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                )
                              ],
                            ))
                      ],
                    )
                  );

              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  crossAxisSpacing: 20,
                  childAspectRatio: 0.65,
                  mainAxisSpacing: 10
              ),
            ),
          )
        ],
      ),
    );
  }
}
