// import 'package:flutter/material.dart'; //// worjk
// import 'package:frist/services/api_service.dart';
// import 'package:http/http.dart' as http;
//
// import '../../models/attendance_response_model.dart';
// import '../../models/subjects_response_model.dart';
// import '../../models/weeks_response_model.dart';
//
// class AttendanceWeek extends StatefulWidget {
//
//   const AttendanceWeek({Key? key})
//       : super(key: key);
//
//   @override
//   State<AttendanceWeek> createState() => _AttendanceWeekState();
// }
//
// class _AttendanceWeekState extends State<AttendanceWeek> {
//   late Future<List<AttendanceResponseModel>>? _attendanceListFuture;
//
//   @override
//   void initState() {
//     super.initState();
//     _attendanceListFuture =
//     APIService.getAttendanceForWeek(SubjectResponseModel.subject,WeeksResponseModel.week);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//         appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: const Color(0x9870694B),
//     title: Text(
//     "Attendance Week",
//     style: TextStyle(
//     color: Colors.white,
//     fontWeight: FontWeight.bold,
//     fontSize: 25,
//     ),
//     ),
//     ),
//     body: Padding(
//     padding: const EdgeInsets.all(16.0),
//     child: FutureBuilder<List<AttendanceResponseModel>>(
//     future: _attendanceListFuture,
//     builder: (context, snapshot) {
//     if (snapshot.connectionState == ConnectionState.waiting) {
//     return Center(child: CircularProgressIndicator());
//     } else if (snapshot.hasError) {
//     return Center(
//     child: Text('Error: ${snapshot.error}',
//     style: TextStyle(fontSize: 18)));
//     } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//     return Center(child: Text('No attendance found',
//     style: TextStyle(fontSize: 18)));
//     } else {
//     final attendanceList = snapshot.data!;
//     return SingleChildScrollView(
//     child: DataTable(
//     columns: const <DataColumn>[
//     DataColumn(
//     label: Expanded(
//     child: Text(
//     'ID',
//     style: TextStyle(fontStyle: FontStyle.italic),
//     ),
//     ),
//     ),
//     DataColumn(
//     label: Expanded(
//     child: Text(
//     'Name',
//     style: TextStyle(fontStyle: FontStyle.italic),
//     ),
//     ),
//     ),
//     DataColumn(
//     label: Expanded(
//     child: Text(
//     'Subject ID',
//     style: TextStyle(fontStyle: FontStyle.italic),
//     ),
//     ),
//     ),
//     DataColumn(
//     label: Expanded(
//     child: Text(
//     'Time',
//     style: TextStyle(fontStyle: FontStyle.italic),
//     ),
//     ),
//     ),
//     DataColumn(
//     label: Expanded(
//     child: Text(
//     'Date',
//     style: TextStyle(fontStyle: FontStyle.italic),
//     ),
//     ),
//     ),
//     DataColumn(
//     label: Expanded(
//     child: Text(
//     'Week Number',
//     style: TextStyle(fontStyle: FontStyle.italic),
//     ),
//     ),
//     ),
//     DataColumn(
//     label: Expanded(
//     child: Text(
//     'Room',
//     style: TextStyle(fontStyle: FontStyle.italic),
//     ),
//     ),
//     ),
//     ],
//     rows: attendanceList
//         .map((attendance) => DataRow(cells: <DataCell>[
//     DataCell(Text(attendance.id.toString())),
//     DataCell(Text(attendance.name)),
//     DataCell(Text(attendance.subjectId.toString())),
//     DataCell(Text(attendance.time)),
//     DataCell(Text(attendance.date)),
//     DataCell(Text(attendance.weekNumber.toString())),
//     DataCell(Text(attendance.collegeColiseum)),
//     ]))
//         .toList(),
//     columnSpacing: 20,
//     decoration: BoxDecoration(
//     borderRadius: BorderRadius.circular(10),
//     border: Border.all(color:
//     Colors.grey, width: 1),
//                   ),
//                   headingRowColor: MaterialStateColor.resolveWith((states) => Colors.blueGrey),
//                   headingRowHeight: 40,
//                   dataRowColor:
//                   MaterialStateColor.resolveWith((states) => Colors.grey),
//               dataRowHeight: 50,
//               dataTextStyle: TextStyle(fontSize: 16),
//               headingTextStyle: TextStyle(fontSize: 18, color: Colors.white),
//                ),
//           );}}
//         ),
//
//     ),
//
//
//       ),
//     );
//   }
//
// }



