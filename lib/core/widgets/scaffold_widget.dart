import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_test_task/core/constants/app_colors.dart';
import 'package:flutter_test_task/gen/assets.gen.dart';

class ScaffoldWidget extends StatelessWidget {
  const ScaffoldWidget({super.key, required this.body});
  final Widget body;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.background,
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                Assets.images.splashScreen.path,
                fit: BoxFit.fill,
              ),
            ),
            Positioned.fill(
                child: SvgPicture.asset(
              Assets.icons.pattern,
              fit: BoxFit.fill,
            )),
            Positioned.fill(
                child: Container(
              color: AppColors.background.withOpacity(0.5),
            )),
            Positioned.fill(child: body),
          ],
        ));
  }
}
