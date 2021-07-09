import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:senior/model/workspaceAPImodel.dart';

class WorkspaceProvider with ChangeNotifier{
  final String url="https://coworkyspace.000webhostapp.com/api/workspaces";
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
}

  Future<String> booking(int id , String num,String phone,DateTime date,int rid) async {
    try {
      print(id);
      print(num);
      print(phone);
      print(date);
      print(rid);
      final response = await Dio().post("https://coworkyspace.000webhostapp.com/api/saveReservation",data: {
        "workspace_id":id,
        "numberOfIndividual":num,
        "phone":phone,
        "date":date.toString()
      });
      var data = response.data  ;
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        print(data);
        print(data["result"]);
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
  Future<String> bookingRoom(int id , String num,String phone,DateTime date,int rid) async {
    try {
      print(id);
      print(num);
      print(phone);
      print(date);
      print(rid);
      final response = await Dio().post("https://coworkyspace.000webhostapp.com/api/bookingroom",data: {
        "workspace_id":id,
        "room_id":rid,
        "phone": phone,
        "max_num":num,
        "date":date.toString()
      });
      var data = response.data  ;
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        print(data);
        print(data["result"]);
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
  Future<String> StartUp(int id , String desc,String pn) async {
    try {
      print(id);
      print(desc);
      print(pn);
      FirebaseAuth auth = FirebaseAuth.instance;
      final response = await Dio().post("https://coworkyspace.000webhostapp.com/api/saveStartup",data: {
        "client_id":auth.currentUser.phoneNumber,
        "workspace_id":id,
        "description":desc,
        "projectName":pn
      });
      var data = response.data  ;
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        print(data);
        print(data["result"]);
        return "success";
      } else{
        print('not a 200 requesy ${response.data}');
        return "something is wrong";
      }

    } on DioError catch (e) {
      print(e.response);
      return e.response.data["message"];
    }}
  }
