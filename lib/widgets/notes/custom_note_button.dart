
import 'package:flutter/material.dart';
import 'package:note_app/store/const/theme/colors_const.dart';

class CustomNoteButtom extends StatelessWidget {
  final String title;
  final void Function() onPressed;
  const CustomNoteButtom({
    super.key,
    required this.title,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(    
        style: TextButton.styleFrom(
          backgroundColor: dropColors['purple'], // Color de fondo
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0)
          ),
          textStyle: const TextStyle(color: Colors.white),
          padding: const EdgeInsets.fromLTRB(25, 0, 25, 0)
      ),             
      child:  Text(title, style: const TextStyle(color: Colors.white)),
      onPressed: () => onPressed(),
    );
  }
}