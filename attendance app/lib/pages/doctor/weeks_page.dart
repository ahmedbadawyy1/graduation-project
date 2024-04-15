// import 'package:flutter/material.dart';
//
// class Weeks extends StatefulWidget {
//   const Weeks({Key? key}) : super(key: key);
//
//   @override
//   State<Weeks> createState() => _WeeksState();
// }
//
// class _WeeksState extends State<Weeks> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           elevation: 1,
//           centerTitle: true,
//           backgroundColor: Color(0x9870694B),
//           title: Text(
//             "Weeks",
//             style: TextStyle(
//               color: Colors.white,
//               fontWeight: FontWeight.bold,
//               fontSize: 25,
//             ),
//           ),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: SingleChildScrollView(
//             child: Card(
//               clipBehavior: Clip.hardEdge,
//               child: InkWell(
//                 onTap: () {
//                 Navigator.pushNamed(context, '/attendaceweek1');
//                 },
//                 child: Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: <Widget>[
//                       const ListTile(
//                         leading: Icon(Icons.view_week),
//                         title: Text(' Week 1'),
//                         subtitle: Text('Student attendance during the week 1.'),
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: <Widget>[
//                           TextButton(
//                             style: ElevatedButton.styleFrom(
//                                 primary: Color(0x9870694B),
//                                 elevation: 0,
//                                 shape: RoundedRectangleBorder(
//                                     borderRadius:
//                                     BorderRadius.circular(30))),
//                             child: const Text(
//                               'Details',
//                               style: TextStyle(
//                                 color: Colors.black,
//                               ),
//                             ),
//                             onPressed: () {
//                               Navigator.pushNamed(context, '/attendaceweek1');
//                             },
//                           ),
//                           const SizedBox(width: 8),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//
//
//       ),
//     );
//   }
// }












// import 'package:flutter/material.dart';
//
// import '../../models/subjects_response_model.dart';
// import '../../models/weeks_response_model.dart';
// import '../../services/api_service.dart';
//
// class Weeks extends StatefulWidget {
//   final SubjectResponseModel? subject;
//
//   const Weeks({Key? key, this.subject}) : super(key: key);
//
//   @override
//   State<Weeks> createState() => _WeeksState();
// }
//
// class _WeeksState extends State<Weeks> {
//   List<dynamic>? _weeks;
//
//   @override
//   void initState() {
//     super.initState();
//     if (widget.subject != null) {
//       _getWeeks();
//     }
//   }
//
//   Future<void> _getWeeks() async {
//     try {
//       final weeks = await APIService.getWeeksForSubject(widget.subject?.id ?? 0);
//       setState(() {
//         _weeks = weeks ?? []; // add null check
//       });
//     } catch (e) {
//       print(e);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           elevation: 1,
//           centerTitle: true,
//           backgroundColor: Color(0x9870694B),
//           title: Text(
//             "Weeks",
//             style: TextStyle(
//               color: Colors.white,
//               fontWeight: FontWeight.bold,
//               fontSize: 25,
//             ),
//           ),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: SingleChildScrollView(
//             child: Card(
//               clipBehavior: Clip.hardEdge,
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   ListTile(
//                     leading: Icon(Icons.view_week),
//                     title: Text('Weeks'),
//                   ),
//                   if (_weeks != null && widget.subject != null)
//                     for (final week in _weeks!.map((week) => WeeksResponseModel.fromJson(week)).toList())
//                       ListTile(
//                         title: Text('Week ${week.weekNumber}'),
//                         subtitle: Text('Student attendance during week ${week.weekNumber}'),
//                         trailing: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             primary: Color(0x9870694B),
//                             elevation: 0,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(30),
//                             ),
//                           ),
//                           child: Text(
//                             'Details',
//                             style: TextStyle(
//                               color: Colors.black,
//                             ),
//                           ),
//                           onPressed: () {
//                             Navigator.pushNamed(context, '/attendance',
//                                 arguments: week.weekNumber.toString());
//                           },
//                         ),
//                       ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

import '../../models/subjects_response_model.dart';
import '../../models/weeks_response_model.dart';
import '../../services/api_service.dart';
class Weeks extends StatefulWidget {
  const Weeks({Key? key}) : super(key: key);

  @override
  State<Weeks> createState() => _WeeksState();
}

class _WeeksState extends State<Weeks> {
  late Future<List<WeeksResponseModel>>? _weeksFuture;
  String? _languageCode;

  @override
  void initState() {
    super.initState();
    _weeksFuture= APIService.getWeeksForSubject(SubjectResponseModel.subject);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _languageCode = Localizations.localeOf(context).languageCode;
  }

  void _onWeekCardTapped( int weekNumber) {  //int id ,
    setState(() {
    //  SubjectResponseModel.subject = SubjectResponseModel(id: id, name: "");
      WeeksResponseModel.week = WeeksResponseModel(weekNumber: weekNumber);
    });
    Navigator.pushNamed(
      context,
      '/attendaceweek',
    );
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
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: _weeksFuture == null ?
          Center(
            child: CircularProgressIndicator(),
          ) :
          FutureBuilder<List<WeeksResponseModel>>(
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
                    return Card(
                      color: Color(4292865494).withOpacity(0.5),
                      clipBehavior: Clip.hardEdge,
                      child: InkWell(
                        onTap: () {
                          // Navigate to the attendance page for this week
                          _onWeekCardTapped(week.weekNumber!);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ListTile(
                                leading: Icon(
                                    Icons.view_week,
                                color: Colors.black,),
                                title: Text(
                                    'Week ${week.weekNumber}',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                subtitle: Text(
                                    'Student attendance during week ${week.weekNumber}.',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  TextButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.black,
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(30
))),
                                    child: const Text(
                                      'Details',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    onPressed: () {
                                      // Navigate to the attendance page for this week
                                      // Navigator.pushNamed(
                                      //   context,
                                      //   _onWeekCardTapped(week.weekNumber!),  //'/attendanceweek${week.weekNumber}',
                                      // );
                                      _onWeekCardTapped(week.weekNumber!);
                                    },
                                  ),
                                  const SizedBox(width: 8),
                                ],

                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
