// To parse this JSON data, do
//
//     final workspaceApImodel = workspaceApImodelFromMap(jsonString);

import 'dart:convert';

import 'package:flutter/cupertino.dart';

List<WorkspaceApImodel> workspaceApImodelFromMap(String str) => List<WorkspaceApImodel>.from(json.decode(str).map((x) => WorkspaceApImodel.fromMap(x)));

String workspaceApImodelToMap(List<WorkspaceApImodel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class WorkspaceApImodel with ChangeNotifier{
  WorkspaceApImodel({
    this.id,
    this.userId,
    this.profilePicture,
    this.name,
    this.location,
    this.mobileOne,
    this.mobileTwo,
    this.openTime,
    this.closeTime,
    this.serveFood,
    this.wifi,
    this.rooms,
  });

  final int id;
  final int userId;
  final String profilePicture;
  final String name;
  final String location;
  final String mobileOne;
  final String mobileTwo;
  final String openTime;
  final String closeTime;
  final ServeFood serveFood;
  final ServeFood wifi;
  final List<Room> rooms;

  factory WorkspaceApImodel.fromMap(Map<String, dynamic> json) => WorkspaceApImodel(
    id: json["id"],
    userId: json["user_id"],
    profilePicture: json["profile_picture"],
    name: json["name"],
    location: json["location"],
    mobileOne: json["mobile_one"],
    mobileTwo: json["mobile_two"],
    openTime: json["open_time"],
    closeTime: json["close_time"],
    serveFood: serveFoodValues.map[json["serve_food"]],
    wifi: serveFoodValues.map[json["wifi"]],
    rooms: List<Room>.from(json["rooms"].map((x) => Room.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "user_id": userId,
    "profile_picture": profilePicture,
    "name": name,
    "location": location,
    "mobile_one": mobileOne,
    "mobile_two": mobileTwo,
    "open_time": openTime,
    "close_time": closeTime,
    "serve_food": serveFoodValues.reverse[serveFood],
    "wifi": serveFoodValues.reverse[wifi],
    "rooms": List<dynamic>.from(rooms.map((x) => x.toMap())),
  };
}

class Room {
  Room({
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
  final RoomType roomType;
  final int roomCapacity;
  final String roomDiscription;
  final ServeFood rentRoom;
  final int roomPrice;
  final RoomPriceTime roomPriceTime;

  factory Room.fromMap(Map<String, dynamic> json) => Room(
    id: json["id"],
    workspaceId: json["workspace_id"],
    roomImage: json["room_image"],
    roomType: roomTypeValues.map[json["room_type"]],
    roomCapacity: json["room_capacity"],
    roomDiscription: json["room_discription"],
    rentRoom: serveFoodValues.map[json["rent_room"]],
    roomPrice: json["room_price"],
    roomPriceTime: roomPriceTimeValues.map[json["room_price_time"]],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "workspace_id": workspaceId,
    "room_image": roomImage,
    "room_type": roomTypeValues.reverse[roomType],
    "room_capacity": roomCapacity,
    "room_discription": roomDiscription,
    "rent_room": serveFoodValues.reverse[rentRoom],
    "room_price": roomPrice,
    "room_price_time": roomPriceTimeValues.reverse[roomPriceTime],
  };
}

enum ServeFood { AVAILABLE, NOT_AVAILABLE }

final serveFoodValues = EnumValues({
  "Available": ServeFood.AVAILABLE,
  "Not available": ServeFood.NOT_AVAILABLE
});

enum RoomPriceTime { DAY, HOUR, WEEK }

final roomPriceTimeValues = EnumValues({
  "Day": RoomPriceTime.DAY,
  "Hour": RoomPriceTime.HOUR,
  "Week": RoomPriceTime.WEEK
});

enum RoomType { SHARED_AREA, FOR_COURSES, MEETING_ROOM }

final roomTypeValues = EnumValues({
  "For Courses": RoomType.FOR_COURSES,
  "Meeting room": RoomType.MEETING_ROOM,
  "SharedArea": RoomType.SHARED_AREA
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
