import 'package:flutter/material.dart';

class CustomDropdownMenuCategory extends StatelessWidget {
   final List<String> dropCategory;
   final void Function(String? value) onPressed;

  const CustomDropdownMenuCategory({
    super.key,
    required this.dropCategory,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      enableSearch: true,
      expandedInsets: const EdgeInsets.all(30),
      menuStyle: MenuStyle(
        backgroundColor: WidgetStateProperty.all(Colors.white),
      ),
      textStyle: const TextStyle(
        color: Color(0xFF4481EB),
        fontSize: 18,
        fontWeight: FontWeight.w600
      ),
      initialSelection: dropCategory.first,
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        border: OutlineInputBorder(
          borderSide: BorderSide.none, // No border
          borderRadius: BorderRadius.circular(15.0), // Circular border radius
        ),
      ),
      onSelected: (String? value) { onPressed(value);  },
      dropdownMenuEntries: dropCategory.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),
    );
  }
}
