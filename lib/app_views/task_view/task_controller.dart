// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'task_model_class.dart';
// import '../home_view/profile_controller.dart';
//
// class TasklistController extends GetxController {
//   final TextEditingController taskController = TextEditingController();
//   final TextEditingController descriptionController = TextEditingController();
//   final TextEditingController dateController = TextEditingController();
//   final TextEditingController timeController = TextEditingController();
//
//   final ProfileController profileController = Get.put(ProfileController());
//
//   var isLoading = false.obs;
//   var selectedIndex = 0.obs;
//
//   RxString selectedSort="All".obs;
//   RxString searchQuery = "".obs;
//   RxList<TaskModel> taskList = <TaskModel>[].obs;
//
//   // final List<String> sortOptions = [
//   //   "All Task",
//   //   "Pending",
//   //   "Completed",
//   // ];
//
//   void changeIndex(int index) {
//     selectedIndex.value = index;
//     fetchTasks();
//   }
//
//   /// Pick Date
//   Future<void> pickDate(BuildContext context) async {
//     DateTime? pickedDate = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2101),
//     );
//     if (pickedDate != null) {
//       dateController.text = "${pickedDate.toLocal()}".split(' ')[0];
//     }
//   }
//
//   /// Pick Time
//   Future<void> pickTime(BuildContext context) async {
//     TimeOfDay? pickedTime =
//     await showTimePicker(context: context, initialTime: TimeOfDay.now());
//     if (pickedTime != null) {
//       timeController.text =
//       "${pickedTime.hour}:${pickedTime.minute.toString().padLeft(2, '0')}";
//     }
//   }
//
//   /// Create Task
//   Future<void> createTask() async {
//     isLoading.value=true;
//     if (profileController.userId.isEmpty) return;
//
//     if (taskController.text.trim().isEmpty ||
//         descriptionController.text.trim().isEmpty ||
//         dateController.text.trim().isEmpty ||
//         timeController.text.trim().isEmpty) {
//       Get.snackbar("Error", "All fields are required!");
//       isLoading.value=false;
//       return;
//     }
//
//     try {
//       final docRef = FirebaseFirestore.instance
//           .collection("userData")
//           .doc(profileController.userId.value)
//           .collection("tasks")
//           .doc();
//
//       final newTask = TaskModel(
//         id: docRef.id,
//         title: taskController.text.trim(),
//         description: descriptionController.text.trim(),
//         date: dateController.text.trim(),
//         time: timeController.text.trim(),
//         status: "pending",
//       );
//
//       await docRef.set(newTask.toMap());
//       taskList.add(newTask);
//
//       clearFields();
//       Get.snackbar("Success", "Task created");
//       isLoading.value=false;
//     } catch (e) {
//       Get.snackbar("Error", e.toString());
//       isLoading.value=false;
//     }
//   }
//   /// Fetch Tasks
//   Future<void> fetchTasks() async {
//     if (profileController.userId.isEmpty) return;
//
//     taskList.clear();
//     try {
//       final snapshot = await FirebaseFirestore.instance
//           .collection("userData")
//           .doc(profileController.userId.value)
//           .collection("tasks")
//           .get();
//
//       for (var doc in snapshot.docs) {
//         final data = doc.data();
//
//         taskList.add(TaskModel(
//           id: doc.id,
//           title: data["task"] ?? "",
//           description: data["description"] ?? "",
//           date: data["date"] ?? "",
//           time: data["time"] ?? "",
//           status: data["status"] ?? "pending",
//         ));
//       }
//
//       taskList.refresh(); // UI refresh
//     } catch (e) {
//       Get.snackbar("Error", e.toString());
//     }
//   }
//
//
//
// // ✅ Delete by ID
//   Future<void> deleteTask(String id) async {
//     try {
//       await FirebaseFirestore.instance
//           .collection("userData")
//           .doc(profileController.userId.value)
//           .collection("tasks")
//           .doc(id)
//           .delete();
//
//       fetchTasks(); // refresh
//       // Get.back(); // close detail page or dialog
//       Get.toNamed('/BottomBar');
//       Get.snackbar("Success", "Task deleted");
//     } catch (e) {
//       Get.snackbar("Error", e.toString());
//     }
//   }
//
// //✅ Update by ID
//   Future<void> updateTaskById(String id, Map<String, dynamic> data) async {
//     try {
//       await FirebaseFirestore.instance
//           .collection("userData")
//           .doc(profileController.userId.value)
//           .collection("tasks")
//           .doc(id)
//           .update(data);
//
//       fetchTasks(); // refresh
//       Get.back(); // close bottom sheet
//       Get.snackbar("Success", "Task updated");
//     } catch (e) {
//       Get.snackbar("Error", e.toString());
//     }
//   }
//
//   //
//   //
//   // //
//   // // ✅ Getter for filtered tasks
//   // // ✅ Getter for filtered tasks
//   // List<TaskModel> get filteredTasks {
//   //   if (selectedIndex.value == 1) {
//   //     return taskList.where((t) => t.status == "pending").toList();
//   //   } else if (selectedIndex.value == 2) {
//   //     return taskList.where((t) => t.status == "complete").toList();
//   //   }
//   //   return taskList; // all
//   // }
//   //
//   // Future<void> updateTaskStatus(String taskId) async {
//   //   try {
//   //     final taskIndex = taskList.indexWhere((task) => task.id == taskId);
//   //     if (taskIndex == -1) return;
//   //
//   //     final currentTask = taskList[taskIndex];
//   //     final newStatus = currentTask.status == "pending" ? "complete" : "pending";
//   //
//   //     await FirebaseFirestore.instance
//   //         .collection("userData")
//   //         .doc(profileController.userId.value)
//   //         .collection("tasks")
//   //         .doc(taskId)
//   //         .update({"status": newStatus});
//   //
//   //     // ✅ Replace with new model (to trigger UI refresh)
//   //     taskList[taskIndex] = TaskModel(
//   //       id: currentTask.id,
//   //       title: currentTask.title,
//   //       description: currentTask.description,
//   //       date: currentTask.date,
//   //       time: currentTask.time,
//   //       status: newStatus,
//   //     );
//   //     taskList.refresh();
//   //
//   //     Get.snackbar("Success", "Task marked as $newStatus");
//   //   } catch (e) {
//   //     Get.snackbar("Error", e.toString());
//   //   }
//   // }
//
//   changeSort(String value){
//
//     selectedSort.value =value;
//   }
//   List<TaskModel> get filteredTask {
//     var task= taskList.toList();
//     if(searchQuery.value.isNotEmpty)
//       {
//         task=task.where((t)=>t.title.toLowerCase().contains(searchQuery.value.toLowerCase())).toList();
//       }
//     if(selectedSort.value=="Complete")
//       {
//         task=task.where((t)=>t.status=="Complete").toList();
//       }
//     else if(selectedSort.value=="Pending")
//       {
//         task=task.where((t)=>t.status=="Pending").toList();
//       }
//     return task;
//   }
//
//
//
//   void clearFields() {
//     taskController.clear();
//     descriptionController.clear();
//     dateCon
//     timeController.clear();
//     Get.back();
//   }
//
//   @override
//   void onInit() {
//     super.onInit();
//     fetchTasks();
//   }
// }





