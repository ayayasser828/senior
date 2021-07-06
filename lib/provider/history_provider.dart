import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:senior/model/history_model.dart';

class HistoryProvider with ChangeNotifier{

  final String url="https://workiispace.000webhostapp.com/api/getbooking?api_password=workspace1234";
  List<HistoryModel> _Rs =[];
  List<HistoryModel> _RNumber =[];
  List<HistoryModel> get item{
    return _RNumber;
  }


  Future<String> getHttp() async {
    try {
      final response = await Dio().get(url);
      var data = response.data  ;
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        _Rs = List<HistoryModel>.from(data.map((x) => HistoryModel.fromMap(x)));
        FirebaseAuth auth = FirebaseAuth.instance;
        print(auth.currentUser.phoneNumber);
        _Rs.forEach((element) {
          //TODO add auth.currentUser.phoneNumber
          if(element.phone == "01275952429"){
            _RNumber.add(element);
          }

        });
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