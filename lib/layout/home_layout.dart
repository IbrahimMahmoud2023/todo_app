// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/core/network_layer/firestore_utils.dart';

//import 'package:untitled/layout/moduls/add_task/add_task.dart';
import 'package:untitled/layout/moduls/settings/settings_view.dart';
import 'package:untitled/layout/moduls/tasks_list/tasks_list_view.dart';
import 'package:untitled/modles/task_model.dart';

class HomeLayout extends StatefulWidget {
  static const String routeName = "home_layout";

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  var formKey = GlobalKey<FormState>();

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  DateTime selectedDate = DateTime.now();
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
          tooltip: ('Add new task'),
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
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topRight: Radius.circular(20),
        topLeft: Radius.circular(20),
      )),
      builder: (context) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 20),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Add New Task",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                  //  height: 2,
                  ),
              Text("Title",
                  style: GoogleFonts.poppins(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  )),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: titleController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Title must be at least 10 characters";
                  } else if (value.length < 10) {
                    return "Title must be at least 10 characters";
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  hintText: "Enter Your Task Title",
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text("Description",
                  style: GoogleFonts.poppins(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  )),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: descriptionController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Field can not be empty";
                  } else {
                    return null;
                  }
                },
                maxLines: 2,
                minLines: 2,
                decoration: InputDecoration(
                  hintText: "Enter Your Task Description",
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),

              Text(
                "Select Time",
                style: GoogleFonts.poppins(
                    fontSize: 17, fontWeight: FontWeight.bold),
              ),
              // const SizedBox(
              //  height: 5,
              // ),

              InkWell(
                onTap: () {
                  selectDateTime();
                },
                child: Text(
                  "30 August 2023",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              // ElevatedButton(onPressed: onPressed, child: child)

              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    TaskModel taskModel = TaskModel(
                      title: titleController.text,
                      description: descriptionController.text,
                      dateTime: DateTime.now(),
                      isDone: false,
                    );
                    FirestoreUtils.addTask(taskModel);
                  }
                },

                child: ElevatedButton(
                  onPressed: () {
                    print(titleController.text);
                  },
                  child: Text(
                    "Add Task",
                    //  textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                // style: ElevatedButton.styleFrom(
                //   padding:const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                //   shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.circular(10),
                //
                //   )
                // ),
              ),
            ],
          ),
        ),
      ),
      // تستخدم هنا واجهة AddTask
    );
  }

  selectDateTime() {
    // selectedDate.
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        Duration(days: 365),
      ),
    );
  }
}
