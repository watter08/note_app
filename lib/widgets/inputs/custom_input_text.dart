
import 'package:flutter/material.dart';

class CustomInputText extends StatelessWidget {
  const CustomInputText({
    super.key,
    required TextEditingController titleController,
    required String placeHolder,
    required Color borderColor
  }) : _titleController = titleController, 
       _placeHolder = placeHolder,
       _borderColor = borderColor;

  final TextEditingController _titleController;
  final String _placeHolder;
  final Color _borderColor;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _titleController,
      decoration: InputDecoration(
                labelText: _placeHolder,
                labelStyle: TextStyle(
    color: _borderColor, // Color similar a Bootstrap 5
                ),
                border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(4.0),
    borderSide: BorderSide(
      color: _borderColor,
      width: 1.0,
    ),
                ),
                focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(4.0),
    borderSide:  BorderSide(
      color: _borderColor,
      width: 1.0,
    ),
                ),
                enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(4.0),
    borderSide: BorderSide(
      color: _borderColor,
      width: 1.0,
    ),
    ),
    contentPadding: const EdgeInsets.symmetric(
    vertical: 10.0,
    horizontal: 12.0,
                ),
    ));
  }
}