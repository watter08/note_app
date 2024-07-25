import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:note_app/presentation/home/splash_error_screen.dart';
import 'package:note_app/presentation/home/splash_screen.dart';
import 'package:note_app/presentation/notes/home_screen_body.dart';
import 'package:note_app/store/const/notes/notes_categories_const.dart';
import 'package:note_app/store/models/notes/note_hive_model.dart';
import 'package:note_app/store/services/notes/notes_services.dart';
import 'package:note_app/utils/string_functions/string_functions.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  NoteListContainerState createState() => NoteListContainerState();
}

class NoteListContainerState extends State<NotesScreen> {
  List<NoteModel> _notes = [];
  bool _isLoading = true;
  String? _error;
  late TextEditingController titleController;

  @override
  void initState() {
    super.initState();
    _loadNotes();
    titleController = TextEditingController(text: '');
    titleController.addListener(_filterNotes);
  }

  @override
  void dispose() {
    titleController.dispose();
    super.dispose();
  }



  Future<void> _loadNotes() async {
    try {
      final noteStateService = Provider.of<NoteStateService>(context, listen: false);
      await noteStateService.getAllItems();
      setState(() {
        _notes = noteStateService.notes;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = 'Error loading notes: $e';
        _isLoading = false;
      });
    }
  }

  Future<void> _findByNoteCategory(String? noteCategory) async {
    try {
      final noteStateService = Provider.of<NoteStateService>(context, listen: false);
      if(noteCategory == dropNotesCategories.first){
        await noteStateService.getAllItems();
      }else{
        await noteStateService.filterItems((note) => note.category == noteCategory);
      }        
      setState(() {
        _notes = noteStateService.notes;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = 'Error loading notes: $e';
        _isLoading = false;
      });
    }
  }

  Future<void> _filterNotes() async {
try {
      final noteStateService = Provider.of<NoteStateService>(context, listen: false);
      if(isNullOrEmpty(titleController.text)){
        await noteStateService.getAllItems();
      }else{
        await noteStateService.filterItems((note) => note.title.toLowerCase().contains(
        titleController.text.toLowerCase()));   
      }
        
      setState(() {
        _notes = noteStateService.notes;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = 'Error loading notes: $e';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
     if (_isLoading) {
      return const SplashScreen();
    }

    if (_error != null) {
      return const SplashErrorScreen();
    }

    return HomeScreenBody(notes: _notes, handleChange: _findByNoteCategory  , titleController: titleController);
  }
}
