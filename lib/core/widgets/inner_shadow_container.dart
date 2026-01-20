import 'package:flutter/material.dart';
import 'package:flutter_test_task/core/constants/app_colors.dart';

class InnerShadowContainer extends StatelessWidget {
  const InnerShadowContainer(
      {super.key,
      required this.child,
      this.borderRadius = 20,
      this.padding,
      this.border,
      this.innerShadowColor1,
      this.innerShadowColor2,
      this.innerShadowColor3});

  final Widget child;
  final double borderRadius;
  final EdgeInsets? padding;
  final Border? border;
  final Color? innerShadowColor1;
  final Color? innerShadowColor2;
  final Color? innerShadowColor3;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: padding ??
              EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          decoration: BoxDecoration(
              color: innerShadowColor1 ?? AppColors.innerShadowColor1,
              borderRadius: BorderRadius.circular(borderRadius),
              border: border),
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
                    color: innerShadowColor2 ?? AppColors.innerShadowColor2,
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
                    color: innerShadowColor3 ?? AppColors.innerShadowColor3,
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
