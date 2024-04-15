import 'package:flutter/material.dart';

import '../../models/subjects_response_model.dart';
import '../../models/weeks_response_model.dart';
import '../../services/api_service.dart';

class WeekOption extends StatefulWidget {
  const WeekOption({Key? key}) : super(key: key);

  @override
  State<WeekOption> createState() => _WeekOptionState();
}

class _WeekOptionState extends State<WeekOption> {
  late Future<List<WeeksResponseModel>>? _weeksFuture;
  String? _languageCode;
  int? _selectedWeek;

  @override
  void initState() {
    super.initState();
    _weeksFuture = APIService.getWeeksForSubject(SubjectResponseModel.subject);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _languageCode = Localizations.localeOf(context).languageCode;
    _selectedWeek = ModalRoute.of(context)!.settings.arguments as int?;
  }

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
          "Weeks",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: _weeksFuture == null
            ? Center(
          child: CircularProgressIndicator(),
        )
            : FutureBuilder<List<WeeksResponseModel>>(
          future: _weeksFuture!,
          builder: (BuildContext context,
              AsyncSnapshot<List<WeeksResponseModel>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error loading data'),
              );
            } else if (!snapshot.hasData) {
              return Center(
                child: Text('No data found'),
              );
            } else {
              final _weeks = snapshot.data!;
              return ListView.builder(
                itemCount: _weeks.length,
                itemBuilder: (BuildContext context, int index) {
                  WeeksResponseModel week = _weeks[index];
                  return Column(
                    children: [
                      Container(
                        child: Card(
                          color: Color(4292865494).withOpacity(0.5),
                          clipBehavior: Clip.hardEdge,
                          child: InkWell(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  ListTile(
                                    leading: Icon(
                                      Icons.credit_card,
                                      color: Colors.black,
                                    ),
                                    title: Text(
                                      ' Weeks cards ',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                    subtitle: Text(
                                      'Student attendance display with cards & search in it.',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.end,
                                    children: <Widget>[
                                      TextButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.black,
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(
                                                30),
                                          ),
                                        ),
                                        child: const Text(
                                          'Display',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        onPressed: () {
                                          // Navigate to the attendance page for this week
                                          Navigator.pushNamed(
                                            context,
                                            '/attendanceweek${week.weekNumber}',
                                          );
                                        },
                                      ),
                                      const SizedBox(width: 8),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        child: Card(
                          color: Color(4292865494).withOpacity(0.5),
                          clipBehavior: Clip.hardEdge,
                          child: InkWell(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  ListTile(
                                    leading: Icon(
                                      Icons.table_view,
                                      color: Colors.black,
                                    ),
                                    title: Text(
                                      'Weeks excel sheet ',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                    subtitle: Text(
                                      'Student attendance display in excel sheet.',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.end,
                                    children: <Widget>[
                                      TextButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.black,
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(
                                                30),
                                          ),
                                        ),
                                        child: const Text(
                                          'Display',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        onPressed: () {
                                          // Navigate to the attendance page for this week
                                          Navigator.pushNamed(
                                            context,
                                            '/attendanceweek',
                                          );
                                        },
                                      ),
                                      const SizedBox(width: 8),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
