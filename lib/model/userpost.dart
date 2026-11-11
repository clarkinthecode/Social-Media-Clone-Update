import 'usercomment.dart';

class Userpost {
  final String userimg;
  final String username;
  final String time;
  final String postcontent;
  final String postimg;
  String numcomments;
  final String numshare;
  bool isliked;
  List<Usercomment> comments;

  Userpost({
    required this.userimg,
    required this.username,
    required this.time,
    required this.postcontent,
    required this.postimg,
    required this.numcomments,
    required this.numshare,
    required this.isliked,
    List<Usercomment>? comments,
  }) : comments = comments ?? [];
}
