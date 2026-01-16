import 'package:flutter/material.dart';
import 'package:flutter_test_task/core/constants/app_colors.dart';

class PrimaryButton extends StatefulWidget {
  final String text;

  final VoidCallback? onPressed;

  const PrimaryButton({
    super.key,
    required this.text,
    this.onPressed,
  });

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  BorderRadius get _borderRadius =>
      const BorderRadius.all(Radius.circular(8.0));

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Ink(
        decoration: BoxDecoration(
            borderRadius: _borderRadius, gradient: AppColors.gradient1),
        child: ElevatedButton(
            onPressed: widget.onPressed,
            style: ButtonStyle(
              elevation: WidgetStateProperty.resolveWith<double>(
                  (Set<WidgetState> states) => 0),
              minimumSize: WidgetStateProperty.resolveWith<Size?>(
                  (Set<WidgetState> states) =>
                      const Size(double.infinity, 48.0)),
              shape: WidgetStateProperty.resolveWith(
                  (Set<WidgetState> states) =>
                      RoundedRectangleBorder(borderRadius: _borderRadius)),
              textStyle: WidgetStateProperty.resolveWith(
                  (Set<WidgetState> states) =>
                      Theme.of(context).textTheme.titleMedium),
              foregroundColor: WidgetStateProperty.resolveWith<Color?>(
                  (Set<WidgetState> states) {
                if (states.contains(WidgetState.pressed)) {
                  return AppColors.background;
                } else if (states.contains(WidgetState.disabled)) {
                  return AppColors.buttonTextDisable;
                } else {
                  return AppColors.white;
                }
              }),
              overlayColor: WidgetStateProperty.resolveWith<Color?>(
                  (Set<WidgetState> states) => Colors.transparent),
              backgroundColor: WidgetStateProperty.resolveWith<Color?>(
                (Set<WidgetState> states) {
                  if (states.contains(WidgetState.pressed)) {
                    return AppColors.white;
                  } else if (states.contains(WidgetState.disabled)) {
                    return AppColors.buttonDisabled;
                  } else if (states.contains(WidgetState.error)) {
                    return AppColors.buttonError;
                  } else {
                    return Colors.transparent;
                  }
                },
              ),
            ),
            child: Text(widget.text)),
      ),
    );
  }
}
