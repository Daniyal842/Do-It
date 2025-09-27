import 'package:doit/app_views/Calendar_view/Calendar_view.dart';
import 'package:doit/common/bottom_bar/bottom_bar_controller.dart';
import 'package:doit/common/constants/app-colors.dart';
import 'package:doit/common/constants/app-icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Import tumhari screens
import 'package:doit/app_views/home_view/home-view.dart';
import 'package:doit/app_views/task_view/task_view.dart';
import 'package:doit/app_views/setting_view/setting_view.dart';

class BottomBarExample extends StatelessWidget {
  const BottomBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    final BottomBarController barController = Get.put(BottomBarController());

    final icons = [
      AppIcons.home_icon,
      AppIcons.task_list_icon,
      AppIcons.calendar_icon,
      AppIcons.setting_icon,
    ];

    final pages = [
       HomeView(),
       TaskPage(),
       CustomCalendar(),
       SettingView(),
    ];

    return Obx(() => Scaffold(
      body: pages[barController.selectedIndex.value], // ✅ body switch karega
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppColors.blue2,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(icons.length, (index) {
            final isSelected = barController.selectedIndex.value == index;

            return GestureDetector(
              onTap: () => barController.changeIndex(index),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: Image.asset(
                        icons[index],
                        height: 28,
                        width: 28,
                        color: isSelected ? Colors.blue : Colors.grey,
                      ),
                    ),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      height: 3,
                      width: 20,
                      color: isSelected ? Colors.blue : Colors.transparent,
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    ));
  }
}