// body: SingleChildScrollView(
//   child: Padding(
//     padding: const EdgeInsets.all(20.0),
//     child: Container(
//
//       child: Row(
//         children: [
//           Expanded(
//             child: Column(
//
//               children: [
//                 Text(
//                   "Id"
//                 ),
//                 SizedBox(
//                   height: 8,
//                 ),
//                 Text("1"),
//               ],
//             ),
//           ),
//           SizedBox(
//             width: 16,
//           ),
//           Expanded(
//             flex: 5,
//             child: Column(
//               children: [
//                 Text(
//                     "Name"
//                 ),
//                 SizedBox(
//                   height: 8,
//                 ),
//                 Text("ahmed badawy sobhi"),
//               ],
//             ),
//           ),
//           SizedBox(
//             width: 16,
//           ),
//           Expanded(
//             flex: 3,
//             child: Column(
//               children: [
//                 Text(
//                     "Subject_id"
//                 ),
//                 SizedBox(
//                   height: 8,
//                 ),
//                 Text("java"),
//               ],
//             ),
//           ),
//           SizedBox(
//             width: 16,
//           ),
//           Expanded(
//             flex: 2,
//             child: Column(
//               children: [
//                 Text(
//                     "Time"
//                 ),
//                 SizedBox(
//                   height: 8,
//                 ),
//                 Text("05:14:32"),
//               ],
//             ),
//           ),
//           SizedBox(
//             width: 16,
//           ),
//           Expanded(
//             flex: 2,
//             child: Column(
//               children: [
//                 Text(
//                     "date"
//                 ),
//                 SizedBox(
//                   height: 8,
//                 ),
//                 Text("2023-1-1"),
//               ],
//             ),
//           ),
//           SizedBox(
//             width: 16,
//           ),
//           Expanded(
//             child: Column(
//               children: [
//                 Text(
//                     "Week"
//                 ),
//                 SizedBox(
//                   height: 8,
//                 ),
//                 Text("1"),
//               ],
//             ),
//           ),
//           SizedBox(
//             width: 16,
//           ),
//           Expanded(
//             child: Column(
//               children: [
//                 Text(
//                     "Room"
//                 ),
//                 SizedBox(
//                   height: 8,
//                 ),
//                 Text("4"),
//               ],
//             ),
//           ),
//           SizedBox(
//             width: 16,
//           ),
//         ],
//       ),
//     ),
//   ),
// ),

