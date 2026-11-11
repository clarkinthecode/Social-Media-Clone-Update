import 'package:flutter/material.dart';
import 'model/userdata.dart';
import 'views/friendlist.dart';
import 'views/infoheader.dart';
import 'views/mainheader.dart';
import 'views/postlist.dart';

class SocialMedia extends StatefulWidget {
  const SocialMedia({super.key});

  @override
  State<SocialMedia> createState() => _SocialMediaState();
}

class _SocialMediaState extends State<SocialMedia> {
  final Userdata userdata = Userdata();

  final TextStyle followTxtStyle = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Salas Social Feed',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Mainheader(userdata: userdata),
            Infoheader(userdata: userdata),
            Friendlist(userdata: userdata),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  Text('Posts', style: followTxtStyle),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Postlist(userdata: userdata),
          ],
        ),
      ),
    );
  }
}
