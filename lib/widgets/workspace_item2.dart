
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:senior/model/workspaceAPImodel.dart';
import 'package:senior/screen/ws_profile.dart';

class WorkspaceItem2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var ws = Provider.of<WorkspaceApImodel>(context,listen: false);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: InkWell(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => WsProfile(name: ws.name,
            closeTime: ws.closeTime,
            id: ws.id,
            location: ws.location,
            mobile: ws.mobile,
            openTime: ws.openTime,
            profilePicture: ws.profilePicture,
            serveFood: ws.serveFood,
            wifi: ws.wifi,
            rooms: ws.rooms,
          )));
        },
        child: Container(
          width: width*0.8,
          height: height*0.1,
          child: Stack(
            children: [
              Positioned(
                right: 10,
                child: Container(
                  height: height*0.25,
                  width: width*0.5,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(17.0),
                    child: Image.network("https://coworkyspace.000webhostapp.com/images/Roomsimages/"+ws.rooms[0].roomImage,fit: BoxFit.cover,),
                  ),
                ),
              ),
              Positioned(
                left: 20,
                top: 20,
                child: Container(
                  height: height*0.19,
                  width: width*0.37,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 8,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text( ws.name,style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),),
                          // Row(
                          //   children: [
                          //     Icon(Icons.location_on_outlined,color: Colors.red,size: 14,),
                          //     Text(ws.location,style: TextStyle(fontSize: 8),)
                          //   ],
                          // ),
                          Row(
                            children: [
                              Icon(Icons.star_outlined,color: Colors.yellowAccent,size: 15,),
                              Icon(Icons.star_outlined,color: Colors.yellowAccent,size: 15,),
                              Icon(Icons.star_outlined,color: Colors.yellowAccent,size: 15,),
                              Icon(Icons.star_half_sharp,color: Colors.yellowAccent,size: 15,),
                              Icon(Icons.star_outline,color: Colors.yellowAccent,size: 15,),
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                children: [


                                  Text('open'),
                                  SizedBox(width: width*0.02,),
                                  Text(ws.openTime,style: TextStyle(color: Colors.lightGreen[900],fontWeight: FontWeight.bold,fontSize: 12),)
                                ],
                              ),
                              Row(
                                children: [


                                  Text('close'),
                                  SizedBox(width: width*0.02,),
                                  Text(ws.closeTime,style: TextStyle(color: Colors.lightGreen[900],fontWeight: FontWeight.bold,fontSize: 12),)
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
