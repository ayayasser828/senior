
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:senior/model/workspaceAPImodel.dart';
import 'package:senior/provider/WorkspaceProvider.dart';
import 'package:senior/screen/ws_profile.dart';

class StartupItem extends StatelessWidget {
  String desc;
  String pn;
  StartupItem({this.desc,this.pn});
  @override
  Widget build(BuildContext context) {
    var ws = Provider.of<WorkspaceApImodel>(context,listen: false);
    var wsp = Provider.of<WorkspaceProvider>(context,listen: false);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      width: width*0.8,
      height: height*0.35,
      child: InkWell(
        onTap: (){
          return Alert(
              context: context,
              title: "StartUp Request",
              content: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.title),
                      labelText: 'project name',
                    ),
                    onChanged: (v){
                      pn=v;
                    },
                  ),
                  TextField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.description),
                      labelText: 'Description..',
                    ),
                    onChanged: (v){
                      desc=v;
                    },
                  ),
                ],
              ),
              buttons: [
                DialogButton(
                  onPressed: () {
                    wsp.StartUp(ws.id, desc, pn).then((value) => {
                      Navigator.pop(context),
                    Alert(
                    context: context,
                    type: AlertType.success,
                    title: "Send Request",
                    buttons: [
                      DialogButton(
                       child: Text(
                         "OK",
                        style: TextStyle(color: Colors.white, fontSize: 20),),
                        onPressed: () => Navigator.pop(context), gradient: LinearGradient(colors: [
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
                      'Send Request',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  color: Colors.white,
                )
              ]).show();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: width*0.32,
              height: height*0.3,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15)
              ),
              child: Image.network("https://coworkyspace.000webhostapp.com/images/workspace/"+ws.profilePicture),
            ),
            Container(
              height: height*0.19,
              width: width*0.4,
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text( ws.name,style: TextStyle(
                      fontSize: 17,
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
                        Icon(Icons.star_outlined,color: Colors.yellowAccent,size: 20,),
                        Icon(Icons.star_outlined,color: Colors.yellowAccent,size: 20,),
                        Icon(Icons.star_outlined,color: Colors.yellowAccent,size: 20,),
                        Icon(Icons.star_half_sharp,color: Colors.yellowAccent,size: 20,),
                        Icon(Icons.star_outline,color: Colors.yellowAccent,size: 20,),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
