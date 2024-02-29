
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final String icon;
  final Color color;
  const SocialButton(
      {super.key,
      required this.onTap,
      required this.title,
      required this.icon,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 46,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: color),
        child: Row(
          children: [
            const SizedBox(width: 10),
            SvgPicture.asset(
              icon,
              height: 24,
              width: 24,
            ),
            const SizedBox(width: 10),
            Container(width: 1, height: 40, color: Colors.white),
            const SizedBox(width: 10),
            Text(title,
                style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w400))
          ],
        ),
      ),
    );
  }
}
