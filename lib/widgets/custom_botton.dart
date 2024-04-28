import 'package:flutter/material.dart';
import 'package:notes2app/constants.dart';

class CustomBottton extends StatelessWidget {
  const CustomBottton({super.key, this.onTap, this.isLoding = false});
  final void Function()? onTap;
  final bool isLoding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 55,
        decoration: BoxDecoration(
            color: KPrimaryColor, borderRadius: BorderRadius.circular(8)),
        child: Center(
            child: isLoding
                ? const SizedBox(
                    height: 24,
                    width: 24,
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  )
                : const Text(
                    'Add',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  )),
      ),
    );
  }
}
