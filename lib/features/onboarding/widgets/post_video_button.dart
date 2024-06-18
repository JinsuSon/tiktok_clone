import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/contants/sizes.dart';

class PostVideoButton extends StatelessWidget {
  const PostVideoButton({super.key, required this.inverted});
  final bool inverted;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          top: 11,
          right: 43,
          child: Container(
            height: 35,
            width: 25,
            decoration: BoxDecoration(
              color: const Color(0xff61d4f0),
              borderRadius: BorderRadius.circular(Sizes.size8),
            ),
            padding: const EdgeInsets.symmetric(horizontal: Sizes.size8),
          ),
        ),
        Positioned(
          top: 11,
          left: 42,
          child: Container(
            height: 35,
            width: 25,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(Sizes.size8),
            ),
            padding: const EdgeInsets.symmetric(horizontal: Sizes.size8),
          ),
        ),
        Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.size12),
            height: 35,
            width: 50,
            decoration: BoxDecoration(
                color: !inverted ? Colors.white : Colors.black,
                borderRadius: BorderRadius.circular(Sizes.size6)),
            child: Center(
              child: FaIcon(
                FontAwesomeIcons.plus,
                color: !inverted ? Colors.black : Colors.white,
                size: 18,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
