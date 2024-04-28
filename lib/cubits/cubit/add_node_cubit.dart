import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes2app/constants.dart';
import 'package:notes2app/models/note_model.dart';

part 'add_node_state.dart';

class AddNodeCubit extends Cubit<AddNodeState> {
  AddNodeCubit() : super(AddNodeInitial());

  Color? color = const Color(0xffFFBE0B);

  addNote(NoteModel note) async {
    note.color = color!.value;
    emit(AddNodeLoding());
    try {
      var notesBox = Hive.box<NoteModel>(kNotesOBx);

      await notesBox.add(note);
      emit(AddNodeSuccess());
    } catch (e) {
      emit(AddNodeFiler(e.toString()));
    }
  }
}
