import 'package:flutter/material.dart';
import 'package:note_app/store/const/notes/notes_categories_const.dart';
import 'package:note_app/widgets/theme/custom_app_bar_clipper.dart';
import 'package:note_app/widgets/inputs/custom_dropdown_menu_category.dart';

class ShapeWaveAppbarNote extends StatefulWidget implements PreferredSizeWidget {
  final List<Color> colorGradient;
  final String inspirationWord;
  final double preferredSizeHeigth;
  final void Function(bool isExpanded) changePreferedSideHeight;
  final void Function(String? value) handleChange;

  const ShapeWaveAppbarNote({
    super.key, 
    required this.colorGradient, 
    required this.inspirationWord,
    required this.preferredSizeHeigth,
    required this.changePreferedSideHeight,
    required this.handleChange
    });

  @override
  ShapeWaveAppbarNoteState createState() => ShapeWaveAppbarNoteState();

  @override
  Size get preferredSize => Size.fromHeight(preferredSizeHeigth);
}

class ShapeWaveAppbarNoteState extends State<ShapeWaveAppbarNote> {
  bool _isExpander = true;
  
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomAppBarClipper(),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: widget.colorGradient,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            AppBar(
              leading: IconButton(
                icon: _isExpander == true ? const Icon(Icons.sort , color: Colors.white) : 
                const Icon(Icons.menu , color: Colors.white),
                onPressed: () {
                  widget.changePreferedSideHeight(!_isExpander);
                  setState(() {
                    _isExpander = !_isExpander;
                  });
                },
              ),
              backgroundColor: Colors.transparent,
              elevation: 2,
            ),
            if(_isExpander)
            const Text(
              'Programa Tus Cosas',
              style: TextStyle(
                color: Colors.white,
                fontSize: 11,
              ),
            ),
            if(_isExpander)
            SizedBox.fromSize(size: const Size.fromHeight(12)),
            if(_isExpander)
            Text(
              widget.inspirationWord,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
            if(_isExpander)
            SizedBox.fromSize(size: const Size.fromHeight(20)),
            CustomDropdownMenuCategory(
              dropCategory: dropNotesCategories,
              onPressed: widget.handleChange
              ),
            if(_isExpander)
            SizedBox.fromSize(size: const Size.fromHeight(40))
          ],
        ),
      ),
    );
  }
}