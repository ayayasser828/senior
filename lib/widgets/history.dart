import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:senior/model/history_model.dart';
import 'package:senior/model/workspaceAPImodel.dart';
import 'package:senior/provider/WorkspaceProvider.dart';
import 'package:senior/provider/history_provider.dart';
class History extends StatefulWidget {

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  List<WorkspaceApImodel>  workspaceApImodel =[];
  String wsname;
  bool n=false;
  void initState() {
    getData();

    // TODO: implement initState
    super.initState();
  }

  Future<void> getData() async{
    await Provider.of<WorkspaceProvider>(context,listen:false).getHttp().then((value){
      workspaceApImodel = Provider.of<WorkspaceProvider>(context,listen: false).item;
      setState(() {
        n =true;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    var Rs = Provider.of<HistoryModel>(context,listen: false);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    for (var i=0;i<workspaceApImodel.length;i++){
      if (workspaceApImodel[i].id==Rs.workspaceId){
        wsname=workspaceApImodel[i].name;
      }
    }
    return InkWell(
      child: Container(
        width: width*0.8,
        height: height*0.35,
        color: Colors.white,
        child: Row(
          children: [
            SizedBox(width: width*0.03,),
            Container(
                width: width*0.25,
                height: height*0.3,
                alignment: Alignment.center,
                child: Text("${Rs.date}")),
            Container(
              width: width*0.01,
              height: height*0.1,
              color: Colors.black54,
            ),
            SizedBox(width: width*0.03,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text( "${wsname}",style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),),
                SizedBox(height: height*0.01,),
                Text('number of individual'+'   '+"${Rs.maxNum}",style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.lightGreen[900],
                ),),

              ],
            ),
          ],
        ),
      ),
    );
  }
}
