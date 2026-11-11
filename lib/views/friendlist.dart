import 'package:flutter/material.dart';
import '../model/friend.dart';
import '../model/userdata.dart';

class Friendlist extends StatelessWidget {
  const Friendlist({super.key, required this.userdata});

  final Userdata userdata;

  final TextStyle followTxtStyle = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  Widget friend(Friend friend) => Card(
    elevation: 2,
    clipBehavior: Clip.antiAlias,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    child: SizedBox(
      height: 180,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Image.asset(
              friend.img,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
            child: Text(
              friend.name,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    ),
  );

  Widget friendListGrid() {
    List<Widget> rows = [];
    for (int i = 0; i < userdata.friendList.length; i += 3) {
      List<Widget> rowChildren = [];
      for (int j = i; j < i + 3 && j < userdata.friendList.length; j++) {
        rowChildren.add(
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: friend(userdata.friendList[j]),
            ),
          ),
        );
      }
      rows.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: rowChildren,
          ),
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: rows,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Friends', style: followTxtStyle),
              Text('${userdata.friendList.length} Friends'),
            ],
          ),
        ),
        const SizedBox(height: 8),
        friendListGrid(),
      ],
    );
  }
}
