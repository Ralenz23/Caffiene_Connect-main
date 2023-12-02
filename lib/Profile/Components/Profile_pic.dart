import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 155,
      child: Stack(
        clipBehavior: Clip.none, fit: StackFit.expand,
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage("assets/images/Profile/Profile_image.jpg"),
          ),
          Positioned(
            bottom: 0,
            right: 15,
            child: SizedBox(
              height: 46,
              width: 46,
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: const BorderSide(color: Colors.black),
                  ),
                  backgroundColor: const Color.fromARGB(197, 232, 235, 235)
                ),
                onPressed: () {},
                child: SvgPicture.asset("assets/icons/Camera_icon.svg"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
