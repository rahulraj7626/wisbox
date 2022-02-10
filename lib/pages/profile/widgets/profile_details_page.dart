import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexmat/widgets/user_circle_avatar.dart';

import 'edit_profile_page.dart';

///
/// Created by Sunil Kumar (sunil@smarttersstudio.com)
/// On 06-11-2021 06:54 PM
///
class ProfileDetailsPage extends StatelessWidget {
  static const routeName = "/ProfileDetailsPage";

  const ProfileDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile"), actions: [
        TextButton(
            onPressed: () {
              Get.toNamed(EditProfilePage.routeName);
            },
            child: const Text("Edit"))
      ]),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Center(
            child: UserCircleAvatar(
              imageUrl:
                  "https://gitlab.com/uploads/-/system/user/avatar/3477620/avatar.png?width=90",
              name: "Sunil",
              radius: 42,
            ),
          ),
          const SizedBox(height: 12),
          Center(
            child: Text(
              "customerName",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 22,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Text(
                "formattedAddress",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xff8E81F4),
                  fontSize: 14,
                ),
              ),
            ),
          ),
          const SizedBox(height: 32),
          const Text(
            'Email Id',
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              const Icon(
                Icons.mail_outline,
                size: 18,
              ),
              const SizedBox(width: 4),
              Expanded(
                  child: Text(
                "email",
                style: const TextStyle(color: Color(0xff808080), fontSize: 16),
              ))
            ],
          ),
          const Divider(color: Colors.grey),
          const Text(
            'Phone number',
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              const Icon(
                Icons.phone,
                size: 18,
              ),
              const SizedBox(width: 4),
              Expanded(
                  child: Text(
                "phNumber",
                style: const TextStyle(color: Color(0xff808080), fontSize: 16),
              ))
            ],
          ),
          const Divider(color: Colors.grey),
          const Text(
            'Gender',
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: const [
              Icon(
                Icons.male,
                size: 18,
              ),
              SizedBox(width: 4),
              Expanded(
                  child: Text(
                "Male",
                style: TextStyle(color: Color(0xff808080), fontSize: 16),
              ))
            ],
          ),
        ],
      ),
    );
  }
}
