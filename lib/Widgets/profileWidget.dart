import 'package:flutter/material.dart';
import 'package:nftgram/screens/profileStats.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 8.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://nudatasecurity.com/wp-content/uploads/2016/10/hacker.jpg",
                ),
                radius: 35.0,
              ),
              Expanded(
                child: Row(
                  children: const [
                    ProfileStats(
                      title: "Posts",
                      value: "13",
                    ),
                    ProfileStats(
                      title: "Followers",
                      value: "115",
                    ),
                    ProfileStats(
                      title: "Following",
                      value: "139",
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Sparsh Agarwal",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13.0,
                  ),
                ),
                Text(
                  "me 1% of the time",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 13.0,
                  ),
                ),
                Text(
                  "sparshagarwal.xyz",
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 13.0,
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(5.0),
              ),
            ),
            padding: const EdgeInsets.all(6.0),
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            child: const Center(
              child: Text(
                "Edit Profile",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
