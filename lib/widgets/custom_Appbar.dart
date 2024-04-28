import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:notes2app/widgets/custom_icon.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar(
      {super.key, required this.titel, required this.icon, this.onPressed});
  final String titel;
  final IconData icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          titel,
          style: const TextStyle(fontSize: 28),
        ),
        const Spacer(),
        CustomIcon(
          onPresssed: onPressed,
          icon: icon,
        )
      ],
    );
  }
}
