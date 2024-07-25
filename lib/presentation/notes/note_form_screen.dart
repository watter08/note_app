import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:note_app/presentation/notes/note_description_screen.dart';
import 'package:note_app/store/const/notes/notes_categories_const.dart';
import 'package:note_app/store/const/theme/colors_const.dart';
import 'package:note_app/store/enums/toastification/type_toastification_message_icon_enum.dart';
import 'package:note_app/store/models/notes/note_hive_model.dart';
import 'package:note_app/store/services/notes/notes_services.dart';
import 'package:note_app/utils/string_functions/string_functions.dart';
import 'package:note_app/utils/toastification/toastify_functions.dart';
import 'package:note_app/widgets/inputs/custom_color_dropdown_button.dart';
import 'package:note_app/widgets/emoticons/emoji_modal_picker.dart';
import 'package:note_app/widgets/inputs/custom_input_text.dart';
import 'package:note_app/widgets/inputs/textarea_input.dart';
import 'package:note_app/widgets/inputs/custom_dropdown_strings.dart';
import 'package:note_app/widgets/theme/custom_theme_to_screen.dart';

class NoteForm extends StatelessWidget {
  final NoteModel? note;
  const NoteForm({super.key, this.note});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return  CustomThemeToScreen(
      gradientColors: mapListGradient['ocean']  ?? [],
      screen: NoteFormS(note: note),
      preferredSizeHeight: screenHeight,
    );
  }
}


class NoteFormS extends StatefulWidget {
  final NoteModel? note;

  const NoteFormS({super.key, this.note});

  @override
  NoteFormState createState() => NoteFormState();
}




class NoteFormState extends State<NoteFormS> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late String _category;
  late String _emoji;
  late Color _color;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.note?.title ?? '');
    _descriptionController = TextEditingController(text: widget.note?.description ?? '');
    _category = widget.note?.category ?? dropNotesCategoriesForm.first;
    _color = widget.note?.color ?? Colors.blue;
    _emoji = widget.note?.emoji ?? '';
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(55),
        child:  AppBar(
        title: Text(widget.note == null ? 'Agregar Nota' : 'Editar Nota', style: const TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurpleAccent,
        iconTheme: const IconThemeData(color: Colors.white),
              ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 16, 0,16),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(35,15,35,15),
                child:EmojiPickerButton(
                onEmojiSelected: (emoji) {
                  _emoji = emoji;
                },
              )
              ),        
              Center(child: Text(_emoji, style: const TextStyle(fontSize: 25),)),      
              const SizedBox(height: 10),
              CustomDropdownStrings(
                drop: dropNotesCategoriesForm,
                initialValue: _category,
                setValue: (String value){
                  _category = value;
                }
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.fromLTRB(35,15,35,15),
                child: CustomInputText(
                titleController: _titleController,
                placeHolder: 'Titulo',
                borderColor: Colors.white
                )
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.fromLTRB(35,15,35,15),
                child:TextareaInput(
                titleController: _descriptionController,
                placeHolder: 'Descripción',
                borderColor: Colors.white
              )
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.fromLTRB(35,0,35,15),
                child: CustomColorDropdownButton(
                selectedColor: _color,                
                onColorChanged: (Color color) {
                  setState(() {
                    _color = color;
                  });
                },
              )),
              ElevatedButton(
                child: const Text('Guardar'),
                onPressed: () {                  
                  final note = NoteModel(
                    noteId: widget.note?.noteId ?? DateTime.now().millisecondsSinceEpoch,
                    title: _titleController.text,
                    description: _descriptionController.text,
                    creationDate: widget.note?.creationDate ?? DateTime.now(),
                    category: _category,
                    color: _color,
                    emoji: _emoji
                  );
                  if(isNullOrEmpty(note.title)) {
                     showCustomToast(message: 'Las notas deben tener un Titulo', type: ETypeToastificationMessageIcon.warning);
                     return;
                    }
                  final noteStateService = Provider.of<NoteStateService>(context, listen: false);
                  if (widget.note == null) {                    
                    noteStateService.createItem(note: note);
                    showCustomToast(message: 'Nota creada exitosamente', type: ETypeToastificationMessageIcon.success);
                  } else {
                    noteStateService.updateItem(noteId: note.noteId ,note: note);
                    showCustomToast(message: 'Nota actualizada exitosamente', type: ETypeToastificationMessageIcon.info);
                  }
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  NoteDescriptionScreen(note: note)),
                    );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}