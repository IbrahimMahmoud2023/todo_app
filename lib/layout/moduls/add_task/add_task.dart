import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../core/theme/app_theme.dart';

class AddTask extends StatefulWidget {
  AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  DateTime selectDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "add New Task",
            style: GoogleFonts.poppins(fontSize: 18),
          ),
          SizedBox(
            height: 12,
          ),
          TextFormField(
            validator: (value) {
              if (value != null || value!.length < 4) {
                return " Please enter title at least 4 char";
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: "enter your task",
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide:
                      BorderSide(color: AppTheme.lightTheme.primaryColor)),
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            "Select Time",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.blue),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: InkWell(
                onTap: () {
                  _selectDate(context);
                },
                child: Text(
                  DateFormat.Md().format(selectDate).toString(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                )),
          ),
          SizedBox(
            height: 12,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {},
              child: Text("add Task"),
            ),
          )
        ],
      ),
    );
  }

  _selectDate(BuildContext context) async {
    var data = DateTime.now();

    var selected = await showDatePicker(
        context: context,
        initialDate: selectDate,
        firstDate: DateTime.now(),
        lastDate: data.add(Duration(days: 365)));
    if (selected == null) {
      selectDate = DateTime.now();
    } else {
      selectDate = selected!;
      selectDate = selectDate;
    }

    setState(() {});
  }
}
