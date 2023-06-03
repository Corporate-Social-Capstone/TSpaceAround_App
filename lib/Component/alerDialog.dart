import 'package:flutter/material.dart';
import 'package:t_space_around/Component/color.dart';

import '../Screen/MyApp.dart';


Future DialogShow(context, String contentText, String loginId) async {
  final ts = TextStyle(color: PrimaryColor);
  return await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        title: Text('알림', style: ts.copyWith(color: Colors.black)),
        content: Text(contentText, style: ts.copyWith(color: Colors.black)),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    //페이지 스택 제거
                      builder: (BuildContext context) =>
                          MyApp(loginId: loginId)),
                      (route) => false);
            },
            child: Text('확인', style: ts),
          ),
        ],
      );
    },
  );
}