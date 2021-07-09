
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:senior/model/workspaceAPImodel.dart';
import 'package:senior/provider/WorkspaceProvider.dart';
import 'package:senior/widgets/startup_item.dart';

class Startup extends StatefulWidget {
  static const String routeName = "/startup";

  @override
  _StartupState createState() => _StartupState();
}

class _StartupState extends State<Startup> {
  List<WorkspaceApImodel>  workspaceApImodel =[];
  bool n=false;
  void initState() {
    getData();
    // TODO: implement initState
    print(3);
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
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(height: height*0.07,),
              Text("choose your sponsor "
                ,style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.lightGreen[900],
                ),
              textAlign: TextAlign.center,),

              n ? Container(
                width: width,
                height: height*0.9,
                child: GridView.builder(
                  padding: const EdgeInsets.all(10.0),
                  itemCount: workspaceApImodel.length,
                  itemBuilder: (context,index){
                    return ChangeNotifierProvider.value(value: workspaceApImodel[index],child: StartupItem(),);
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      crossAxisSpacing: 10,
                      childAspectRatio: 2.3,
                      mainAxisSpacing: 10
                  ),
                ),
              ):Center(
                child: Container(
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator()),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
