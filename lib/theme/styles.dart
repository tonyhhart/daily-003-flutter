import 'package:daily_003_flutter/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData appTheme() {
  return ThemeData(
    primarySwatch: Colors.blue,
  );
}

AppBar appBar(String title) {
  return AppBar(
    title: Text(title),
    elevation: 1,
    backgroundColor: Colors.white,
    iconTheme: const IconThemeData(
      color: Colors.black, //change your color here
    ),
    titleTextStyle: GoogleFonts.poppins(
        textStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Color(0xFF090723))),
  );
}

SliverAppBar silverAppBar(String title) {
  return SliverAppBar(
    pinned: true,
    expandedHeight: 100.0,
    backgroundColor: Colors.white,
    flexibleSpace: FlexibleSpaceBar(
      expandedTitleScale: 1.3,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: [
            SvgPicture.asset("assets/logo.svg"),
            const SizedBox(width: 16),
            Expanded(
              child: UrbanistText(title, variant: UrbanistTextVariants.h4),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SvgPicture.asset("assets/icons/header_notifications.svg"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: SvgPicture.asset("assets/icons/header_favorites.svg"),
            ),
          ],
        ),
      ),
    ),
    elevation: 1,
    iconTheme: const IconThemeData(
      color: Colors.black, //change your color here
    ),
  );
}
