import 'package:flutter/material.dart';

import 'colors.dart';

String gilroyFontFamily = "Gilroy";

ThemeData themeData = ThemeData(
  fontFamily: gilroyFontFamily,
  visualDensity: VisualDensity.adaptivePlatformDensity,
    primarySwatch: Colors.blueGrey,
  colorScheme:
      ColorScheme.fromSwatch().copyWith(secondary: AppColors.primaryColor),
);
