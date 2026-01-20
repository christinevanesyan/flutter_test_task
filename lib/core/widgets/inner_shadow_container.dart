import 'package:flutter/material.dart';
import 'package:flutter_test_task/core/constants/app_colors.dart';

class InnerShadowContainer extends StatelessWidget {
  const InnerShadowContainer({
    super.key,
    required this.child,
    this.borderRadius = 20,
  });

  final Widget child;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          decoration: BoxDecoration(
            color: AppColors.innerShadowColor1,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: child,
        ),
        Positioned.fill(
          child: IgnorePointer(
            ignoring: true,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.innerShadowColor2,
                    offset: const Offset(0, 1),
                    blurRadius: 40,
                    spreadRadius: 0,
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: IgnorePointer(
            ignoring: true,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.innerShadowColor3,
                    offset: const Offset(0, -82),
                    blurRadius: 68,
                    spreadRadius: -64,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
