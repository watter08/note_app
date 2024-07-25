import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:note_app/presentation/notes/note_form_screen.dart';
import 'package:note_app/store/const/inspirations/inspirations_words_const.dart';
import 'package:note_app/store/const/theme/colors_const.dart';
import 'package:note_app/store/models/notes/note_hive_model.dart';
import 'package:note_app/store/services/notes/notes_services.dart';
import 'package:note_app/widgets/inputs/custom_input_text.dart';
import 'package:note_app/widgets/notes/shape_wave_appbar_note.dart';
import 'package:note_app/widgets/notes/note_list_item.dart';

class HomeScreenBody extends StatefulWidget {
  final List<NoteModel> notes;
  final void Function(String? value) handleChange;
  final TextEditingController titleController;
  const HomeScreenBody({
    super.key,
    required this.notes,
    required this.handleChange,
    required this.titleController
  });

  @override
  HomeScreenBodyState createState() => HomeScreenBodyState();
}

class HomeScreenBodyState extends State<HomeScreenBody> {
  double _preferredSizeHeight = 260;

  void _changePreferredSizeHeight(bool isExpanded) {
    setState(() {
      _preferredSizeHeight = isExpanded ? 260 : 180;
    });
  }

  @override
  Widget build(BuildContext context) {
    final String randomInspiration = getRandomInspiration(dropInspirationWords);

    return Scaffold(
      appBar: ShapeWaveAppbarNote(
        colorGradient: mapListGradient['ocean'] ?? const [Color(0xFF5B7FFF), Color(0xFF33CCFC)],
        inspirationWord: randomInspiration,
        preferredSizeHeigth: _preferredSizeHeight,
        changePreferedSideHeight: _changePreferredSizeHeight,
        handleChange: widget.handleChange
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 2),
        child: Column(
          children: [            
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(const Color(0xFF5B7FFF)),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const NoteForm()),
                    );
                  },
                  child: const Text(
                    'Agregar Nota',
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ],
            ),
            CustomInputText(
                  borderColor: Colors.blue,
                  placeHolder: 'Busqueda por Titulo',
                  titleController:  widget.titleController
                ),
            const SizedBox(height: 20),
            Expanded(
              child: Consumer<NoteStateService>(
                builder: (context, noteStateService, child) {
                  final notes = noteStateService.notes;
                  return ListView.builder(
                    itemCount: notes.length,
                    itemBuilder: (context, index) {
                      final note = notes[index];
                      return NoteListItem(note: note);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}