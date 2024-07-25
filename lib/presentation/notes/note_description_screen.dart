import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:note_app/presentation/note_screen.dart';
import 'package:note_app/presentation/notes/note_form_screen.dart';
import 'package:note_app/store/const/theme/colors_const.dart';
import 'package:note_app/store/models/notes/note_hive_model.dart';
import 'package:note_app/store/models/widgets/return_appbar_actions.dart';
import 'package:note_app/store/services/notes/notes_services.dart';
import 'package:note_app/utils/date_functions/format_date_functions.dart';
import 'package:note_app/widgets/appBars/return_appbars.dart';
import 'package:note_app/widgets/theme/custom_theme_to_screen.dart';

class NoteDescriptionScreen extends StatelessWidget {
  final NoteModel note;
  const NoteDescriptionScreen({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return  CustomThemeToScreen(
      gradientColors: mapListGradient['ocean'] ?? [],
      screen:  NoteDescriptionScreenChild(
      note: note,
      ),
      preferredSizeHeight: screenHeight,
    );
  }
}

class NoteDescriptionScreenChild extends StatelessWidget {
  final NoteModel note;
  const NoteDescriptionScreenChild({
    super.key, 
    required this.note});

  @override
  Widget build(BuildContext context) {
    final noteStateService = Provider.of<NoteStateService>(context, listen: false);
    return   Scaffold(
      backgroundColor: Colors.transparent,
      appBar:   PreferredSize(
        preferredSize: const Size.fromHeight(55), child: ReturnAppBar(
        title: 'Regresar',
        backgroundColor: Colors.deepPurpleAccent,
        iconColor: Colors.white,
        textColor: Colors.white,
        goNoteHome: true,
        actions: [
          ReturnAppBarActions(
            icon: Icons.delete,
            onPressed:  () => {
              noteStateService.removeItem(noteId: note.noteId),
              Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const NotesScreen()),
              )
            }
          ),
          ReturnAppBarActions(
            icon: Icons.edit,
            onPressed:  () => {
              Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  NoteForm(note: note)),
              )
            }
          ),
        ],
      )),
      body:  Column(
        children: [    
          const SizedBox(height: 10)   ,  
          const Center(
            child: Text('Generales', style: TextStyle(
              fontWeight: FontWeight.bold, 
              fontSize: 20,
              color: Colors.white
              )),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Card(
              child: SizedBox(
                width: double.infinity,
                height: 55,
                child: Column(children: [
                  const SizedBox(height: 16),
                  Text(note.title, style: TextStyle(
                    color: note.color,
                    fontSize: 18,
                    fontWeight: FontWeight.w400
                  ))
                ],),
              ),
            ),
          ), 
          const Center(
            child: Text('Desgloce', style:  TextStyle(
              fontWeight: FontWeight.bold, 
              fontSize: 20,
              color: Colors.white
              )),
          ),
          Padding(
            padding:  const EdgeInsets.all(15),
            child: 
          Card(
              child: SizedBox(
                width: double.infinity,
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          const SizedBox(width: 10),
                          CircleAvatar(backgroundColor: note.color ,child: Text(note.emoji , style: const TextStyle(fontSize: 20)),),
                          const SizedBox(width: 15),
                          Text(note.category, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: note.color))
                        ],
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [                          
                          Text('Fecha', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                          SizedBox(width: 120),
                        ],
                      ),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [                          
                          Text( formatDateDifference(note.creationDate), style: TextStyle(
                            fontSize: 10, 
                            fontWeight: 
                            FontWeight.bold,
                            color: note.color
                            )),
                          const SizedBox(width: 20),
                        ],
                      ),
                      const Row(
                        children: [
                          SizedBox(width: 10),
                          Text('Descripción', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold))
                        ],
                      ),
                      Row(
                        children: [
                          const SizedBox(width: 10),
                          Text(note.description, style:  TextStyle(fontSize: 10, fontWeight: FontWeight.bold,color: note.color))
                        ],
                      ),
                      const SizedBox(height: 22)                      
                    ],
                  ),
                ),
          ),
          ),
        ],
      )
    );
  }
}