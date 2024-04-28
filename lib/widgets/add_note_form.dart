import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes2app/cubits/cubit/add_node_cubit.dart';
import 'package:notes2app/models/note_model.dart';
import 'package:notes2app/widgets/colors_list_view.dart';
import 'package:notes2app/widgets/custom_botton.dart';
import 'package:notes2app/widgets/custom_text_fild.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formeKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? titel, subTitel;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formeKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          CustomTextFiled(
            onSaved: (value) {
              titel = value;
            },
            hint: 'Titel',
          ),
          const SizedBox(
            height: 5,
          ),
          CustomTextFiled(
            onSaved: (value) {
              subTitel = value;
            },
            hint: 'Content',
            maxLines: 5,
          ),
          const SizedBox(
            height: 32,
          ),
          const ColorListView(),
          const SizedBox(
            height: 16,
          ),
          BlocBuilder<AddNodeCubit, AddNodeState>(
            builder: (context, state) {
              return CustomBottton(
                isLoding: state is AddNodeLoding ? true : false,
                onTap: () {
                  if (formeKey.currentState!.validate()) {
                    formeKey.currentState!.save();
                    var currentDate = DateTime.now();
                    var formattedCurrentDate =
                        DateFormat.yMd().format(currentDate);
                    var noteModel = NoteModel(
                        titel: titel!,
                        subTitel: subTitel!,
                        date: formattedCurrentDate,
                        color: Colors.blue.value);
                    BlocProvider.of<AddNodeCubit>(context).addNote(noteModel);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                  }
                },
              );
            },
          ),
          const SizedBox(
            height: 16,
          )
        ],
      ),
    );
  }
}
