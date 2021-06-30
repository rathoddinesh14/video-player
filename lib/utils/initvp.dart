import 'dart:io';

class InitVP {
  String location;
  List<String> fileList;

  InitVP({required this.location}) : fileList = [];

  Future<void> setup() async {
    fileList.clear();
    final myHome = Directory(location);

    await for (var entity
        in myHome.list(recursive: false, followLinks: false)) {
      fileList.add(entity.path);
    }
  }
}

void getChapters(String subj) {}

String trimPath(String input) {
  return input.substring(input.lastIndexOf('/') + 1);
}
