import 'package:flutter/material.dart';
import 'package:notes2app/constants.dart';
import 'package:notes2app/models/note_model.dart';
import 'package:notes2app/widgets/colors_list_view.dart';

class EditeNoteColorsList extends StatefulWidget {
  const EditeNoteColorsList({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditeNoteColorsList> createState() => _EditeNoteColorsListState();
}

class _EditeNoteColorsListState extends State<EditeNoteColorsList> {
  late int currentIndex;
  @override
  void initState() {
    currentIndex = KColors.indexOf(Color(widget.note.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38 * 2,
      child: ListView.builder(
          itemCount: KColors.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: GestureDetector(
                onTap: () {
                  currentIndex = index;

                  widget.note.color = KColors[index].value;

                  setState(() {});
                },
                child: ColorItem(
                  color: KColors[index],
                  isActive: currentIndex == index,
                ),
              ),
            );
          }),
    );
  }
}