// import 'package:flutter/material.dart';
//
//
// class AttendanceWeek extends StatefulWidget {
//   const AttendanceWeek({Key? key}) : super(key: key);
//
//   @override
//   State<AttendanceWeek> createState() => _AttendanceWeekState();
// }
//
// class _AttendanceWeekState extends State<AttendanceWeek> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           backgroundColor: const Color(0x9870694B),
//           title: Text(
//             "Attendance Week",
//             style: TextStyle(
//               color: Colors.white,
//               fontWeight: FontWeight.bold,
//               fontSize: 25,
//             ),
//           ),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: SingleChildScrollView(
//             child: DataTable(
//
//               columns:const <DataColumn> [
//                 DataColumn(
//                   label: Expanded(
//                     child: Text(
//                       'id',
//                       style: TextStyle(fontStyle: FontStyle.italic),
//                     ),
//                   ),
//                 ),
//                 DataColumn(
//                   label: Expanded(
//                     //flex: 5,
//                     child: Text(
//                       'Name',
//                       style: TextStyle(fontStyle: FontStyle.italic),
//                     ),
//                   ),
//                 ),
//                 DataColumn(
//                   label: Expanded(
//                     //  flex: 5,
//                     child: Text(
//                       'Subject-id',
//                       style: TextStyle(fontStyle: FontStyle.italic),
//                     ),
//                   ),
//                 ),
//                 DataColumn(
//                   label: Expanded(
//
//                     child: Text(
//                       'Time',
//                       style: TextStyle(fontStyle: FontStyle.italic),
//                     ),
//                   ),
//                 ),
//                 DataColumn(
//                   label: Expanded(
//                     child: Text(
//                       'date',
//                       style: TextStyle(fontStyle: FontStyle.italic),
//                     ),
//                   ),
//                 ),
//                 DataColumn(
//                   label: Expanded(
//                     child: Text(
//                       'Week_num',
//                       style: TextStyle(fontStyle: FontStyle.italic),
//                     ),
//                   ),
//                 ),
//                 DataColumn(
//                   label: Expanded(
//                     child: Text(
//                       'Room',
//                       style: TextStyle(fontStyle: FontStyle.italic),
//                     ),
//                   ),
//                 ),
//               ],
//               rows:const <DataRow> [
//                 DataRow(
//                   cells: <DataCell>[
//                     DataCell(Text("1")),
//                     DataCell(Text("Ahmed badawy sobhi mohammed")),
//                     DataCell(Text("java")),
//                     DataCell(Text("05:11:55")),
//                     DataCell(Text("2023-1-1")),
//                     DataCell(Text("1")),
//                     DataCell(Text("4")),
//                   ],),
//                 DataRow(
//                   cells: <DataCell>[
//                     DataCell(Text("2")),
//                     DataCell(Text("Ahmed gemy fathy harby")),
//                     DataCell(Text("java")),
//                     DataCell(Text("05:21:58")),
//                     DataCell(Text("2023-1-1")),
//                     DataCell(Text("1")),
//                     DataCell(Text("4")),
//                   ],),
//               ],
//               columnSpacing: 20,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 border: Border.all(color: Colors.grey, width: 1),
//               ),
//               headingRowColor: MaterialStateColor.resolveWith((states) => Colors.blueGrey),
//               headingRowHeight: 40,
//               dataRowColor: MaterialStateColor.resolveWith((states) => Colors.grey),
//               dataRowHeight: 50,
//               dataTextStyle: TextStyle(fontSize: 16),
//               headingTextStyle: TextStyle(fontSize: 18, color: Colors.white),
//             ) ,
//           ),
//         ),
//
//
//
//
//       ),
//     );
//   }
//
// }


import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:frist/services/api_service.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

import '../../models/attendance_excel_response_model.dart';
import '../../models/attendance_response_model.dart';
import '../../models/subjects_response_model.dart';
import '../../models/weeks_response_model.dart';

