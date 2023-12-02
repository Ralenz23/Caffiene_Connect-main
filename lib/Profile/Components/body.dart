import 'package:flutter/material.dart';
import 'Profile_menu.dart';
import 'Profile_pic.dart';



class Body extends StatelessWidget {
  const Body({Key? key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ProfilePic(),
        const SizedBox(height: 20),
        ProfileMenu(
          icon: "assets/icons/User_icon.svg",
          text: "My Account",
          press: () {},
        ),
        ProfileMenu(
          icon: "assets/icons/Bell_icon.svg",
          text: "Notifications",
          press: () {},
        ),ProfileMenu(
          icon: "assets/icons/Settings_icon.svg",
          text: "Settings",
          press: () {},
        ),ProfileMenu(
          icon: "assets/icons/HelpCenter_icon.svg",
          text: "Help Center",
          press: () {},
        ),
        ProfileMenu(
          icon: "assets/icons/Logout_icon.svg",
          text: "Logout",
          press: () {},
        ),
      ],
    );
  }
}

