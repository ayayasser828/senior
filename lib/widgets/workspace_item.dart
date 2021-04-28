
import 'package:flutter/material.dart';

class WorkspaceItem extends StatelessWidget {
  final String id;
  final String Name;
  final String image;
  final int price;
  final int rate;
  WorkspaceItem(this.rate,this.Name,this.id,this.price,this.image);
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      width: width*0.8,
      height: height*0.35,
      child: Stack(
        children: [
          Container(
            width: width*0.45,
            height: height*0.3,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(15)
            ),
          ),
          Positioned(
            right: 30,
            top: 40,
            child: Container(
              height: height*0.19,
              width: width*0.35,
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

                    Text( Name,style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),),
                    Row(
                      children: [
                        Icon(Icons.location_on_outlined,color: Colors.red,size: 14,),
                        Text('gleem ,alexandria',style: TextStyle(fontSize: 12),)
                      ],
                    ),
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
            ),
          )
        ],
      ),
    );
  }
}
