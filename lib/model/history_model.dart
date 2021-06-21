// To parse this JSON data, do
//
//     final historyModel = historyModelFromMap(jsonString);

import 'dart:convert';

import 'package:flutter/cupertino.dart';

List<HistoryModel> historyModelFromMap(String str) => List<HistoryModel>.from(json.decode(str).map((x) => HistoryModel.fromMap(x)));

String historyModelToMap(List<HistoryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class HistoryModel with ChangeNotifier{
  HistoryModel({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.workspaceId,
    this.phone,
    this.numberOfIndividual,
    this.date,
  });

  final int id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int workspaceId;
  final String phone;
  final String numberOfIndividual;
  final DateTime date;

  factory HistoryModel.fromMap(Map<String, dynamic> json) => HistoryModel(
    id: json["id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    workspaceId: json["workspace_id"],
    phone: json["phone"],
    numberOfIndividual: json["numberOfIndividual"],
    date: DateTime.parse(json["date"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "workspace_id": workspaceId,
    "phone": phone,
    "numberOfIndividual": numberOfIndividual,
    "date": date.toIso8601String(),
  };
}
