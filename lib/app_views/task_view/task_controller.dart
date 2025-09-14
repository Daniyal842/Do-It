import 'package:doit/app_views/home_view/profile_controller.dart';
import 'package:doit/common/constants/app-colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TasklistController extends GetxController {
  // Controllers
  final TextEditingController taskController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();

  // 👇 ProfileController instance
  final ProfileController profileController = Get.put(ProfileController());

  var selectedIndex = 0.obs;

  final List<String> sortOptions = [
    "All Task",
    "Pendding",
    "Completed",
  ];

  void changeIndex(int index) {
    selectedIndex.value = index;
  }

  var isLoading = false.obs;

  nav_to_detail(){
    Get.toNamed('/taskDetailView');
  }
  // 🔹 Date Picker
  Future<void> pickDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF2196F3),
              onPrimary: Colors.white,
              surface: Color(0xFF0D1B2A),
              onSurface: Colors.white,
            ),
            dialogBackgroundColor: Color(0xCC0D1B2A),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(foregroundColor: AppColors.blue4),
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      dateController.text =
      "${pickedDate.day}-${pickedDate.month}-${pickedDate.year}";
    }
  }

  // 🔹 Time Picker
  Future<void> pickTime(BuildContext context) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: const ColorScheme.dark(
              primary: Color(0xFF2196F3),
              onPrimary: Colors.white,
              surface: Color(0xFF0D1B2A),
              onSurface: Colors.white,
              secondary: Color(0xFF2196F3),
              onSecondary: Colors.white,
            ),
            dialogBackgroundColor: Color(0xCC0D1B2A),
          ),
          child: child!,
        );
      },
    );

    if (pickedTime != null) {
      timeController.text =
      "${pickedTime.hour}:${pickedTime.minute.toString().padLeft(2, '0')}";
    }
  }

  // 🔹 Create Task
  void createTask() async {
    String task = taskController.text.trim();
    String description = descriptionController.text.trim();
    String date = dateController.text.trim();
    String time = timeController.text.trim();

    if (task.isEmpty || description.isEmpty || date.isEmpty || time.isEmpty) {
      Get.snackbar(
        "Error",
        "Please fill all fields before creating task",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    try {
      isLoading.value = true;

      String docId = FirebaseFirestore.instance
          .collection('userData')
          .doc(profileController.userId.value) // ✅ ProfileController ka UID
          .collection('tasks')
          .doc()
          .id;

      await FirebaseFirestore.instance
          .collection('userData')
          .doc(profileController.userId.value) // ✅
          .collection('tasks')
          .doc(docId)
          .set({
        'docId': docId,
        'task': task,
        'description': description,
        'date': date,
        'time': time,
        'status': 'pending',
        'createdAt': FieldValue.serverTimestamp(),
      });

      taskController.clear();
      descriptionController.clear();
      dateController.clear();
      timeController.clear();

      Get.back();
      Get.snackbar("Success", "Task Created Successfully",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white);
    } catch (e) {
      Get.snackbar("Error", "Failed to create task: $e",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    } finally {
      isLoading.value = false;
    }
  }

  // 🔹 Update Task Status
  Future<void> updateTaskStatus(String docId, String newStatus) async {
    try {
      await FirebaseFirestore.instance
          .collection('userData')
          .doc(profileController.userId.value) // ✅ ProfileController ka UID
          .collection('tasks')
          .doc(docId)
          .update({'status': newStatus});

      Get.snackbar("Updated", "Task status changed to $newStatus",
          snackPosition: SnackPosition.BOTTOM);
    } catch (e) {
      Get.snackbar("Error", e.toString(),
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
    }
  }
}
