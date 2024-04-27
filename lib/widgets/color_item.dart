import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ColorItem extends StatelessWidget {
  ColorItem({super.key, required this.isActive, required this.color});
  bool isActive;
  Color color;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
            radius: 35,
            backgroundColor: const Color.fromARGB(255, 5, 106, 188),
            child: CircleAvatar(
              radius: 33,
              backgroundColor: color,
            ),
          )
        : CircleAvatar(
            radius: 35,
            backgroundColor: color,
          );
  }
}
