
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:senior/model/room_model.dart';

class RoomProvider with ChangeNotifier{
  final String url="https://myworkyspace.000webhostapp.com/api/Rooms/";
  List<RoomModel> _RM =[];

  List<RoomModel> get item{
    return _RM;
  }


  Future<String> getRooms(String id ) async {
    // var response = await Dio().post(url, data: {'id': id, 'name': 'wendu'});
    try {
      final response = await Dio().get(url+id);
      var data = response.data  ;
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        _RM = List<RoomModel>.from(data.map((x) => RoomModel.fromMap(x)));
        return "success";
      } else{
        print('not a 200 requesy ${response.data}');
        return "something is wrong";
      }

    } on DioError catch (e) {
      print(e.response);
      return e.response.data["message"];
    }
  }




}