import 'package:flutter/material.dart';
import 'package:t_space_around/Screen/AllSubScribe.dart';

class AroundRecoListView extends StatelessWidget {
  final String loginId;
  // final String storeName1;
  // final String storeName2;

  final dynamic storeName;
  final int cafeDis;
  const AroundRecoListView({
    // required this.storeName2,
    // required this.storeName1,
    required this.loginId,
    required this.cafeDis,
    required this.storeName,

    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String cafeImage1 =   'asset/img/BLUEPOT_LOGO1.png';
        String cafeImage2 =  'asset/img/caffe115.jpeg';
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
                  cafeImage1,
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
                    storeName[0],
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
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return AllSubScribe(storeName: storeName,loginId: loginId, ts: ts);
                }));
              },
              child: Icon(
                Icons.chevron_right,
                color: Colors.black,
              ),
            )
          ],
        ),
        Divider(
          color: Colors.grey,
          height: 30,
          thickness: 0.5,
        ),
        SizedBox(height: 16),
        Row(
          children: [
            ClipOval(
              child: Image(
                image: AssetImage(
                  cafeImage2,
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
                    storeName[1],
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
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return AllSubScribe(storeName: storeName,loginId: loginId, ts: ts);
                }));
              },
              child: Icon(
                Icons.chevron_right,
                color: Colors.black,
              ),
            )
          ],
        ),
      ],
    );
  }
}
