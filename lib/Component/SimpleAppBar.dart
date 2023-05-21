import 'package:flutter/material.dart';
import 'package:t_space_around/Component/IconButton.dart';
import 'package:t_space_around/Component/color.dart';

class SimpleAppBar extends StatelessWidget {
  final String titleText;
  final int iconBtnCase;

  const SimpleAppBar({
    required this.iconBtnCase,
    required this.titleText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ts = TextStyle(
        fontSize: 16, fontWeight: FontWeight.w700, color: Colors.black);
    return AppBar(
      elevation: 1,
      iconTheme: IconThemeData(color: Colors.black),
      backgroundColor: Colors.white,
      centerTitle: false,
      title: Text(titleText,style: ts.copyWith(fontSize: 20),),
      actions: [CustomIconButton(iconCase: iconBtnCase, onPressed: onPressed)],
    );
  }

  void onPressed() {}
}
