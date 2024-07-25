import 'package:flutter/material.dart';

class CustomDropdownStrings extends StatelessWidget {
   final List<String> drop;
   final void Function(String value) setValue;
   final String? initialValue;

  const CustomDropdownStrings({
    super.key,
    required this.drop,
    required this.setValue,
    this.initialValue
  });

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      expandedInsets: const EdgeInsets.all(30),
      menuStyle: MenuStyle(
        backgroundColor: WidgetStateProperty.all(Colors.white),
      ),
      textStyle: const TextStyle(
        color: Color(0xFF4481EB),
        fontSize: 18,
        fontWeight: FontWeight.w600
      ),
      initialSelection: initialValue ?? drop.first,
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        border: OutlineInputBorder(
          borderSide: BorderSide.none, // No border
          borderRadius: BorderRadius.circular(15.0), // Circular border radius
        ),
      ),
      onSelected: (String? value) {  setValue(value!); },
      dropdownMenuEntries: drop.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),
    );
  }
}