import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
   final String text;
   final Color color;
   final double size;
   const AppText({super.key, required this.text, this.color=Colors.white,  this.size =40});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontWeight: FontWeight.w500,
        color: color,
        fontFamily: 'PlayfairDisplay',
      ),
    );
  }
}