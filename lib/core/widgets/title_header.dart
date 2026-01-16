import 'package:flutter/material.dart';
import 'package:flutter_test_task/core/constants/app_colors.dart';

class TitleHeader extends StatelessWidget {
  const TitleHeader({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(title,
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 3
                    ..shader = AppColors.gradient1.createShader(
                      const Rect.fromLTWH(0, 0, 300, 80),
                    ),
                )),
        Text(title,
            style: Theme.of(context)
                .textTheme
                .headlineLarge
                ?.copyWith(color: AppColors.white)),
      ],
    );
  }
}
