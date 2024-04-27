import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/constant.dart';
import 'package:note_app/cubits/notes/notes_states.dart';
import 'package:note_app/models/note_model.dart';

class NoteCubit extends Cubit<NoteStates> {
  NoteCubit() : super(NoteInitialState());
  List<NoteModel>? notesModel;
  readAllNotes() async {
    var noteBox = Hive.box<NoteModel>(kNoteBox);
    notesModel = noteBox.values.toList();
    emit(NoteSuccessState());
  }
}
