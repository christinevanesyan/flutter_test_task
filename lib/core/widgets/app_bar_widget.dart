import 'package:flutter/material.dart';
import 'package:flutter_test_task/core/constants/app_colors.dart';
import 'package:flutter_test_task/core/widgets/inner_shadow_container.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
    this.leading,
    this.trailing,
    required this.title,
  });
  final Widget? leading;
  final Widget? trailing;
  final String title;
  @override
  Widget build(BuildContext context) {
    return InnerShadowContainer(
        child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          leading ?? const SizedBox.shrink(),
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: AppColors.white),
          ),
          trailing ?? const SizedBox.shrink(),
        ],
      ),
    ));
  }
}
