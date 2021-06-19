// To parse this JSON data, do
//
//     final workspaceApImodel = workspaceApImodelFromMap(jsonString);

import 'dart:convert';

import 'package:flutter/cupertino.dart';

class WorkspaceApImodel with ChangeNotifier {
  WorkspaceApImodel({
    this.id,
    this.profilePicture,
    this.name,
    this.location,
    this.mobileOne,
    this.mobileTwo,
    this.openTime,
    this.closeTime,
    this.serveFood,
    this.wifi,
  });

  final int id;
  final String profilePicture;
  final String name;
  final String location;
  final String mobileOne;
  final String mobileTwo;
  final String openTime;
  final String closeTime;
  final String serveFood;
  final String wifi;

  factory WorkspaceApImodel.fromMap(Map<String, dynamic> json) => WorkspaceApImodel(
    id: json["id"],
    profilePicture: json["profile_picture"],
    name: json["name"],
    location: json["location"],
    mobileOne: json["mobile_one"],
    mobileTwo: json["mobile_two"],
    openTime: json["open_time"],
    closeTime: json["close_time"],
    serveFood: json["serve_food"],
    wifi: json["wifi"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "profile_picture": profilePicture,
    "name": name,
    "location": location,
    "mobile_one": mobileOne,
    "mobile_two": mobileTwo,
    "open_time": openTime,
    "close_time": closeTime,
    "serve_food": serveFood,
    "wifi": wifi,
  };
}
