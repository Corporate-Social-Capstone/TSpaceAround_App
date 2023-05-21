import 'package:flutter/material.dart';

class AroundRecoListView extends StatelessWidget {
  final String cafeImage;
  final String cafeName;
  final int cafeDis;
  const AroundRecoListView({
    required this.cafeDis,
    required this.cafeName,
    required this.cafeImage,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ts = TextStyle(
        fontSize: 16, fontWeight: FontWeight.w700, color: Colors.black);
    return Column(
      children: [
        SizedBox(height: 16),
        Row(
          children: [
            ClipOval(
              child: Image(
                image: AssetImage(
                  'asset/img/'+cafeImage,
                ),
                width: 54,
                height: 54,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cafeName,
                    style: ts,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        cafeDis.toString()+'M',
                        style: ts.copyWith(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Spacer(),
            Icon(
              Icons.chevron_right,
              color: Colors.black,
            )
          ],
        ),
      ],
    );
  }
}
