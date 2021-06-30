import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
      ),
      body: Row(
        children: [
          Text('Home screen'),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(onPressed: () {
              Navigator.pushNamed(context, '/subjects');
            }),
          )
        ],
      ),
    );
  }
}
