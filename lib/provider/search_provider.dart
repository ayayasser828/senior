


import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:senior/model/workspaceAPImodel.dart';

class SearchProvider with ChangeNotifier{

  final String url="https://coworkyspace.000webhostapp.com/api/searchWorkspace/";
  List<WorkspaceApImodel> _ws =[];

  String _q="";

  String get q => _q;

  set q(String value) {
    _q = value;
    notifyListeners();
  }

  List<WorkspaceApImodel> get item{
    return _ws;
  }

  Future<String> search() async {
    try {
      final response = await Dio().get(url+_q);
      var data = response.data  ;
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        _ws = List<WorkspaceApImodel>.from(data.map((x) => WorkspaceApImodel.fromMap(x)));
        print(_ws[0].name);
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