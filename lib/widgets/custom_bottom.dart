import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomBottom extends StatelessWidget {
  
  CustomBottom({super.key, required this.child, this.onTap});
  final Widget child;
  Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          height: 60,
          decoration: BoxDecoration(
              color: const Color(0xFF105587),
              borderRadius: BorderRadius.circular(50)),
          child: child),
    );
  }
}
