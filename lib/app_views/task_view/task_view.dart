import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doit/app_views/task_view/task_controller.dart';
import 'package:doit/common/constants/app-colors.dart';
import 'package:doit/common/constants/app-icons.dart';
import 'package:doit/common/widgets/app_text.dart';
import 'package:doit/common/widgets/app_textform.dart';
import 'package:doit/common/widgets/container_button.dart';
import 'package:doit/common/widgets/gradient_background.dart';
import 'package:doit/common/widgets/loading_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    TaskListController tasklistController = Get.put(TaskListController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: Colors.blue,
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.white,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            builder: (context) {
              return FractionallySizedBox(
                heightFactor: 0.7,
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
                        hintText: "task",
                        controller: tasklistController.titleController,
                        prefixIcon: Image.asset(
                          AppIcons.box_chekmark,
                          color: AppColors.grey2,
                          height: 8,
                        ),
                        fillColor: AppColors.blue2,
                        textColor: AppColors.white1,
                        cursorColor: AppColors.blue4,
                      ),
                      AppTextForm(
                        hintText: "Description",
                        controller: tasklistController.descriptionController,
                        fillColor: AppColors.blue2,
                        textColor: AppColors.white1,
                        cursorColor: AppColors.blue4,
                        maxLines: 6,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                              width: 150,
                              child: TextFormField(
                                style: GoogleFonts.poppins(
                                    color: AppColors.white1),
                                cursorColor: AppColors.blue4,
                                controller: tasklistController.dateController,
                                readOnly: true,
                                onTap: () =>
                                    tasklistController.pickDate(context),
                                decoration: InputDecoration(
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide:
                                        BorderSide(color: AppColors.blue1),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                        color: Colors.transparent),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: const BorderSide(
                                        color: AppColors.white1),
                                  ),
                                  hintText: "Date",
                                  hintStyle: GoogleFonts.poppins(
                                      color: AppColors.grey2),
                                  prefixIcon: Icon(
                                    Icons.date_range_outlined,
                                    color: AppColors.grey2,
                                  ),
                                  fillColor: AppColors.blue2,
                                ),
                              )),
                          Container(
                            width: 150,
                            child: TextFormField(
                              style:
                                  GoogleFonts.poppins(color: AppColors.white1),
                              cursorColor: AppColors.blue4,
                              controller: tasklistController.timeController,
                              readOnly: true,
                              onTap: () => tasklistController.pickTime(context),
                              decoration: InputDecoration(
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide:
                                      BorderSide(color: AppColors.blue1),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(
                                      color: Colors.transparent),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide:
                                      const BorderSide(color: AppColors.white1),
                                ),
                                hintText: "Time",
                                hintStyle:
                                    GoogleFonts.poppins(color: AppColors.grey2),
                                prefixIcon: Icon(
                                  Icons.access_time,
                                  color: AppColors.grey2,
                                ),
                                fillColor: AppColors.blue2,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ContainerButton(
                            onTap: () {
                              tasklistController.clearFields();
                            },
                            text: "Cancel",
                            bgColor: AppColors.grey1,
                            textColor: AppColors.black1,
                            height: 45,
                            width: 120,
                          ),
                          Obx(
                            () => tasklistController.isLoading.value
                                ? LoadingWidget()
                                : ContainerButton(
                                    onTap: () {
                                      tasklistController.insertTask();
                                    },
                                    text: "Create",
                                    bgColor: AppColors.blue3,
                                    textColor: AppColors.white1,
                                    height: 45,
                                    width: 120,
                                  ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add,
            color: Colors.white), // 👈 circular button icon
      ),
      body:GradientBackground(
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 40),
          child: Container(
            width: 300,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.blue2,
            ),
            child: TextField(
              style: TextStyle(color: AppColors.white1, fontSize: 14),
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Search by task title",
                hintStyle: TextStyle(color: Colors.white70),
                prefixIcon: Icon(Icons.search, color: Colors.grey),
              ),
              onChanged: (value) {
                tasklistController.searchQuery.value = value;
              },
            ),
          ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: AppText(
                  text: 'Task List',
                  fontSize: 18,
                  color: AppColors.white1,
                ),
              ),
            ),
            Expanded(
              child: Obx(
                    () => Container(
                      width: 10,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: AppColors.blue2,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: tasklistController.selectedSort.value,
                      dropdownColor: AppColors.blue2,
                      icon: const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
                      style: TextStyle(color: AppColors.white1, fontSize: 14),
                      onChanged: (value) {
                        if (value != null) tasklistController.changeSort(value);
                      },
                      items: const [
                        DropdownMenuItem(value: "All", child: Text("All")),
                        DropdownMenuItem(value: "Complete", child: Text("Complete")),
                        DropdownMenuItem(value: "Incomplete", child: Text("Incomplete")),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 30),  // ✅ ab sahi jagah

        Expanded(
          child: Obx(() {
            final task = tasklistController.filteredTasks;
            if (tasklistController.isLoading.value) {
              return const Center(child: LoadingWidget());
            }
            if (task.isEmpty) {
              return const Center(child: Text("No tasks found"));
            }
            return ListView.builder(
              itemCount: task.length,
              itemBuilder: (context, index) {
                return Card(
                  color: AppColors.white1,
                  child: ListTile(
                    onTap: () {
                      Get.toNamed(
                        '/taskDetailView',
                       arguments: task[index]
                       // arguments: task[index],
                      );
                    },
                    title: AppText(
                      text: task[index].title.toString(),
                      color: AppColors.black1,
                      fontSize: 16,
                    ),
                    subtitle: AppText(
                      text:
                      "${task[index].date.toString()} | ${task[index].time.toString()}",
                      color: AppColors.black1,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                    trailing: AppText(
                      text: task[index].status.toString(),
                      color: AppColors.red2,
                      fontSize: 14,
                    ),
                  ),
                );
              },
            );
          }),
        ),
      ],
    ),
    ),

    );
  }
}
