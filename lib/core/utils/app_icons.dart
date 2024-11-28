import 'package:flutter/cupertino.dart';

import 'app_colors.dart';

Icon iconSearch({Color? colorIcon}) {
  return Icon(
    CupertinoIcons.chevron_back,
    color: colorIcon ?? AppColors.primary,
  );
}
