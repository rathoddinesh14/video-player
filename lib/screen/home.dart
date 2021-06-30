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
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/Aurora_borealis_pillars.jpg"),
                fit: BoxFit.cover)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: IconButton(
                color: Colors.white,
                icon: const Icon(Icons.play_arrow),
                tooltip: 'Next screen',
                onPressed: () {
                  Navigator.pushNamed(context, '/subjects');
                },
                iconSize: 150,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
