import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:adminapp/screens/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/add_lecture_schedule_request_model.dart';
import '../models/add_lecture_schedule_response.model.dart';

class AddLecture extends StatefulWidget {
  const AddLecture({Key? key}) : super(key: key);

  @override
  State<AddLecture> createState() => _AddLectureState();
}

class _AddLectureState extends State<AddLecture> {
  String scheduleId = "";
  String doctorId = "";
  String subjectId = "";
  String collegeColiseum = "";
  String timeDate = '';
  TextEditingController _dateTimeController = TextEditingController();
  bool isAPICallProcess = false;

  Future<void> addLectureSchedule() async {
    setState(() {
      isAPICallProcess = true;
    });

    // Create the request body using the AddLectureScheduleRequestModel
    AddLectureScheduleRequestModel requestModel = AddLectureScheduleRequestModel(
      scheduleId: scheduleId,
      doctorId: doctorId,
      dateTime: timeDate,
      subjectId: subjectId,
      collegeColiseum: collegeColiseum,
    );
    Map<String, dynamic> requestBody = requestModel.toJson();

    // Make the API request
    final response = await http.post(
      Uri.parse('http://192.168.1.3:3000/admin/lecture-schedule'),
      body: jsonEncode(requestBody),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      // Successful response
      final responseData = jsonDecode(response.body);
      AddLectureScheduleResponseModel responseModel = AddLectureScheduleResponseModel.fromJson(responseData);

      // Handle the response as needed
      String message = responseModel.message;

      // Show success message using a SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Lecture Schedule added: $message')),
      );
    } else {
      // Error occurred
      print('Error: ${response.statusCode}');
    }

    setState(() {
      isAPICallProcess = false;
    });
  }
  @override  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black26, // Set the desired color for the back arrow
        ),
        title: Text(
          "Add Lecture Schedule",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(4291947967),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Container(
          child: Column(
            children: [
            TextFormField(
            keyboardType: TextInputType.number,
            decoration: textInputDecoration.copyWith(
              fillColor: Color(4292275656).withOpacity(0.5),
              labelText: "Schedule ID",
              prefixIcon: Icon(
                Icons.schedule,
                color: Colors.black,
              ),
            ),
            onChanged: (val) {
              setState(() {
                scheduleId = val;
              });
            },
          ),
          SizedBox(height: 20,),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: textInputDecoration.copyWith(
              fillColor: Color(4292275656).withOpacity(0.5),
              labelText: "Doctor ID",
              prefixIcon: Icon(
                Icons.perm_identity,
                color: Colors.black,
              ),
            ),
            onChanged: (val) {
              setState(() {
                doctorId = val;
              });
            },
          ),
          SizedBox(height: 20,),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: textInputDecoration.copyWith(
              fillColor: Color(4292275656).withOpacity(0.5),
              labelText: "Subject ID",
              prefixIcon: Icon(
                Icons.subject,
                color: Colors.black,
              ),
            ),
            onChanged: (val) {
              setState(() {
                subjectId = val;
              });
            },
          ),
          SizedBox(height: 20,),
          TextFormField(
            keyboardType: TextInputType.datetime,
            controller: _dateTimeController,
            decoration: textInputDecoration.copyWith(
              fillColor: Color(4292275656).withOpacity(0.5),
              labelText: "Date and Time",
              prefixIcon: Icon(
                Icons.date_range,
                color: Colors.black,
              ),
            ),
            onTap: () async {
              DateTime? selectedDateTime = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
              );

              if (selectedDateTime != null) {
                TimeOfDay? selectedTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );

                if (selectedTime != null) {
                  DateTime combinedDateTime = DateTime(
                    selectedDateTime.year,
                    selectedDateTime.month,
                    selectedDateTime.day,
                    selectedTime.hour,
                    selectedTime.minute,
                  );

                  setState(() {
                    _dateTimeController.text =
                        DateFormat('yyyy-MM-dd HH:mm').format(combinedDateTime);
                    timeDate = _dateTimeController.text;
                  });
                }
              }
            },
          ),
          SizedBox(height: 20,),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: textInputDecoration.copyWith(
              fillColor: Color(4292275656).withOpacity(0.5),
              labelText: "College Coliseum",
              prefixIcon: Icon(
                Icons.class_,
                color: Colors.black,
              ),
            ),
            onChanged: (val) {
              setState(() {
                collegeColiseum = val;
              });
            },
          ),
          SizedBox(height: 15,),
          Center(
            child: SizedBox(
              width: 300,
              height: 40,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                "Add Lecture Schedule",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: isAPICallProcess ? null : addLectureSchedule,
            ),
          ),
        ),
        ],
      ),
    ),
    ),
    );
  }
}