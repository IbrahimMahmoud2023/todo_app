// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:untitled/layout/moduls/add_task/add_task.dart';
import 'package:untitled/layout/moduls/settings/settings_view.dart';
import 'package:untitled/layout/moduls/tasks_list/tasks_list_view.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = "home_layout";

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int selectedIndex = 0;
  List<Widget> screens = [
    TasksListView(),
    SettingsView(),
  ];

  // const HomeLayout({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      extendBody: true,
      floatingActionButton: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: FloatingActionButton(
          onPressed: () {
            showAddTaskBottomSheet();
          },
          tooltip: ('add new task'),
          child: Icon(Icons.add),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (int index) {
            setState(() {
              selectedIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.menu,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "settings"),
          ],
        ),
      ),
    );
  }

  void showAddTaskBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => AddTask(), // تستخدم هنا واجهة AddTask
    );
  }
}
