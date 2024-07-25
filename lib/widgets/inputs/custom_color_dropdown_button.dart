import 'dart:math';
import 'package:flutter/material.dart';
import 'package:note_app/store/const/theme/colors_const.dart';


class CustomColorDropdownButton extends StatefulWidget {
  final Color selectedColor;
  final ValueChanged<Color> onColorChanged;

  const CustomColorDropdownButton({
    super.key,
    required this.selectedColor,
    required this.onColorChanged,
  });

  @override
  ColorDropdownState createState() => ColorDropdownState();
}

class ColorDropdownState extends State<CustomColorDropdownButton> {
  late Color _selectedColor;

  @override
  void initState() {
    super.initState();
    _selectedColor = widget.selectedColor;
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, Color> colors = dropCustomDropDownColors;
    return DropdownButtonFormField<Color>(
      focusColor: Colors.white,
      iconEnabledColor: Colors.white,
      isExpanded: true,
      value: _selectedColor,
      decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white, // Fondo blanco
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.0),
                borderSide: BorderSide(
                  color: Colors.grey[400]!,
                  width: 1.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.0),
                borderSide: const BorderSide(
                  color: Colors.blue,
                  width: 1.0,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.0),
                borderSide: BorderSide(
                  color: Colors.grey[400]!,
                  width: 1.0,
                ),
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 12.0,
              ),
            ),
      items: colors.keys.map((String colorKey) {
        return DropdownMenuItem<Color>(
          value: colors[colorKey],
          child: Row(
            children: [
               Text(
              'hello',
              style: TextStyle(
                backgroundColor: colors[colorKey],
                color: Colors.transparent                
              ),
            ),
            const SizedBox(width: 10),
              Text(colorKey)
            ]
          ),
        );
      }).toList(),
      onChanged: (Color? newColor) {
        if (newColor != null) {
          setState(() {
            _selectedColor = newColor;
          });
          widget.onColorChanged(newColor);
        }
      },
    );
  }


  bool useWhiteForeground(Color backgroundColor, {double bias = 1.0}) {
    int v = sqrt(pow(backgroundColor.red, 2) * 0.299 +
            pow(backgroundColor.green, 2) * 0.587 +
            pow(backgroundColor.blue, 2) * 0.114)
        .round();
    return v < 130 * bias;
  }
}