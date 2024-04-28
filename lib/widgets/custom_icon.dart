import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key, required this.icon, this.onPresssed});
  final IconData icon;
  final void Function()? onPresssed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      width: 46,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white.withOpacity(0.05),
      ),
      child: IconButton(
        onPressed: onPresssed,
        icon: Icon(
          icon,
          size: 28,
        ),
      ),
    );
  }
}
