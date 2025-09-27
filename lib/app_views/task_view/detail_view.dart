import 'package:doit/app_views/task_view/task_controller.dart';
import 'package:doit/common/constants/app-colors.dart';
import 'package:doit/common/widgets/app_text.dart';
import 'package:doit/common/widgets/app_textform.dart';
import 'package:doit/common/widgets/container_button_two.dart';
import 'package:doit/common/widgets/gradient_background.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Detailpage extends StatelessWidget {
  const Detailpage({super.key});

  @override
  Widget build(BuildContext context) {
    final task = Get.arguments as Map<String, dynamic>;
    TasklistController tasklistController = Get.put(TasklistController());
    return Scaffold(
        body: GradientBackground(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 40,
                        ),
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios_new,
                          ),
                          iconSize: 30,
                          color: AppColors.blue4,
                          onPressed: () {
                            tasklistController.nav_to_task();
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
                    title: SizedBox(
                      height: 30,
                      child: SingleChildScrollView(
                        child: AppText(
                          text: task['task'],
                          fontSize: 20,
                          maxLines: 5000,
                        ),
                      ),
                    ),
                    subtitle: Row(
                      children: [
                        Icon(
                          Icons.calendar_month_outlined,
                          color: AppColors.white1,
                        ),
                        AppText(
                          text: task['date'],
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                        ),
                        AppText(
                          text: " | ",
                          //fontSize: 14,
                          fontWeight: FontWeight.w300,
                        ),
                        Icon(
                          Icons.access_time_outlined,
                          color: AppColors.white1,
                        ),
                        AppText(
                          text: task['time'],
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: AppColors.white1,
                    thickness: 0.5,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: SingleChildScrollView(
                      child: AppText(
                        text: task['description'],
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
                          onTap: () {},
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
                                tasklistController.deleteTask(task['docId']); // 👈 pass docId
                              },
                            );
                          },
                        ),
                        ContainerButtonTwo(
                          icon: Icons.update,
                          iconColor: AppColors.yellow1,
                          text: "Update",
                          onTap: () {
                            showUpdateTaskSheet(context, task);
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
        ));
  }
}


void showUpdateTaskSheet(BuildContext context, Map<String, dynamic> task) {
  TasklistController tasklistController = Get.find();

  // prefill fields
  tasklistController.taskController.text = task['task'];
  tasklistController.descriptionController.text = task['description'];
  tasklistController.dateController.text = task['date'];
  tasklistController.timeController.text = task['time'];

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
                controller: tasklistController.taskController,
                fillColor: AppColors.blue2,
                textColor: AppColors.white1,
                cursorColor: AppColors.blue4,
              ),
              AppTextForm(
                hintText: "Description",
                controller: tasklistController.descriptionController,
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
                      controller: tasklistController.dateController,
                      readOnly: true,
                      onTap: () => tasklistController.pickDate(context),
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.date_range_outlined),
                        hintText: "Date",
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 120,
                    child: TextFormField(
                      controller: tasklistController.timeController,
                      readOnly: true,
                      onTap: () => tasklistController.pickTime(context),
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
                  Obx(() => tasklistController.isLoading.value
                      ? const CircularProgressIndicator()
                      : ContainerButtonTwo(
                          icon: Icons.update,
                          iconColor: AppColors.yellow1,
                          text: "Update",
                          onTap: () {
                            tasklistController
                                .updateTask(task['docId']); // 👈 pass id
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
