// To parse this JSON data, do
//
//     final roomModel = roomModelFromMap(jsonString);

import 'dart:convert';

import 'package:flutter/cupertino.dart';

List<RoomModel> roomModelFromMap(String str) => List<RoomModel>.from(json.decode(str).map((x) => RoomModel.fromMap(x)));

String roomModelToMap(List<RoomModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class RoomModel with ChangeNotifier{
  RoomModel({
    this.id,
    this.workspaceId,
    this.roomImage,
    this.roomType,
    this.roomCapacity,
    this.roomDiscription,
    this.rentRoom,
    this.roomPrice,
    this.roomPriceTime,
  });

  final int id;
  final int workspaceId;
  final String roomImage;
  final String roomType;
  final int roomCapacity;
  final String roomDiscription;
  final String rentRoom;
  final int roomPrice;
  final String roomPriceTime;

  factory RoomModel.fromMap(Map<String, dynamic> json) => RoomModel(
    id: json["id"],
    workspaceId: json["workspace_id"],
    roomImage: json["room_image"],
    roomType: json["room_type"],
    roomCapacity: json["room_capacity"],
    roomDiscription: json["room_discription"],
    rentRoom: json["rent_room"],
    roomPrice: json["room_price"],
    roomPriceTime: json["room_price_time"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "workspace_id": workspaceId,
    "room_image": roomImage,
    "room_type": roomType,
    "room_capacity": roomCapacity,
    "room_discription": roomDiscription,
    "rent_room": rentRoom,
    "room_price": roomPrice,
    "room_price_time": roomPriceTime,
  };
}
