
import 'package:flutter/material.dart';
import 'package:senior/widgets/drawer.dart';
import 'package:senior/widgets/workspace_item.dart';
import 'package:senior/widgets/workspace_item2.dart';
import '../model/workspace_model.dart';
class HomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final List<WorkspaceModel> data =[
    WorkspaceModel(
      id: 'a1',
      price: 20,
      image: 'assets/images/w.jpg',
      Name: 'Alex Lap',
      rate: 3
    ),
    WorkspaceModel(
      id: 'a2',
      price: 20,
      image: 'assets/images/w2.jpg',
      Name: 'Alex Target',
      rate: 4
    ),
    WorkspaceModel(
      id: 'a1',
      price: 20,
      image: 'assets/images/w3.jpg',
      Name: 'Your space',
      rate: 5
    ),
    WorkspaceModel(
        id: 'a2',
        price: 20,
        image: 'assets/images/w2.jpg',
        Name: 'Alex Target',
        rate: 4
    ),
  ];
  static const String routeName = "/homepage";
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
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
              //SizedBox(height: height*0.01,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 75),
                child: Text('Find your',style: TextStyle(
                  fontSize: 33,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 75),
                child: Text('Comfort place',style: TextStyle(
                  fontSize: 33,
                  color: Colors.black54,
                ),),
              ),
              SizedBox(height: height*0.03,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: InkWell(
                  onTap: (){

                  },
                  child: Container(
                      height: height*0.08,
                      width: width*0.8,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(15),

                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(width: width*0.08,),
                          Icon(Icons.search,color: Colors.black38,),
                          SizedBox(width: width*0.03,),
                          Text('search.. ',style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black38,
                          ),),
                          
                        ],
                      )
                  ),
                ),
              ),
              SizedBox(height: height*0.03,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Container(
                  width: width,
                  height: height*0.6,
                  child: GridView.builder(
                    padding: const EdgeInsets.all(10.0),
                    itemCount: data.length,
                    itemBuilder: (ctx ,i){
                      if(i%2==0){
                        return WorkspaceItem(
                            data[i].rate,
                            data[i].Name,
                            data[i].id,
                            data[i].price,
                            data[i].image
                        );
                      }else{
                        return WorkspaceItem2(
                            data[i].rate,
                            data[i].Name,
                            data[i].id,
                            data[i].price,
                            data[i].image
                        );
                      }
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      crossAxisSpacing: 10,
                      childAspectRatio: 3/2,
                      mainAxisSpacing: 10
                    ),
                  ),
                ),
              )

            ],
          )
        ],
      ),
    );
  }
}
