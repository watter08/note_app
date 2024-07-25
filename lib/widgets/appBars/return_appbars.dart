import 'package:flutter/material.dart';
import 'package:note_app/presentation/note_screen.dart';
import 'package:note_app/store/models/widgets/return_appbar_actions.dart';


class ReturnAppBar extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final Color textColor;
  final Color iconColor;
  final bool? goNoteHome;
  final List<ReturnAppBarActions>? actions;
  const ReturnAppBar({
    super.key,
    required this.title,
    required this.backgroundColor,
    required this.textColor,
    required this.iconColor,
    this.actions,
    this.goNoteHome
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: goNoteHome != null
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const NotesScreen()),
                    );
                },
              )
            : null,
      title:  Text( title , style: TextStyle(color: textColor)),
      backgroundColor: Colors.deepPurple,
      iconTheme:  IconThemeData(color: iconColor),
      actions: actions?.map((action) => IconButton(
        icon: Icon(action.icon),
        color: iconColor,
        onPressed: action.onPressed
      )).toList() ?? [],
    );
  }
}