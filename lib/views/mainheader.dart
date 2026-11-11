import 'package:flutter/material.dart';
import '../model/userdata.dart';

class Mainheader extends StatelessWidget {
  const Mainheader({super.key, required this.userdata});
  final Userdata userdata;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(userdata.myUserAccount.img),
            radius: 40,
          ),
          const SizedBox(height: 10),
          Text(
            userdata.myUserAccount.name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            userdata.myUserAccount.email,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
