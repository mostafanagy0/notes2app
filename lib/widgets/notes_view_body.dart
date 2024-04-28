import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes2app/cubits/cubit/notes_cubit.dart';
import 'package:notes2app/widgets/custom_Appbar.dart';
import 'package:notes2app/widgets/notes_list_view.dart';

class NotesViewBoduy extends StatefulWidget {
  const NotesViewBoduy({super.key});

  @override
  State<NotesViewBoduy> createState() => _NotesViewBoduyState();
}

class _NotesViewBoduyState extends State<NotesViewBoduy> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          CustomAppbar(
            titel: 'Notes',
            icon: Icons.search,
          ),
          Expanded(child: NotesListView())
        ],
      ),
    );
  }
}
