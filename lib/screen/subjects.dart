import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:videoplayer/utils/initvp.dart';

class Subjects extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SubjectsState();
}

class _SubjectsState extends State<Subjects> {
  List<String> subjectNames = [];

  void setup() async {
    InitVP vp = InitVP();
    await vp.setupSubjects();
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
          title: Text('Subjects'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: generateSubjectCards(subjectNames),
          ),
        ));
  }
}
