import 'package:flutter/material.dart';
import 'package:t_space_around/Component/IconButton.dart';
import 'package:t_space_around/Component/color.dart';

import '../Screen/MyApp.dart';

class SimpleAppBar extends StatefulWidget {
  final String titleText;
  final int iconBtnCase;

  const SimpleAppBar({
    required this.iconBtnCase,
    required this.titleText,
    Key? key,
  }) : super(key: key);

  @override
  State<SimpleAppBar> createState() => _SimpleAppBarState();
}

class _SimpleAppBarState extends State<SimpleAppBar> {
  @override
  Widget build(BuildContext context) {
    final ts = TextStyle(
        fontSize: 16, fontWeight: FontWeight.w700, color: Colors.black);
    return AppBar(
      elevation: 1,
      iconTheme: IconThemeData(color: Colors.black),
      backgroundColor: Colors.white,
      centerTitle: false,
      title: Text(widget.titleText,style: ts.copyWith(fontSize: 20),),
      actions: [CustomIconButton(iconCase: widget.iconBtnCase, onPressed: onPressed)],
    );
  }

  void onPressed() {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute( //페이지 스택 제거
        builder: (BuildContext context) =>
            MyApp()), (route) => false);
  }
}
