import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InitVP {
  List<String> fileList;

  InitVP() : fileList = [];

  Future<void> setupSubjects() async {
    fileList.clear();
    final myHome = Directory('/home/rathod/Videos/UPSC');

    await for (var entity
        in myHome.list(recursive: false, followLinks: false)) {
      fileList.add(entity.path);
    }
  }
}

Widget buildSubjectCard(String text) => SizedBox(
      height: 210,
      width: 250,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color: Colors.blue,
          child: Center(child: Text(text)),
        ),
      ),
    );

List<Widget> generateSubjectCards(List<String> subjectNames) {
  List<Widget> subjects = [];
  List<Widget> subjectContainers = [];
  int i = 0;
  while (i != subjectNames.length) {
    subjects.add(buildSubjectCard(subjectNames[i]));
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
  subjectContainers.add(Container(
    child: Row(
      children: subjects.map((e) => e).toList(),
    ),
  ));
  subjects.clear();

  return subjectContainers;
}

void getVideos(String subj, String chap) {}
void getChapters(String subj) {}
