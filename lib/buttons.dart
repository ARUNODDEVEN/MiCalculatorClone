import 'package:flutter/material.dart';

class Mybutton extends StatelessWidget {
  Mybutton(
      {super.key,
      required this.Color,
      required this.TextColor,
      required this.ButtonText,
      required this.ontap});

  final Color;
  final TextColor;
  final String ButtonText;
  final ontap;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: GestureDetector(
        onTap:ontap,
        child: Container(
          decoration: BoxDecoration(
              color: Color, borderRadius: BorderRadius.circular(15)),
          child: Center(
            child: Text(
              ButtonText,
              style: TextStyle(
                  color: TextColor, fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
