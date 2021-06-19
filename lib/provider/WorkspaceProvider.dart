import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:senior/model/workspaceAPImodel.dart';

class WorkspaceProvider with ChangeNotifier{
  final String url="https://myworkyspace.000webhostapp.com/api/workspaces";
  List<WorkspaceApImodel> _ws =[];

  List<WorkspaceApImodel> get item{
    return _ws;
  }

  Future<String> getHttp() async {
    try {
      final response = await Dio().get(url);
      var data = response.data  ;
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        _ws = List<WorkspaceApImodel>.from(data.map((x) => WorkspaceApImodel.fromMap(x)));
        return "success";
    } else{
        print('not a 200 requesy ${response.data}');
        return "something is wrong";
      }

  } on DioError catch (e) {
      print(e.response);
      return e.response.data["message"];
    }
}}
