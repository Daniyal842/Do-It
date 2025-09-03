import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TasklistController extends GetxController {
  // Controllers
  final TextEditingController taskController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();

  // Loading state
  var isLoading = false.obs;

  // 🔹 Create Task Method
  Future<void> createTask() async {
    try {
      isLoading.value = true;

      String docId = DateTime.now().microsecondsSinceEpoch.toString();

      await FirebaseFirestore.instance
          .collection('userData')
          .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('tasks').doc(docId)
          .set({
        'task': taskController.text,
        'description': descriptionController.text,
        'date': dateController.text,
        'time': timeController.text,
        'docId': docId,
        'status':'pending',//---------when user click on done button---status update pending to completed
        'createdAt': DateTime.now(),
      });

      // Clear after save
      taskController.clear();
      descriptionController.clear();
      dateController.clear();
      timeController.clear();

      Get.snackbar("Success", "Task created successfully!",
          snackPosition: SnackPosition.BOTTOM);

    } catch (e) {
      Get.snackbar("Error", e.toString(),
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
    } finally {
      isLoading.value = false;
    }
  }
}