import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doit/app_views/task_view/task_model_class.dart';
import 'package:doit/common/widgets/show-message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskListController extends GetxController{
  TextEditingController titleController =TextEditingController();
  TextEditingController descriptionController=TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  var userId = "".obs;
  var userEmail = "".obs;

  Rx<DateTime?> selectedDate = Rx<DateTime?>(null);
  Rx<TimeOfDay?> selectedTime = Rx<TimeOfDay?>(null);

  RxList<TaskModel> taskList = <TaskModel>[].obs;

  RxString searchQuery = "".obs;
  RxString selectedSort = "All".obs;
  RxBool isLoading = false.obs;

  void onInit() {
    super.onInit();
    getUserInfo(); // userId fetch karenge
  }

  // ✅ Get User Info and Fetch Tasks
  getUserInfo() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      userId.value = user.uid;
      userEmail.value = user.email ?? "";

      // userId milne ke baad hi fetchTasks call karein
      fetchTasks();
    }
  }


  pickDate(BuildContext context) async {
    selectedDate.value = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
  }

  pickTime(BuildContext context) async {
    selectedTime.value = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
  }


  insertTask() async {
    if (titleController.text.isEmpty ||
        descriptionController.text.isEmpty ||
        selectedDate.value == null ||
        selectedTime.value == null) {
     ShowMessage.errorMessage("Error", "All fields are required!");
      return;
    }


    isLoading.value = true;
    try {
      final docRef = await FirebaseFirestore.instance.collection("UserData").add({
        "title": titleController.text,
        "description": descriptionController.text,
        "date": selectedDate.value!.toIso8601String(),
        "time": "${selectedTime.value!.hour}:${selectedTime.value!.minute}",
        "userId": userId.value,
        "status": "Pending",
      });

      taskList.add(TaskModel(
        id: docRef.id,
        title: titleController.text,
        description: descriptionController.text,
        date: selectedDate.value!,
        time: selectedTime.value!,
        status: "Pending",
      ));

      clearFields();
      ShowMessage.successMessage("Success", "Task added successfully");
      Get.back();
    } catch (e) {
      ShowMessage.errorMessage("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  fetchTasks() async {
    if (userId.value.isEmpty) return;

    taskList.clear();
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection("UserData")
          .where("userId", isEqualTo: userId.value)
          .get();

      // for each loop
      for (var doc in snapshot.docs) {
        final data = doc.data();
        final timeParts = (data["time"] as String).split(":");
        taskList.add(TaskModel(
          id: doc.id,
          title: data["title"] ?? "",
          description: data["description"] ?? "",
          date: DateTime.parse(data["date"]),
          time: TimeOfDay(
            hour: int.parse(timeParts[0]),
            minute: int.parse(timeParts[1]),
          ),
          status: data["status"] ?? "Pending",
        ));
      }
    } catch (e) {
    ShowMessage.errorMessage("Error", e.toString());
    }
  }

  deleteTask(String id) async {
    try {
      await FirebaseFirestore.instance.collection("UserData").doc(id).delete();
      taskList.removeWhere((task) => task.id == id);
     ShowMessage.successMessage("Deleted", "Task deleted successfully");
    } catch (e) {
      ShowMessage.errorMessage("Error", e.toString());
    }
  }

  updateTask(TaskModel task) async {
    if (titleController.text.isEmpty ||
        descriptionController.text.isEmpty ||
        selectedDate.value == null ||
        selectedTime.value == null) {
      ShowMessage.errorMessage("Error", "All fields are required!");
      return;
    }

    isLoading.value = true;
    try {
      await FirebaseFirestore.instance.collection("UserData").doc(task.id).update({
        "title": titleController.text,
        "description": descriptionController.text,
        "date": selectedDate.value!.toIso8601String(),
        "time": "${selectedTime.value!.hour}:${selectedTime.value!.minute}",
      });

      int index = taskList.indexWhere((t) => t.id == task.id);
      if (index != -1) {
        taskList[index] = TaskModel(
          id: task.id,
          title: titleController.text,
          description: descriptionController.text,
          date: selectedDate.value!,
          time: selectedTime.value!,
          status: task.status,
        );
      }

      clearFields();
     ShowMessage.successMessage("Updated", "Task updated successfully");
    } catch (e) {
      ShowMessage.errorMessage("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  changeStatus(TaskModel task, String newStatus) async {
    try {
      await FirebaseFirestore.instance.collection("UserData").doc(task.id).update({
        "status": newStatus,
      });

      int index = taskList.indexWhere((t) => t.id == task.id);
      if (index != -1) {
        taskList[index].status = newStatus;
        taskList.refresh();
      }
    } catch (e) {
      ShowMessage.errorMessage("Error", e.toString());
    }
  }

  changeSort(String value) {
    selectedSort.value = value;
  }

  List<TaskModel> get filteredTasks {
    var tasks = taskList.toList();

    if (searchQuery.value.isNotEmpty) {
      tasks = tasks.where((t) => t.title.toLowerCase().contains(searchQuery.value.toLowerCase())).toList();
    }

    if (selectedSort.value == "Complete") {
      tasks = tasks.where((t) => t.status == "Complete").toList();
    } else if (selectedSort.value == "Incomplete") {
      tasks = tasks.where((t) => t.status == "Pending").toList();
    }

    return tasks;
  }

  void clearFields() {
    titleController.clear();
    descriptionController.clear();
    selectedDate.value = null;
    selectedTime.value = null;
  }

  void logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      if (Get.isRegistered<TaskListController>()) {
        Get.delete<TaskListController>(force: true);
      }
      Get.offAllNamed('/login');
    } catch (e) {
      ShowMessage.errorMessage("Error", e.toString());
    }
  }

}