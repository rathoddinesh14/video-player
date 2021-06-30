import 'package:flutter/material.dart';
import 'package:videoplayer/screen/home.dart';
import 'package:videoplayer/screen/subjects.dart';

void main() {
  // getSubjects();

  runApp(MaterialApp(
    initialRoute: '/home',
    routes: {
      '/home': (context) => Home(),
      '/subjects': (context) => Subjects(),
    },
  ));
}
