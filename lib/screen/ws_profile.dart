import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:senior/model/workspaceAPImodel.dart';
import 'package:senior/provider/WorkspaceProvider.dart';
import 'package:senior/screen/room.dart';

class WsProfile extends StatelessWidget {
  static const String routeName = "/wsprofile";
  WsProfile({
    this.id,
    this.userId,
    this.profilePicture,
    this.name,
    this.location,
    this.mobile,
    this.openTime,
    this.closeTime,
    this.serveFood,
    this.wifi,
    this.rooms,
    this.phone,
    this.number,
    this.time
  });

  final int id;
  final int userId;
  final String profilePicture;
  final String name;
  final String location;
  final String mobile;
  final String openTime;
  final String closeTime;
  final ServeFood serveFood;
  final ServeFood wifi;
  final List<Room> rooms;
  String number;
  String phone;
  String time;
  @override
  Widget build(BuildContext context) {
    var _dateTime = DateTime.now();
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var ws = Provider.of<WorkspaceProvider>(context,listen: false);
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: width,
                  height: height,
                  child: Stack(
                    children: [
                      Container(
                        width: width,
                        height: height * 0.5,
                        child: Image.network("https://coworkyspace.000webhostapp.com/images/Roomsimages/"+rooms[0].roomImage,fit: BoxFit.cover,),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Container(
                          width: width,
                          height: height * 0.55,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                Text(
                                  name,
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                Text(
                                  location,
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black54,
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.03,
                                ),
                                Container(
                                  width: width,
                                  height: height * 0.13,
                                  child: Row(
                                    children: [
                                      Column(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              color: Colors.grey[300],
                                            ),
                                            width: width * 0.15,
                                            height: height * 0.08,
                                            alignment: Alignment.center,
                                            child: Icon(
                                              Icons.wifi,
                                              color: Colors.lightGreen[900],
                                            ),
                                          ),
                                          Text(
                                            "available",
                                            style: TextStyle(fontSize: 14),
                                          )
                                        ],
                                      ),
                                      SizedBox(width: width*0.01,),
                                      Column(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              color: Colors.grey[300],
                                            ),
                                            width: width * 0.15,
                                            height: height * 0.08,
                                            alignment: Alignment.center,
                                            child: Icon(
                                              Icons.fastfood_sharp,
                                              color: Colors.lightGreen[900],
                                            ),
                                          ),
                                          Text(
                                            "available",
                                            style: TextStyle(fontSize: 14),
                                          )
                                        ],
                                      ),
                                      SizedBox(width: width*0.01,),
                                      Column(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => Rooms(rooms: rooms,id: id,)));
                                              //print(id);

                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: Colors.grey[300],
                                              ),
                                              width: width * 0.15,
                                              height: height * 0.08,
                                              alignment: Alignment.center,
                                              child: Icon(
                                                Icons.family_restroom,
                                                color: Colors.lightGreen[900],
                                              ),
                                            ),
                                          ),
                                          Text(
                                            'rooms',
                                            style: TextStyle(fontSize: 14),
                                          )
                                        ],
                                      ),

                                      Column(
                                        children: [
                                          Row(
                                            children: [
                                              Icon(Icons.access_time_sharp,size: 16,),
                                              SizedBox(width: width*0.01,),
                                              SizedBox(height: height*0.05,),
                                              Text('open'),
                                              SizedBox(width: width*0.02,),
                                              Text(openTime,style: TextStyle(color: Colors.lightGreen[900],fontWeight: FontWeight.bold),)
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              SizedBox(width: width*0.01,),
                                              Icon(Icons.access_time_sharp,size: 16,),
                                              SizedBox(width: width*0.01,),
                                              Text('close'),
                                              SizedBox(width: width*0.02,),
                                              Text(closeTime,style: TextStyle(color: Colors.lightGreen[900],fontWeight: FontWeight.bold),)
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.phone),
                                    SizedBox(
                                      width: width * 0.02,
                                    ),
                                    Text(
                                      mobile,
                                      style: TextStyle(
                                          color: Colors.lightGreen[900],
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: width * 0.08,
                                    ),

                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                          bottom: 0,
                          child: Container(
                            width: width,
                            height: height * 0.2,
                            decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(50)),
                            child: Row(
                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: width * 0.15,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: height * 0.06,
                                    ),
                                    Text(
                                      'price',
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      '20 LE/hour',
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.black54,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: width * 0.1,
                                ),
                                InkWell(
                                  onTap: (){
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
                                              time= '${_dateTime.year}-${_dateTime.month}-${_dateTime.day} ${_dateTime.hour}:${_dateTime.minute}:${_dateTime.second}';
                                             ws.booking(id, number, phone, _dateTime,rooms[0].id).then((value) => {
                                               Navigator.pop(context),
                                             Alert(
                                             context: context,
                                             type: AlertType.success,
                                             title: "Send Request",
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
                                    width: width * 0.39,
                                    height: height * 0.07,
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
                            ),
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
