import 'package:flutter/material.dart';

class CircleShapeContainer extends StatelessWidget {
  final String imageKind;
  const CircleShapeContainer({
    required this.imageKind,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 7,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: ClipOval(
        child: Image(
          image: AssetImage(
            'asset/img/'+imageKind,
          ),
          width: 44, // 이미지의 너비를 설정합니다.
          height: 44, // 이미지의 높이를 설정합니다.
          fit: BoxFit.cover, // 이미지가 부모 위젯의 크기에 맞게 조절되도록 합니다.)
        ),
      ),
    );
  }
}
