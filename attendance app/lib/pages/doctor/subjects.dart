//
//
// import 'package:flutter/material.dart';
//
// import '../../models/subjects_response_model.dart';
//
// class Subjects extends StatefulWidget {
//   const Subjects({Key? key}) : super(key: key);
//
//   @override
//   State<Subjects> createState() => _SubjectsState();
// }
//
// class _SubjectsState extends State<Subjects> {
//   @override
//   late Future<SubjectResponseModel> futuresubjects;
//
//   @override
//   void initState() {
//     super.initState();
//     futuresubjects = ;
//   }
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: Color(0x9870694B),
//         title: Text(
//           "Subjects",
//           style: TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//             fontSize: 25,
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           children: [
//             Card(
//               clipBehavior: Clip.hardEdge,
//               child: InkWell(
//                 onTap: () {
//                   debugPrint('Card tapped.');
//                 },
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: <Widget>[
//                       const ListTile(
//                         leading: Icon(Icons.subject),
//                         title: Text('Programming 1'),
//
//                       ),
//                       Column(
//                         mainAxisSize: MainAxisSize.min,
//
//                         children: [
//                           ListTile(
//                             leading: Icon(Icons.code),
//                             title: Text('22514a'),
//
//                           ),
//                         ],
//                       ),
//
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: <Widget>[
//                           TextButton(
//                             style: ElevatedButton.styleFrom(
//                                 primary: Color(0x9870694B),
//                                 elevation: 0,
//                                 shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(30))),
//                             child: const Text(
//                               'Details',
//                               style: TextStyle(
//                                 color: Colors.black,
//                               ),
//                             ),
//                             onPressed: () {
//                               Navigator.pushNamed(context, "/weeks");
//                             },
//                           ),
//                           const SizedBox(width: 8),
//
//
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
//
//
//
//
//
//
//
//

import 'package:flutter/material.dart';
import 'package:frist/models/subjects_response_model.dart';
import 'package:frist/services/api_service.dart';

class Subjects extends StatefulWidget {
  const Subjects({Key? key}) : super(key: key);

  @override
  State<Subjects> createState() => _SubjectsState();
}

class _SubjectsState extends State<Subjects> {
  late Future<List<SubjectResponseModel>> _subjectsFuture;
  @override
  void initState() {
    super.initState();
    _subjectsFuture = APIService.getSubjects();
  }

  void _onSubjectCardTapped(int id) {
    setState(() {
      SubjectResponseModel.subject = SubjectResponseModel(id: id, name: "");
    });
    Navigator.pushNamed(
      context,
      '/weeks',
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
          "Subjects",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
      body: Container(
        // decoration: BoxDecoration(
        //   image:  DecorationImage(
        //     image: AssetImage("images/back.jpg"),
        //     fit: BoxFit.cover,
        //   ),
        // ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: FutureBuilder<List<SubjectResponseModel>>(
            future: _subjectsFuture,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<SubjectResponseModel> subjects = snapshot.data!;
                return ListView.builder(
                  itemCount: subjects.length,
                  itemBuilder: (context, index) {
                    SubjectResponseModel subject = subjects[index];
                    return Card(
                      color: Color(4292865494).withOpacity(0.5),
                      clipBehavior: Clip.hardEdge,
                      child: InkWell(
                        onTap: () {
                          _onSubjectCardTapped(subject.id!); // Pass the selected ID to the function
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ListTile(
                                leading: Icon(
                                    Icons.subject,
                                  color: Colors.black,
                                ),
                                title: Text(
                                    subject.name!,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                                ),

                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ListTile(
                                    leading: Icon(
                                        Icons.code,
                                    color: Colors.black,
                                    ),
                                    title: Text(
                                        subject.id.toString(),
                                       style: TextStyle(
                                         color: Colors.black,
                                       ),
                                    ),
                                  ),
                                ],
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
                                            BorderRadius.circular(30))),
                                    child: const Text(
                                      'Details',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    onPressed: () {
                                      _onSubjectCardTapped(subject.id!);
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
              } else if (snapshot.hasError) {
                return Center(
                  child: Text("${snapshot.error}"),
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}
