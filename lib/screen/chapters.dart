import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:videoplayer/utils/initvp.dart';

class ChapterScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ChapterScreenState();
}

class _ChapterScreenState extends State<ChapterScreen> {
  List<String> chapterNames = [];
  Map data = {};

  void setup() async {
    try {
      data = ModalRoute.of(context)!.settings.arguments as Map;
      InitVP vp = InitVP(location: data['chapter']);
      await vp.setupSubjects();
      setState(() {
        chapterNames = vp.fileList;
      });
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    setup();
    return Scaffold(
        appBar: AppBar(
          title: Text('Chapters'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: generateChapterCards(context, chapterNames),
          ),
        ));
  }
}

Widget buildChapterCard(BuildContext context, String text) => SizedBox(
      height: 150,
      width: 250,
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            color: Colors.blue,
            child: Center(
              child: Text(text),
            ),
          ),
        ),
        onTap: () {
          Navigator.pushNamed(context, '/chapters',
              arguments: {'chapter': text});
        },
      ),
    );

List<Widget> generateChapterCards(
    BuildContext context, List<String> chapterNames) {
  List<Widget> chapters =
      chapterNames.map((e) => buildChapterCard(context, e)).toList();

  return chapters;
}
