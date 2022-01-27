import 'package:flutter/material.dart';
import 'package:nftgram/Widgets/profileWidget.dart';

class ProfileScreen extends StatefulWidget {
  static const screenId = "profile_screen";

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ProfileWidget(),
        Row(),
      ],
    );
  }
}
