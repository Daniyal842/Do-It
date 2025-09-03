import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:doit/app_views/home_view/home-view.dart';
import 'package:doit/app_views/setting_view/setting_view.dart';
import 'package:doit/app_views/task_view/task_view.dart';
import 'package:doit/app_views/time_view/time_view.dart';
import 'package:doit/common/constants/app-colors.dart';
import 'package:doit/common/constants/app-icons.dart';
import 'bottom_bar_controller.dart';  // apna controller import karo

class BottomBar extends StatelessWidget {
  BottomBar({super.key});

  final BottomBarController bottomBarController = Get.put(BottomBarController());

  final List pages = [
    HomeView(),
    TaskPage(),
    TimeView(),
    SettingView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: pages.elementAt(bottomBarController.selectedIndex),
          )
        ],
      ),
    );
  }
}
