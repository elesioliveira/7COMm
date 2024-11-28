import 'package:flutter/material.dart';

import 'app_colors.dart';

TextStyle heading1({Color? color, FontWeight? fontWeight, double? fontSize}) {
  return TextStyle(
    fontSize: fontSize ?? 20,
    color: color ?? AppColors.textPrimary,
    fontWeight: fontWeight ?? FontWeight.bold,
    fontStyle: FontStyle.normal,
  );
}

TextStyle normal({Color? color, FontWeight? fontWeight, double? fontSize}) {
  return TextStyle(
    fontSize: fontSize ?? 16,
    color: color ?? AppColors.textPrimary,
    fontWeight: fontWeight ?? FontWeight.w500,
    fontStyle: FontStyle.normal,
  );
}

TextStyle subTitle({Color? color, FontWeight? fontWeight, double? fontSize}) {
  return TextStyle(
    fontSize: fontSize ?? 16,
    color: color ?? AppColors.textSecondary,
    fontWeight: fontWeight ?? FontWeight.normal,
    fontStyle: FontStyle.normal,
  );
}
