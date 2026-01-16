import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test_task/gen/assets.gen.dart';

class CheckBox extends StatelessWidget {
  const CheckBox(
      {required this.isChecked,
      required this.onChanged,
      super.key,
      this.iconPath,
      this.iconPathDisabled});
  final bool isChecked;
  final ValueChanged<bool> onChanged;
  final String? iconPath;
  final String? iconPathDisabled;

  factory CheckBox.star(
      {required bool isChecked, required ValueChanged<bool> onChanged}) {
    return CheckBox(
      isChecked: isChecked,
      onChanged: onChanged,
      iconPath: Assets.icons.starOn,
      iconPathDisabled: Assets.icons.starOff,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
        switchOutCurve: Curves.easeInExpo,
        switchInCurve: Curves.easeOutExpo,
        duration: const Duration(milliseconds: 500),
        transitionBuilder: (Widget child, Animation<double> animation) =>
            ScaleTransition(scale: animation, child: child),
        child: IconButton(
            key: ValueKey<bool>(isChecked),
            onPressed: () => onChanged.call(!isChecked),
            icon: SvgPicture.asset(isChecked
                ? iconPath ?? Assets.icons.tickOn
                : iconPathDisabled ?? Assets.icons.tickOff)));
  }
}
