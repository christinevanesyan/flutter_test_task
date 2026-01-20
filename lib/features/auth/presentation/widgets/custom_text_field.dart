import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_test_task/core/constants/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String placeholder;
  final TextEditingController? controller;
  final bool isPassword;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  const CustomTextField({
    super.key,
    required this.label,
    required this.placeholder,
    this.controller,
    this.isPassword = false,
    this.keyboardType,
    this.validator,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return _InnerShadowBox(
      borderRadius: 8.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: AppColors.gray),
            ),
            TextFormField(
              controller: controller,
              obscureText: isPassword,
              keyboardType: keyboardType,
              validator: validator,
              onChanged: onChanged,
              autocorrect: false,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: AppColors.gray),
              decoration: InputDecoration(
                hintText: placeholder,
                hintStyle: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: AppColors.gray),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.gray),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.gray, width: 2),
                ),
              ),
              onTapOutside: (_) =>
                  FocusManager.instance.primaryFocus?.unfocus(),
            ),
          ],
        ),
      ),
    );
  }
}

class _InnerShadowBox extends StatelessWidget {
  const _InnerShadowBox({
    required this.child,
    required this.borderRadius,
  });

  final Widget child;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Stack(
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
            child: Container(),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(borderRadius),
              border: Border.all(
                width: 0.5,
                color: const Color(0xFF87858F),
              ),
            ),
            child: child,
          ),
          Positioned.fill(
            child: IgnorePointer(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(borderRadius),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFE3E3E3).withOpacity(0.2),
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
                  child:
                      Container(color: AppColors.background.withOpacity(0.2)))),
        ],
      ),
    );
  }
}
