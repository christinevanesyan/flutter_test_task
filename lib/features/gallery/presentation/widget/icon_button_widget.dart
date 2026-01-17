import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IconButtonWidget extends StatelessWidget {
  const IconButtonWidget(
      {super.key, required this.iconPath, required this.onTap});
  final String iconPath;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.25),
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(
          iconPath,
          height: 22,
          width: 22,
        ),
      ),
    );
  }
}
