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

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  @override
  Widget build(BuildContext context) {
    TasklistController tasklistController = Get.put(TasklistController());
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
                        controller: tasklistController.taskController,
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
                                    color: AppColors.white1
                                ),
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
                              style: GoogleFonts.poppins(
                                color: AppColors.white1
                              ),
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
                              tasklistController.cancelTask();
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
                                      tasklistController.createTask();
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
      body: GradientBackground(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // SizedBox(height: 70,),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 40,
              ),
              child: Container(
                width: 300,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.blue2,
                ),
                child: AppTextForm(
                  hintText: "search by task title",
                  hintColor: AppColors.grey2,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 10), // left & right space
                  child: AppText(
                      text: 'Task List', fontSize: 18, color: AppColors.white1),
                ),
                Container(
                  width: 120,
                  height: 45,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  padding:
                      EdgeInsets.symmetric(horizontal: 7), // left & right space

                  decoration: BoxDecoration(
                    color: AppColors.blue2,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Obx(
                    () => DropdownButtonHideUnderline(
                      child: DropdownButton<int>(
                        value: tasklistController.selectedIndex
                            .value, //controller.selectedIndex.value,
                        dropdownColor: AppColors.blue2,
                        icon:
                            Icon(Icons.arrow_drop_down, color: AppColors.grey2),
                        isExpanded: true,
                        items: List.generate(
                          tasklistController.sortOptions.length,
                          // controller.sortOptions.length,
                          (index) => DropdownMenuItem(
                            value: index,
                            child: Text(
                              tasklistController.sortOptions[index],
                              style:
                                  GoogleFonts.poppins(color: AppColors.white1),
                            ),
                          ),
                        ),
                        onChanged: (value) {
                          if (value != null) {
                            tasklistController.changeIndex(value);
                          }
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),

            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('userData')
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .collection('tasks')
                    .orderBy('createdAt', descending: true)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  var tasks = snapshot.data!.docs;

                  // filter karne ke liye Obx
                  return Obx(() {
                    if (tasklistController.selectedIndex.value == 1) {
                      tasks =
                          tasks.where((t) => t['status'] == 'pending').toList();
                    } else if (tasklistController.selectedIndex.value == 2) {
                      tasks = tasks
                          .where((t) => t['status'] == 'completed')
                          .toList();
                    }

                    if (tasks.isEmpty) {
                      return const Center(child: Text("No tasks found"));
                    }

                    return ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        var task = tasks[index];
                        return Card(
                          color: AppColors.white1,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 6),
                          child: ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: AppText(
                                    text: task['task'],
                                    color: AppColors.black1,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    //is jega per text 1 line per pora nahi ata
                                    maxLines: 1,
                                    overflow:
                                        TextOverflow.ellipsis, // ... ajayega
                                  ),
                                ),
                                AppText(
                                  text: task['status'] == 'pending'
                                      ? "Pending"
                                      : "Completed",
                                  color: task['status'] == 'pending'
                                      ? Colors.red
                                      : Colors.green,
                                  fontSize: 15,
                                ),
                              ],
                            ),
                            subtitle: Row(
                              children: [
                                AppText(
                                  text: "${task['date']} | ",
                                  color: AppColors.black1,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                ),
                                AppText(
                                  text: task['time'],
                                  color: AppColors.black1,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                ),
                              ],
                            ),
                            trailing: IconButton(
                              icon: Icon(Icons.arrow_forward_ios_rounded),
                              iconSize: 30,
                              color: Colors.green,
                              onPressed: () {
                                tasklistController.nav_to_detail(
                                    task.data() as Map<String, dynamic>);
                              },
                            ),
                          ),
                        );
                      },
                    );
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
