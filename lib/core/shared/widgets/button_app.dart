import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_gaps.dart';

class AppButton extends StatefulWidget {
  const AppButton(
      {super.key, this.backgroundColor, required this.childButton, this.onTap});
  final Color? backgroundColor;
  final Widget childButton;
  final Function()? onTap;

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Ink(
        height: DSGaps.hapV70(context),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: widget.backgroundColor ?? AppColors.primary,
        ),
        child: Center(child: widget.childButton),
      ),
    );
  }
}
