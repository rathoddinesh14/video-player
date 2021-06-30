import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:videoplayer/utils/initvp.dart';

class SubjectScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SubjectScreenState();
}

class _SubjectScreenState extends State<SubjectScreen> {
  List<String> subjectNames = [];

  void setup() async {
    InitVP vp = InitVP(location: "/home/rathod/Videos/UPSC");
    await vp.setup();
    setState(() {
      subjectNames = vp.fileList;
    });
  }

  @override
  void initState() {
    super.initState();
    setup();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Choose a Subjects'),
          centerTitle: true,
          backgroundColor: Colors.teal[400],
        ),
        backgroundColor: Colors.teal[400],
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SingleChildScrollView(
              child: Column(
                children: generateSubjectCards(context, subjectNames),
              ),
            ),
          ],
        ));
  }

  @override
  void dispose() {
    super.dispose();
  }
}

Widget buildSubjectCard(BuildContext context, String text) => SizedBox(
      height: 210,
      width: 270,
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 20.0, 20.0, 8.0),
          child: Card(
            color: Colors.cyan,
            child: Center(
              child: Text(
                trimPath(text),
                style: TextStyle(color: Colors.white, fontSize: 25),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        onTap: () {
          Navigator.pushNamed(context, '/chapters',
              arguments: {'subject': text});
        },
      ),
    );

List<Widget> generateSubjectCards(
    BuildContext context, List<String> subjectNames) {
  List<Widget> subjects = [];
  List<Widget> subjectContainers = [];
  int i = 0;
  while (i != subjectNames.length) {
    subjects.add(buildSubjectCard(context, subjectNames[i]));
    i++;
    if (i % 4 == 0) {
      subjectContainers.add(Container(
        child: Row(
          children: subjects.map((e) => e).toList(),
        ),
      ));
      subjects.clear();
    }
  }
  subjectContainers.add(Padding(
    padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
    child: Container(
      child: Row(
        children: subjects.map((e) => e).toList(),
      ),
    ),
  ));
  subjects.clear();

  return subjectContainers;
}
