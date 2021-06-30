import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:videoplayer/utils/initvp.dart';

class ChapterScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ChapterScreenState();
}

class _ChapterScreenState extends State<ChapterScreen> {
  List<String> chapterNames = [];
  String currentChapter = "";
  List<String> videoList = [];
  Map data = {};

  void setup() async {
    try {
      data = ModalRoute.of(context)!.settings.arguments as Map;
      InitVP vp = InitVP(location: data['subject']);
      await vp.setup();
      if (currentChapter.length > 0) {
        InitVP vp1 = InitVP(location: currentChapter);
        await vp1.setup();
        videoList = vp1.fileList;
      }

      if (mounted) {
        setState(() {
          chapterNames = vp.fileList;
        });
      }
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
          backgroundColor: Colors.teal[400],
        ),
        backgroundColor: Colors.teal[400],
        body: Container(
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
                  child: Container(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: chapterNames
                            .map((e) => ChapterCard(
                                name: e,
                                videos: () {
                                  setState(() {
                                    currentChapter = e;
                                  });
                                }))
                            .toList(),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 9,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 0.0),
                  child: Container(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children:
                            videoList.map((e) => buildVideoCard(e)).toList(),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class ChapterCard extends StatelessWidget {
  final String name;
  final VoidCallback videos;

  ChapterCard({required this.name, required this.videos});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 250,
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            color: Colors.cyan,
            child: Center(
              child: Text(trimPath(name)),
            ),
          ),
        ),
        onTap: videos,
      ),
    );
  }
}

Widget buildVideoCard(String video) => SizedBox(
      height: 100,
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 0.0, 40.0, 5.0),
          child: Card(
            color: Colors.cyan,
            child: Center(
              child: Text(trimPath(video)),
            ),
          ),
        ),
        onTap: () {
          print("Video playing : $video");
        },
      ),
    );
