import 'package:flutter/material.dart';
import 'package:note_app/store/const/theme/colors_const.dart';
import 'package:note_app/widgets/inputs/custom_center_text.dart';
import 'package:note_app/widgets/theme/custom_theme_to_screen.dart';

class SplashErrorScreen extends StatelessWidget {
  const SplashErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return  CustomThemeToScreen(
      gradientColors: mapListGradient['love'] ?? [],
      screen:  const Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomCenterText(
              'Ha Ocurrido',
              fontColor: Colors.white,
              fontSize: 30,
            ),
            CustomCenterText(
              'Un',
              fontColor: Colors.white,
              fontSize: 30,
            ),
            CustomCenterText(
              'Error',
              fontColor: Colors.white,
              fontSize: 30,
            ),
            CustomCenterText(
              'En la App',
              fontColor: Colors.white,
              fontSize: 30,
            ),
          ],
        ),
    ),
      preferredSizeHeight: screenHeight,
    );
  }
}

