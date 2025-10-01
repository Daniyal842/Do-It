import 'package:doit/app_views/task_view/task_controller.dart';
import 'package:doit/app_views/task_view/task_model_class.dart';
import 'package:doit/common/constants/app-colors.dart';
import 'package:doit/common/widgets/app_text.dart';
import 'package:doit/common/widgets/app_textform.dart';
import 'package:doit/common/widgets/container_button_two.dart';
import 'package:doit/common/widgets/gradient_background.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Detailpage extends StatelessWidget {

  const Detailpage({super.key, });

  @override
  Widget build(BuildContext context) {
     TaskListController tasklistController = Get.put(TaskListController());
     final task = Get.arguments as TaskModel;

    return Scaffold(
      body: GradientBackground(
        child:
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new),
                      iconSize: 30,
                      color: AppColors.blue4,
                      onPressed: () {
                        Get.back();
                      },
                    ),
                  ),
                  AppText(
                    text: "Task Details",
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
              ListTile(
                title: AppText(
                  text: task.title,
                  fontSize: 20,
                  maxLines: 5,
                ),
                subtitle: Row(
                  children: [
                    const Icon(Icons.calendar_month_outlined, color: Colors.white),
                    AppText(
                      text: task.date.toString(),
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                    AppText(
                      text: " | ",
                      fontWeight: FontWeight.w300,
                    ),
                    const Icon(Icons.access_time_outlined, color: Colors.white),
                    AppText(
                      text: task.time.toString(),
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ],
                ),
              ),
              const Divider(color: Colors.white, thickness: 0.5),
              Expanded(
                child: SingleChildScrollView(
                  child: AppText(
                    text: task.description,
                    fontSize: 14,
                    maxLines: 5000,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ContainerButtonTwo(
                      icon: Icons.check_circle,
                      iconColor: AppColors.green1,
                      text: "Done",
                      onTap: () {
                        tasklistController.updateTask(task);
                      },
                    ),
                    ContainerButtonTwo(
                      icon: Icons.delete_forever_outlined,
                      iconColor: AppColors.red1,
                      text: "Delete",
                      onTap: () {
                        Get.defaultDialog(
                          title: "Delete Task",
                          middleText: "Are you sure you want to delete this task?",
                          textCancel: "Cancel",
                          textConfirm: "Delete",
                          confirmTextColor: Colors.white,
                          buttonColor: AppColors.red1,
                          onConfirm: () {
                            tasklistController.deleteTask(task.id); // 👈 docId pass
                          },
                        );
                      },
                    ),
                    ContainerButtonTwo(
                      icon: Icons.update,
                      iconColor: AppColors.yellow1,
                      text: "Update",
                      onTap: () {
                        showUpdateTaskSheet(context, task); // 👈 TaskModel pass
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//👇 Update sheet ab TaskModel ke sath compatible
void showUpdateTaskSheet(BuildContext context, TaskModel task) {
  TaskListController taskListController = Get.find();

  // prefill fields
  taskListController.titleController.text = task.title;
  taskListController.descriptionController.text = task.description;
  taskListController.dateController.text = task.date.toString();
  taskListController.timeController.text = task.time.toString();

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return FractionallySizedBox(
        heightFactor: 0.9,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: Container(
                  width: 50,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              AppTextForm(
                hintText: "Task",
                controller: taskListController.titleController,
                fillColor: AppColors.blue2,
                textColor: AppColors.white1,
                cursorColor: AppColors.blue4,
              ),
              AppTextForm(
                hintText: "Description",
                controller: taskListController.descriptionController,
                maxLines: 6,
                fillColor: AppColors.blue2,
                textColor: AppColors.white1,
                cursorColor: AppColors.blue4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 120,
                    child: TextFormField(
                      controller: taskListController.dateController,
                      readOnly: true,
                      onTap: () => taskListController.pickDate(context),
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.date_range_outlined),
                        hintText: "Date",
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 120,
                    child: TextFormField(
                      controller: taskListController.timeController,
                      readOnly: true,
                      onTap: () => taskListController.pickTime(context),
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.access_time),
                        hintText: "Time",
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ContainerButtonTwo(
                    icon: Icons.close,
                    iconColor: AppColors.red1,
                    text: "Cancel",
                    onTap: () {
                      Get.back();
                    },
                  ),
                  Obx(() => taskListController.isLoading.value
                      ? const CircularProgressIndicator()
                      : ContainerButtonTwo(
                    icon: Icons.update,
                    iconColor: AppColors.yellow1,
                    text: "Update",
                    onTap: () {
                      // 1️⃣ ID nikaalo task se
                      final String id = task.id;

                      // 2️⃣ Data map banao textfield se updated values ke sath
                      final Map<String, dynamic> data = {
                        "title": taskListController.titleController.text.trim(),
                        "description": taskListController.descriptionController.text.trim(),
                        "date": taskListController.dateController.text.trim(),
                        "time": taskListController.timeController.text.trim(),
                      };

                      // 3️⃣ Update function call karo
                      taskListController.updateTask(task);


                    },
                  )),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}

