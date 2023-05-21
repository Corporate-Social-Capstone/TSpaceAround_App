import 'package:flutter/material.dart';

class AILayoutBuilder extends StatelessWidget {
  final int textStyle;
  final String Text1;
  final String Text2;
  final String Text3;

  const AILayoutBuilder({
    required this.textStyle,
    required this.Text1,
    required this.Text2,
    required this.Text3,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ts = TextStyle(
        fontSize: 16, fontWeight: FontWeight.w700, color: Colors.black);

    return LayoutBuilder(
      builder: (context, constraints) {
        return Row(
          children: [
            Flexible(
              fit: FlexFit.tight,
              child: Stack(
                alignment: Alignment.centerRight,
                children: [
                  LinearProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    backgroundColor: Colors.white,
                  ),
                  Text(
                    Text1,
                    style: ts.copyWith(color: Colors.grey[400], fontSize: 32),
                    overflow: TextOverflow.fade,
                    softWrap: false,
                    maxLines: 1,
                   // textAlign: TextAlign.right, // 추가된 부분
                  ),
                ],
              ),
            ),
            Text(
              Text2,

              style: textStyle == 1
                  ? ts.copyWith(
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.pink,
                  decorationThickness: 3,

                  color: Colors.black, fontSize: 32)
                  : textStyle == 2
                      ? ts.copyWith(color: Colors.grey[800], fontSize: 32,
                decoration: TextDecoration.underline,
                decorationColor: Colors.blue,
                decorationThickness: 3,)
                      : ts.copyWith(color: Colors.grey[600], fontSize: 32,
                decoration: TextDecoration.underline,
                decorationColor: Colors.purple,
                decorationThickness: 3,),
              overflow: TextOverflow.clip,
            ),
            Flexible(
              fit: FlexFit.tight,
              child: Text(
                Text3,
                style: ts.copyWith(color: Colors.grey[400], fontSize: 32),
                overflow: TextOverflow.fade,
                softWrap: false,
                maxLines: 1,

              ),
            ),
          ],
        );
      },
    );
  }
}
