import 'package:caffeine_connectfull/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    super.key,
    required this.text,
    required this.icon,
    required this.press,
  });

  final String text, icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          backgroundColor: const Color(0xFFF5F6F9), // Use a constant color
        ),
        onPressed: press,
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              width: 22,
              // ignore: deprecated_member_use
              color: kPrimaryColor, // Use a constant color
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                text,
                // ignore: deprecated_member_use
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
            const Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
