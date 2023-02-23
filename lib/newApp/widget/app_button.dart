import 'package:flutter/material.dart';

import '../../Constant/App Color/constant.dart';

class AppButton extends StatelessWidget {
  final Color color;
  final String? text;
  IconData? icon;
  final Color backgroundColor;
  double size;
  final Color borderColor;
  bool? isIcon;

  AppButton({
    Key? key,
    this.isIcon = false,
    this.text,
    this.icon,
    required this.size,
    required this.color,
    required this.backgroundColor,
    required this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
            border: Border.all(color: borderColor, width: 1.0),
            borderRadius: BorderRadius.circular(15),
            color: backgroundColor),
        child: isIcon == false
            ? Center(
                child: Text(
                text.toString(),
                style: TextStyle(color: Colors.black),
              ))
            : Center(child: Icon(icon)));
  }
}
