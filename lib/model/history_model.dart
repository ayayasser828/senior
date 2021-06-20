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
    this.workspaceId,
    this.phone,
    this.maxNum,
    this.hours,
    this.date,
    this.timeFrom,
    this.timeTo,
  });

  final int id;
  final int workspaceId;
  final String phone;
  final int maxNum;
  final int hours;
  final DateTime date;
  final String timeFrom;
  final String timeTo;

  factory HistoryModel.fromMap(Map<String, dynamic> json) => HistoryModel(
    id: json["id"],
    workspaceId: json["workspace_id"],
    phone: json["phone"],
    maxNum: json["max_num"],
    hours: json["hours"],
    date: DateTime.parse(json["date"]),
    timeFrom: json["time_from"],
    timeTo: json["time_to"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "workspace_id": workspaceId,
    "phone": phone,
    "max_num": maxNum,
    "hours": hours,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "time_from": timeFrom,
    "time_to": timeTo,
  };
}
