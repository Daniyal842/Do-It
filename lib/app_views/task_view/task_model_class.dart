// class TaskModel {
//   final String id;
//   final String title;
//   final String description;
//   final String date;   // String
//   final String time;   // String
//   late final String status;
//
//   TaskModel({
//     required this.id,
//     required this.title,
//     required this.description,
//     required this.date,
//     required this.time,
//     required this.status,
//   });

  // // Firestore → Model
  // factory TaskModel.fromMap(Map<String, dynamic> data, String docId) {
  //   return TaskModel(
  //     id: docId,
  //     title: data["task"] ?? "",
  //     description: data["description"] ?? "",
  //     date: data["date"] ?? "",
  //     time: data["time"] ?? "",
  //     status: data["status"] ?? "pending",
  //   );
  // }
  //
  // // Model → Firestore
  // Map<String, dynamic> toMap() {
  //   return {
  //     "task": title,
  //     "description": description,
  //     "date": date,
  //     "time": time,
  //     "status": status,
  //   };
  // }
// }



import 'package:flutter/material.dart';

class TaskModel {
  String id;
  String title;
  String description;
  DateTime date;
  TimeOfDay time;
  String status; // "Pending" or "Complete"

  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.time,
    this.status = "Pending",
  });
}