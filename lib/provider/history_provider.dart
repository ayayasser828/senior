import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:senior/model/history_model.dart';

class HistoryProvider with ChangeNotifier{

  final String url="https://workiispace.000webhostapp.com/api/getbooking?api_password=workspace1234";
  List<HistoryModel> _Rs =[];
  List<HistoryModel> get item{
    return _Rs;
  }


  Future<String> getHttp() async {
    try {
      final response = await Dio().get(url);
      var data = response.data  ;
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        _Rs = List<HistoryModel>.from(data.map((x) => HistoryModel.fromMap(x)));
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