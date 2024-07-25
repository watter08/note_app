import 'package:flutter/material.dart';
import 'package:note_app/store/const/theme/colors_const.dart';
import 'package:note_app/widgets/inputs/custom_center_text.dart';
import 'package:note_app/widgets/theme/custom_theme_to_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return  CustomThemeToScreen(
      gradientColors: mapListGradient['ocean'] ?? [],
      screen:  const Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomCenterText(
              'Bienvenido',
              fontColor: Colors.white,
              fontSize: 30,
            ),
            CustomCenterText(
              'A tu',
              fontColor: Colors.white,
              fontSize: 30,
            ),
            CustomCenterText(
              'Recordatorio',
              fontColor: Colors.white,
              fontSize: 30,
            ),
            CustomCenterText(
              'Hecho App',
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

