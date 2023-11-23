import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mynisit/features/user_auth/presentation/views/add_task_view.dart';
import 'package:mynisit/features/user_auth/presentation/views/header_view.dart';
import '../services/theme_services.dart';
import '../views/task_info_view.dart';
import '../views/task_list_view.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({Key? key}) : super(key: key);
  get notifyHelper => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.theme.backgroundColor,
        leading: GestureDetector(
          onTap: () {
            ThemeService().switchTheme();
            notifyHelper.displayNotification(
              title: "Theme Changed",
              body: Get.isDarkMode ? "Activated Light Theme" : "Activated Dark Theme",
            );
          },
          child: Icon(
            Get.isDarkMode ? Icons.wb_sunny_outlined : Icons.nightlight_round,
            size: 20,
            color: Get.isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        actions: [
          CircleAvatar(
            backgroundImage: AssetImage("images/Nisit_6330202605.jpg"),
          ),
          SizedBox(width: 20),
        ],
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            // Header View
            Expanded(flex: 3, child: HeaderView()),

            // Task Info View
            Expanded(flex: 3, child: TaskInfoView()),

            // Task List View
            Expanded(flex: 5, child: TaskListView()),
          ],
        ),
      ),
      floatingActionButton: const AddTaskView(),
    );
  }
}
