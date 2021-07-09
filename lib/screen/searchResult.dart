import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:senior/provider/search_provider.dart';
import 'package:senior/widgets/workspace_item.dart';
import 'package:senior/widgets/workspace_item2.dart';



class SearchResult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var searchProvider = Provider.of<SearchProvider>(context);
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(height: height*0.05,),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: TextFormField(
                    onChanged: (v){
                      searchProvider.q = v;
                    },
                    decoration: new InputDecoration(
                        suffixIcon: IconButton(icon: Icon(Icons.search),onPressed: () async {
                          print(searchProvider.q);
                          await searchProvider.search().then((value) {
                            print(111);
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchResult()));
                          });

                        },),
                        errorStyle: TextStyle(fontSize: 18.0),
                        labelText: 'search',
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        focusedBorder: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: new BorderSide(
                              color: Colors.blue,
                            )),
                        border: OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: BorderSide(
                                color: Colors.black, width: 1.0))),
                    style: new TextStyle(color: Colors.black),
                  )

              ),
              SizedBox(height: height*0.02,),
              Container(
                width: width*0.9,
                height: height*0.8,
                child: GridView.builder(
                  padding: const EdgeInsets.all(10.0),
                  itemCount: searchProvider.item.length,
                  itemBuilder: (context,index){
                    if (index%2==0){
                      return ChangeNotifierProvider.value(value: searchProvider.item[index],child: WorkspaceItem(),);
                    }
                    else{
                      return ChangeNotifierProvider.value(value: searchProvider.item[index],child: WorkspaceItem2(),);
                    }
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      crossAxisSpacing: 10,
                      childAspectRatio: 3/2,
                      //mainAxisSpacing: 20
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