// class AttendanceWeek extends StatefulWidget {
//   const AttendanceWeek({Key? key}) : super(key: key);
//
//   @override
//   State<AttendanceWeek> createState() => _AttendanceWeekState();
// }
//
// class _AttendanceWeekState extends State<AttendanceWeek> {
//    late Future<List<AttendanceResponseModel>>? _attendanceListFuture;
//    List<AttendancExcelResponseModel>attendanceList=[];
//   @override
//   void initState() {
//     super.initState();
//     _attendanceListFuture = APIService.getAttendanceForWeek(
//         SubjectResponseModel.subject, WeeksResponseModel.week);
//   }
//   void _downloadAttendance() async {
//     try {
//       await APIService.downloadAttendanceAsExcel(SubjectResponseModel.subject, WeeksResponseModel.week, );
//       Fluttertoast.showToast(
//         msg: "Attendance downloaded successfully!",
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.BOTTOM,
//         timeInSecForIosWeb: 1,
//         backgroundColor: Colors.green,
//         textColor: Colors.white,
//         fontSize: 16.0,
//       );
//     } catch (e) {
//       Fluttertoast.showToast(
//         msg: "Error downloading attendance: $e",
//         toastLength: Toast.LENGTH_SHORT,
//         gravity: ToastGravity.BOTTOM,
//         timeInSecForIosWeb: 1,
//         backgroundColor: Colors.red,
//         textColor: Colors.white,
//         fontSize: 16.0,
//       );
//     }
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(4293717228),
//       appBar:AppBar(
//         iconTheme: IconThemeData(
//           color: Colors.black26, // Set the desired color for the back arrow
//         ),
//         centerTitle: true,
//         backgroundColor: const Color(4291947967),
//         title: const Text(
//           "Attendance Week",
//           style: TextStyle(
//             color: Colors.black,
//             fontWeight: FontWeight.bold,
//             fontSize: 25,
//           ),
//         ),
//         actions: [
//           TextButton(
//             onPressed: _downloadAttendance,
//             child: const Text(
//               'Download',
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 18,
//               ),
//             ),
//           ),
//         ],
//       ),
//       body: Container(
//         // decoration: BoxDecoration(
//         //   image:  DecorationImage(
//         //     image: AssetImage("images/back.jpg"),
//         //     fit: BoxFit.cover,
//         //   ),
//         // ),
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: FutureBuilder<List<AttendanceResponseModel>>(
//               future: _attendanceListFuture,
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return const Center(child: CircularProgressIndicator());
//                 } else if (snapshot.hasError) {
//                   return Center(
//                       child: Text('Error: ${snapshot.error}',
//                           style: const TextStyle(fontSize: 18)));
//                 } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                   return const Center(
//                       child: Text('No attendance found',
//                           style: TextStyle(fontSize: 18)));
//                 } else {
//                   final attendanceList = snapshot.data!;
//                   return SingleChildScrollView(
//                     child: Column(
//                       children: [
//                     DataTable(
//                     columns: const <DataColumn>[
//                       DataColumn(
//                       label: Expanded(
//                       child: Text(
//                       'ID',
//                       style: TextStyle(fontStyle: FontStyle.italic),
//                     ),
//                   ),
//                 ),
//                 DataColumn(
//                 label: Expanded(
//                 child: Text(
//                 'Name',
//                 style: TextStyle(fontStyle: FontStyle.italic),
//                 ),
//                 ),
//
//
//                 ),
//                         DataColumn(
//                           label: Expanded(
//                             child: Text(
//                               'Subject ID',
//                               style: TextStyle(fontStyle: FontStyle.italic),
//                             ),
//                           ),
//                         ),
//                         DataColumn(
//                           label: Expanded(
//                             child: Text(
//                               'Time',
//                               style: TextStyle(fontStyle: FontStyle.italic),
//                             ),
//                           ),
//                         ),
//                         DataColumn(
//                           label: Expanded(
//                             child: Text(
//                               'Date',
//                               style: TextStyle(fontStyle: FontStyle.italic),
//                             ),
//                           ),
//                         ),
//                         DataColumn(
//                           label: Expanded(
//                             child: Text(
//                               'Week Number',
//                               style: TextStyle(fontStyle: FontStyle.italic),
//                             ),
//                           ),
//                         ),
//                         DataColumn(
//                           label: Expanded(
//                             child: Text(
//                               'Room',
//                               style: TextStyle(fontStyle: FontStyle.italic),
//                             ),
//                           ),
//                         ),
//                       ],
//                       rows: attendanceList
//                           .map((attendance) => DataRow(cells: <DataCell>[
//                         DataCell(Text(attendance.id.toString())),
//                         DataCell(Text(attendance.name)),
//                         DataCell(Text(attendance.subjectId.toString())),
//                         DataCell(Text(attendance.time)),
//                         DataCell(Text(attendance.date)),
//                         DataCell(Text(attendance.weekNumber.toString())),
//                         DataCell(Text(attendance.collegeColiseum)),
//                       ]))
//                           .toList(),
//                       columnSpacing: 20,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         border: Border.all(color:
//                         Colors.grey, width: 1),
//                       ),
//                       headingRowColor: MaterialStateColor.resolveWith((states) => Colors.blueGrey),
//                       headingRowHeight: 40,
//                       dataRowColor:
//                       MaterialStateColor.resolveWith((states) => Colors.grey),
//                       dataRowHeight: 50,
//                       dataTextStyle: TextStyle(fontSize: 16),
//                       headingTextStyle: TextStyle(fontSize: 18, color: Colors.white),
//                     ),
//     ],),);}}
//           ),
//
//         ),
//       ),
//
//
//     );
//   }
//
// }
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../widgets/widgets.dart';
import 'search_results_screen.dart';

class AttendanceWeek extends StatefulWidget {
  const AttendanceWeek({Key? key}) : super(key: key);

  @override
  State<AttendanceWeek> createState() => _AttendanceWeekState();
}

class _AttendanceWeekState extends State<AttendanceWeek> {
  late Future<List<AttendanceResponseModel>>? _attendanceListFuture;
  List<AttendanceResponseModel> _filteredAttendanceList = [];
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _attendanceListFuture = APIService.getAttendanceForWeek(
      SubjectResponseModel.subject,
      WeeksResponseModel.week,
    );
  }

  void _downloadAttendance() async {
    try {
      await APIService.downloadAttendanceAsExcel(
        SubjectResponseModel.subject,
        WeeksResponseModel.week,
      );
      Fluttertoast.showToast(
        msg: "Attendance downloaded successfully!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Error downloading attendance: $e",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }


  void _performSearch(String query) {
    if (query.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Color(4291947967),
            title: const Text('Empty Search Field'),
            content: const Text('Please enter a search query.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'
                ,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          );
        },
      );
    } else {
      List<AttendanceResponseModel> filteredList = _filteredAttendanceList
          .where((attendance) =>
          attendance.name.toLowerCase().contains(query.toLowerCase()))
          .toList();

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SearchResultsScreen(searchResults: filteredList),
        ),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(4293717228),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black26,
        ),
        centerTitle: true,
        backgroundColor: const Color(4291947967),
        title: const Text(
          "Attendance Week",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        actions: [
          Icon(
            Icons.download,
          ),
          TextButton(
            onPressed: _downloadAttendance,
            child: const Text(
              'Download',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ),

        ],
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                    //  onChanged: _onSearchTextChanged,
                      decoration: textInputDecoration.copyWith(
                        fillColor: Color(4292275656).withOpacity(0.8),
                        labelText: "Search",
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(30))),
                    onPressed: () {
                      String searchQuery = _searchController.text.trim();
                      _performSearch(searchQuery);
                    },
                    child: const Text('Search'),
                  ),
                ],
              ),

              SizedBox(height: 20),
              Expanded(
                child: FutureBuilder<List<AttendanceResponseModel>>(
                  future: _attendanceListFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          'Error: ${snapshot.error}',
                          style: const TextStyle(fontSize: 18),
                        ),
                      );
                    } else if (!snapshot.hasData ||
                        snapshot.data!.isEmpty) {
                      return const Center(
                        child: Text(
                          'No attendance found',
                          style: TextStyle(fontSize: 18),
                        ),
                      );
                    } else {
                      final attendanceList = snapshot.data!;
                      _filteredAttendanceList.addAll(attendanceList);
                      return ListView.builder(
                        itemCount: _filteredAttendanceList.length,
                        itemBuilder: (context, index) {
                          final attendance = _filteredAttendanceList[index];
                          return Card(
                            color: Color(4292865494).withOpacity(0.5),
                            child: ListTile(
                              title: Text(
                                attendance.name,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        'ID: ${attendance.id}',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(width: 15),
                                      Text(
                                        '| Subject ID: ${attendance.subjectId}',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        '| Week Number: ${attendance.weekNumber}',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        '| Room: ${attendance.collegeColiseum}',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Text(
                                        'Time: ${attendance.time}',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(width: 25),
                                      Text(
                                        'Date: ${attendance.date}',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
