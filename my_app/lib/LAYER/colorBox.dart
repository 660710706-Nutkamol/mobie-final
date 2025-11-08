import 'package:flutter/material.dart';

class ColorBox extends StatelessWidget {
  
  const ColorBox({super.key, required this.colors});
  final Color colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: colors,
    );
  }
}