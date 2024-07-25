import 'package:flutter/material.dart';
import 'package:note_app/widgets/theme/custom_app_bar_clipper.dart';


class CustomThemeToScreen extends StatelessWidget {
  final Widget screen;
  final List<Color> gradientColors;
  final double preferredSizeHeight;
  const CustomThemeToScreen({
    super.key , 
    required this.screen,
    required this.gradientColors,
    required this.preferredSizeHeight
    });

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: PreferredSize(
        preferredSize:  Size.fromHeight(preferredSizeHeight),
          child: ClipPath(
            clipper: CustomAppBarClipper(),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: gradientColors,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: screen
            ),
          )
      )
    );
  }
}