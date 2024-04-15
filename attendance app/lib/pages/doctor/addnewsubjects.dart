import 'package:flutter/material.dart';

import '../../models/subjects_response_model.dart';
import '../../services/api_service.dart';
import '../../widgets/widgets.dart';

class AddNewSubject extends StatefulWidget {
  const AddNewSubject({Key? key}) : super(key: key);
  @override
  State<AddNewSubject> createState() => _AddNewSubjectState();
}

class _AddNewSubjectState extends State<AddNewSubject> {
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
    Navigator.pushNamed(context, '/weeks');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(4293717228),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black26, // Set the desired color for the back arrow
          ),
          centerTitle: true,
          backgroundColor: Color(4291947967),
          title: Text(
            "Add New Subjects",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: TextFormField(
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.visiblePassword,

              decoration: textInputDecoration.copyWith(
                  fillColor: Color(4292275656).withOpacity(0.8),
                  labelText: "Search ",


                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                    //    color: Theme.of(context).primaryColor,
                  )),),
          ),
               SizedBox(
                 height: 20,
               ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              child: FutureBuilder<List<SubjectResponseModel>>(
                future: _subjectsFuture,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<SubjectResponseModel> subjects = snapshot.data!;
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Number of columns in the grid
                        mainAxisSpacing: 5.0,
                        crossAxisSpacing: 5.0,
                        childAspectRatio: 1.9,
                      ),
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
                              padding: const EdgeInsets.all(0.0),
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      TextButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.black,
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(30),
                                          ),
                                        ),
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.white,
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
        ],
      ),
    );
  }
}
