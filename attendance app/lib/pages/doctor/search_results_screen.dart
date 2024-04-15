
import 'package:flutter/material.dart';

import '../../models/attendance_response_model.dart';

class SearchResultsScreen extends StatelessWidget {
  final List<AttendanceResponseModel> searchResults;

  const SearchResultsScreen({Key? key, required this.searchResults})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(4293717228),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black26, // Set the desired color for the back arrow
        ),
        centerTitle: true,
        backgroundColor: Color(4291947967),
        title: Text(
          "Search result",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),

      ),
      body: ListView.builder(
        itemCount: searchResults.length,
        itemBuilder: (context, index) {
          final attendance = searchResults[index];
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Card(
              color: Color(4292865494).withOpacity(0.5),
              clipBehavior: Clip.hardEdge,
              child: ListTile(
                title: Text(attendance.name),
                subtitle:Column(
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
            ),
          );
        },
      ),
    );
  }
}
