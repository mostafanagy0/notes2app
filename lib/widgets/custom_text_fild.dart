import 'package:flutter/material.dart';
import 'package:notes2app/constants.dart';

class CustomTextFiled extends StatelessWidget {
  const CustomTextFiled(
      {super.key,
      required this.hint,
      this.maxLines = 1,
      this.onSaved,
      this.onChanged});
  final String hint;
  final int maxLines;
  final Function(String?)? onSaved;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 32),
        TextFormField(
          onChanged: onChanged,
          onSaved: onSaved,
          validator: (value) {
            if (value?.isEmpty ?? true) {
              return 'Field is required';
            } else {
              return null;
            }
          },
          cursorColor: KPrimaryColor,
          maxLines: maxLines,
          decoration: InputDecoration(
              hintText: hint,
              border: buildBorder(),
              enabledBorder: buildBorder(),
              focusedBorder: buildBorder(KPrimaryColor)),
        ),
      ],
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: color ?? Colors.white));
  }
}
