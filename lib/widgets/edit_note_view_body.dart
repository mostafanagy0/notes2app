import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes2app/cubits/cubit/notes_cubit.dart';
import 'package:notes2app/models/note_model.dart';
import 'package:notes2app/widgets/custom_Appbar.dart';
import 'package:notes2app/widgets/custom_text_fild.dart';
import 'package:notes2app/widgets/edite_note_color_list_view.dart';

class EditNotesViewBody extends StatefulWidget {
  const EditNotesViewBody({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNotesViewBody> createState() => _EditNotesViewBodyState();
}

class _EditNotesViewBodyState extends State<EditNotesViewBody> {
  String? titel, conntent;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          CustomAppbar(
            onPressed: () {
              widget.note.titel = titel ?? widget.note.titel;

              widget.note.subTitel = conntent ?? widget.note.subTitel;
              widget.note.save();
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              Navigator.pop(context);
            },
            titel: 'Edite Note',
            icon: Icons.check,
          ),
          CustomTextFiled(
            onChanged: (value) {
              titel = value;
            },
            hint: widget.note.titel,
          ),
          CustomTextFiled(
            onChanged: (value) {
              conntent = value;
            },
            hint: widget.note.subTitel,
            maxLines: 5,
          ),
          const SizedBox(
            height: 16,
          ),
          EditeNoteColorsList(
            note: widget.note,
          )
        ],
      ),
    );
  }
}
