// ignore_for_file: unused_local_variable

import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes2app/constants.dart';
import 'package:notes2app/models/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());
  List<NoteModel>? notes;

  fetchAllNotes() async {
    var notesBox = Hive.box<NoteModel>(kNotesOBx);
    notes = notesBox.values.toList();
    emit(NotesSuccess());
  }
}
