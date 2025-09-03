import 'package:doit/app_views/task_view/detail_view.dart';
import 'package:doit/app_views/task_view/task_controller.dart';
import 'package:doit/common/constants/app-colors.dart';
import 'package:doit/common/constants/app-icons.dart';
import 'package:doit/common/widgets/app_text.dart';
import 'package:doit/common/widgets/app_textform.dart';
import 'package:doit/common/widgets/container_button.dart';
import 'package:doit/common/widgets/gradient_background.dart';
import 'package:doit/common/widgets/loading_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    TasklistController tasklistController=Get.put(TasklistController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(), // 👈 ensures perfect circle
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
                heightFactor: 0.7, // 👈 exactly half screen
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
                        fillColor: AppColors.blue2,
                        textColor: AppColors.white1,
                        cursorColor: AppColors.blue4,
                        maxLines: 6,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 170,
                            child: AppTextForm(
                              hintText: "task",
                              prefixIcon: Icon(Icons.date_range_outlined,color: AppColors.grey2,),
                              fillColor: AppColors.blue2,
                              textColor: AppColors.white1,
                              cursorColor: AppColors.blue4,
                            ),
                          ),
                          Container(
                            width: 170,
                            child: AppTextForm(
                              hintText: "task",
                              prefixIcon: Icon(Icons.access_time,color: AppColors.grey2,),
                              fillColor: AppColors.blue2,
                              textColor: AppColors.white1,
                              cursorColor: AppColors.blue4,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ContainerButton(
                            onTap: () {},
                            text: "Cancel",
                            bgColor: AppColors.grey1,
                            textColor: AppColors.black1,height: 45,width: 165,
                          ),
                          Obx( ()=>tasklistController.isLoading.value?LoadingWidget():ContainerButton(
                              onTap: () {
                                tasklistController.createTask();
                              },
                              text: "Create",
                              bgColor: AppColors.blue3,
                              textColor: AppColors.white1,height: 45,width: 165,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SizedBox(height: 70,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 252,
                    height: 42,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.blue2,
                    ),
                    child: AppTextForm(
                      hintText: "search by task title",
                      hintColor: AppColors.grey2,
                    ),
                  ),
                  Container(
                    width: 124,
                    height: 42,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.blue2,
                    ),
                    child: AppTextForm(
                      hintText: "sort By",
                      hintColor: AppColors.grey2,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 18),
                child: AppText(
                    text: 'Task List', fontSize: 18, color: AppColors.white1)),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
