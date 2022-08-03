import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ubenwa/utils/colors.dart';
import 'package:ubenwa/widgets/circular_tab_indicator.dart';

/// Application themes styles

ThemeData lightTheme(BuildContext context) {
  return ThemeData.light().copyWith(
      primaryColor: AppColors.primaryColor,
      backgroundColor: AppColors.appBackgroundColor,
      appBarTheme: appBarTheme,
      tabBarTheme: tabBarTheme,
      textTheme: GoogleFonts.montserratTextTheme(
        Theme.of(context).textTheme,
      ).copyWith(
          headline1: headlineTextStyle,
          headline2: headlineBoldTextStyle,
          subtitle1: bodyMediumTextStyle,
          bodyText1: bodyTextStyle,
          bodyText2: bodyBoldTextStyle));
}

/// Application Text themes

final TextStyle headlineTextStyle =
    GoogleFonts.montserrat(fontWeight: FontWeight.w300, fontSize: 30, color: AppColors.white);

final TextStyle headlineBoldTextStyle =
    GoogleFonts.montserrat(fontWeight: FontWeight.w800, fontSize: 30);

final TextStyle bodyTextStyle =
    GoogleFonts.montserrat(fontWeight: FontWeight.w300, fontSize: 14);

final TextStyle bodyMediumTextStyle =
    GoogleFonts.montserrat(fontWeight: FontWeight.w300, fontSize: 17, color: AppColors.white);

final TextStyle bodyBoldTextStyle =
    GoogleFonts.montserrat(fontWeight: FontWeight.w500, fontSize: 14);

final TextStyle tabLabelStyle = GoogleFonts.montserrat(fontSize: 18);

/// Application Appbar theme

final AppBarTheme appBarTheme =
    AppBarTheme(backgroundColor: AppColors.appBackgroundColor, elevation: 0);

/// Application TabBar theme

final TabBarTheme tabBarTheme = TabBarTheme(
    indicator: CircleTabIndicator(color: AppColors.primaryColor, radius: 2),
    labelPadding: EdgeInsets.zero,
    labelStyle: tabLabelStyle.copyWith(fontWeight: FontWeight.w700),
    unselectedLabelStyle: tabLabelStyle,
    labelColor: AppColors.primaryColor,
    unselectedLabelColor: AppColors.grey);
