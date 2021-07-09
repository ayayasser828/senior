// To parse this JSON data, do
//
//     final historyModel = historyModelFromMap(jsonString);

import 'dart:convert';

import 'package:flutter/cupertino.dart';

List<HistoryModel> historyModelFromMap(String str) => List<HistoryModel>.from(json.decode(str).map((x) => HistoryModel.fromMap(x)));

String historyModelToMap(List<HistoryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class HistoryModel with ChangeNotifier {
  HistoryModel({
    this.id,
    this.roomId,
    this.workspaceId,
    this.phone,
    this.maxNum,
    this.date,
  });

  final int id;
  final int roomId;
  final int workspaceId;
  final String phone;
  final int maxNum;
  final DateTime date;

  factory HistoryModel.fromMap(Map<String, dynamic> json) => HistoryModel(
    id: json["id"],
    roomId: json["room_id"],
    workspaceId: json["workspace_id"],
    phone: json["phone"],
    maxNum: json["max_num"],
    date: DateTime.parse(json["date"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "room_id": roomId,
    "workspace_id": workspaceId,
    "phone": phone,
    "max_num": maxNum,
    "date": date.toIso8601String(),
  };
}
