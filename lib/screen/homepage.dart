
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:senior/model/workspaceAPImodel.dart';
import 'package:senior/provider/WorkspaceProvider.dart';
import 'package:senior/provider/search_provider.dart';
import 'package:senior/screen/searchResult.dart';
import 'package:senior/widgets/drawer.dart';
import 'package:senior/widgets/workspace_item.dart';
import 'package:senior/widgets/workspace_item2.dart';
import '../model/workspace_model.dart';
class HomePage extends StatefulWidget {
  static const String routeName = "/homepage";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
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
    var searchProvider = Provider.of<SearchProvider>(context);
    return Scaffold(
      backgroundColor: Colors.grey[50],
      drawer: new MainDrawer(),
      key: _scaffoldKey,
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height*0.01,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: Container(
                  width: width*0.8,
                  height: height*0.1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: (){
                          _scaffoldKey.currentState.openDrawer();
                        },
                          child: Icon(Icons.menu)),
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/c2.png'),

                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: height*0.01,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text('Hi, aya',style: TextStyle(
                  fontSize: 20,
                  color: Colors.black54,
                ),),
              ),
              SizedBox(height: height*0.02,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text("where today you'll work ? "
                    ,style: TextStyle(
                  fontSize: 25,
                    fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),),
              ),
              SizedBox(height: height*0.03,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: TextFormField(
                  onChanged: (v){
                    searchProvider.q = v;
                  },
                  decoration: new InputDecoration(
                    suffixIcon: IconButton(icon: Icon(Icons.search,color: Colors.lightGreen[600] ,),onPressed: () async {
                      print(searchProvider.q);
                      await searchProvider.search().then((value) {
                        print(111);
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchResult()));
                      });

                    },),
                      errorStyle: TextStyle(fontSize: 18.0,color: Colors.grey[300]),
                      labelText: 'search',
                      labelStyle: TextStyle(color: Colors.lightGreen[600]) ,
                      filled: true,
                      fillColor: Colors.grey[300],
                      enabledBorder: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(20.0),
                        borderSide: new BorderSide(
                          color: Colors.grey[350],
                        ),
                      ),
                      focusedBorder: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(20.0),
                          borderSide: new BorderSide(
                            color: Colors.grey[300],
                          )),
                      border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(20.0),
                          borderSide: BorderSide(
                              color: Colors.black, width: 1.0))),
                  style: new TextStyle(color: Colors.black),
                )

                ),

              SizedBox(height: height*0.02,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Text(" Recommended for you "
                  ,style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.lightGreen[900],
                  ),),
              ),
              SizedBox(height: height*0.01,),
              n ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Container(
                  width: width,
                  height: height*0.6,
                  child: GridView.builder(
                    padding: const EdgeInsets.all(10.0),
                    itemCount: workspaceApImodel.length,
                    itemBuilder: (context,index){
                      if (index%2==0){
                        return ChangeNotifierProvider.value(value: workspaceApImodel[index],child: WorkspaceItem(),);
                      }
                      else{
                        return ChangeNotifierProvider.value(value: workspaceApImodel[index],child: WorkspaceItem2(),);
                      }
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      crossAxisSpacing: 10,
                      childAspectRatio: 3/2,
                      //mainAxisSpacing: 10
                    ),
                  ),
                ),
              ):Center(
                child: Container(
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator()),
              ),

            ],
          )
        ],
      ),
    );
  }
}
