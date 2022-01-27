import 'package:flutter/material.dart';
import 'package:nftgram/utilities/styles.dart';

class ProfileStats extends StatelessWidget {
  final String value;
  final String title;

  const ProfileStats({
    Key? key,
    required this.value,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: kProfileStatsValueTextStyle(),
        ),
        Text(
          title,
          style: kProfileStatsTitleTextStyle(),
        ),
      ],
    );
  }
}
