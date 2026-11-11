import 'package:flutter/material.dart';
import '../model/userdata.dart';
import '../model/userpost.dart';
import 'profile.view.dart';

class Postlist extends StatefulWidget {
  const Postlist({super.key, required this.userdata});

  final Userdata userdata;

  @override
  State<Postlist> createState() => _PostlistState();
}

class _PostlistState extends State<Postlist> {
  final TextStyle nametxtStyle = const TextStyle(fontSize: 16, fontWeight: FontWeight.bold);

  void gotoPage(BuildContext context, dynamic page) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => page)).then((_) {
      setState(() {});
    });
  }

  Widget buttons(Userpost userPost) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      TextButton.icon(
        style: TextButton.styleFrom(
          foregroundColor: (userPost.isliked) ? Colors.blue : Colors.grey,
        ),
        onPressed: () {
          setState(() {
            userPost.isliked = !userPost.isliked;
          });
        },
        icon: const Icon(Icons.thumb_up),
        label: const Text('Like'),
      ),
      TextButton.icon(
        style: TextButton.styleFrom(foregroundColor: Colors.grey),
        onPressed: () {
          gotoPage(context, ProfileView(userPost: userPost, userData: widget.userdata));
        },
        icon: const Icon(Icons.message),
        label: const Text('Comment'),
      ),
      TextButton.icon(
        style: TextButton.styleFrom(foregroundColor: Colors.grey),
        onPressed: () {},
        icon: const Icon(Icons.share),
        label: const Text('Share'),
      ),
    ],
  );

  Widget postCount(Userpost userPost) => Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Text('${userPost.comments.length} Comments'),
      const Text(' '),
      const SizedBox(width: 20),
      Text('${userPost.numshare} Shares'),
    ],
  );

  Widget postImage(Userpost userPost) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.asset(
        userPost.postimg,
        width: double.infinity,
        fit: BoxFit.fitWidth,
      ),
    ),
  );

  Widget postHeader(Userpost userPost) => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage(userPost.userimg),
        ),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(userPost.username, style: nametxtStyle),
          Row(
            children: [
              Text(userPost.time),
              const SizedBox(width: 5),
              const Icon(Icons.public, size: 15),
            ],
          ),
        ],
      ),
    ],
  );

  Widget showPost(Userpost userPost) => Column(
    children: [
      postHeader(userPost),
      Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        child: Text(userPost.postcontent, style: nametxtStyle),
      ),
      postImage(userPost),
      postCount(userPost),
      const Divider(),
      buttons(userPost),
      SizedBox(height: 10, child: Container(color: Colors.grey.shade300)),
      const SizedBox(height: 15),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.userdata.userList.map((userPost) {
        return InkWell(
          onTap: () {
            gotoPage(context, ProfileView(userPost: userPost, userData: widget.userdata));
          },
          child: showPost(userPost),
        );
      }).toList(),
    );
  }
}
