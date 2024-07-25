import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:note_app/presentation/notes/note_description_screen.dart';
import 'package:note_app/presentation/notes/note_form_screen.dart';
import 'package:note_app/store/models/notes/note_hive_model.dart';
import 'package:note_app/store/services/notes/notes_services.dart';
import 'package:note_app/utils/string_functions/string_functions.dart';
import 'package:note_app/widgets/notes/custom_note_button.dart';

class NoteListItem extends StatelessWidget {
  final NoteModel note;

  const NoteListItem({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    final noteStateService = Provider.of<NoteStateService>(context, listen: false);

    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
             Container(
              color: note.color,
              child: ListTile(
              leading: const Icon(Icons.album),
              title: Text( note.title),
              subtitle: Text( truncateWithEllipsis(note.description) ),
              iconColor: Colors.white,
              textColor: Colors.white,
            ),
             ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[  
                CircleAvatar(
                  child: Text(note.emoji, style: const TextStyle(fontSize: 25)),
                ),
                const SizedBox(width: 15),   
                CustomNoteButtom(title: 'Borrar', onPressed:  (){
                      noteStateService.removeItem(noteId: note.noteId);
                }),    
                const SizedBox(width: 8),     
                CustomNoteButtom(title: 'Editar', onPressed:  (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NoteForm(note: note)),
                      );
                }),
                const SizedBox(width: 8),
                CustomNoteButtom(title: 'Ver', onPressed:  () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NoteDescriptionScreen(note: note,)),
                      );
                }),
                const SizedBox(width: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }
}