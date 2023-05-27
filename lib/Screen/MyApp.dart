import 'package:flutter/material.dart';
import 'package:t_space_around/Component/IconButton.dart';
import 'package:t_space_around/Component/color.dart';
import 'package:t_space_around/Screen/BottomDrag.dart';
import 'package:t_space_around/Screen/MySubscribeScreen.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ts =
      TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
                children: [
                  AppBar(
                    title: Text("T membership"),
                    backgroundColor: Colors.indigoAccent,
                    centerTitle: false,
                    actions: [
                      CustomIconButton(onPressed: onPressed, iconCase: 1),
                      CustomIconButton(onPressed: onPressed, iconCase: 2),
                      CustomIconButton(onPressed: onPressed, iconCase: 4),
                    ],
                  ),
                  Column(
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            height: 120,
                            width: MediaQuery.of(context).size.width,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: Colors.indigoAccent,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 0, 16.0, 0),
                            child: Row(
                              children: [
                                Text(
                                  "T멤버십",
                                  style: ts,
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Text("T우주", style: ts),
                                SizedBox(
                                  width: 16,
                                ),
                                Text("T미션", style: ts),
                              ],
                            ),
                          ),
                          Column(children: [
                            SizedBox(
                              height: 64,
                            ),
                            Center(
                              child:
                                  Image(image: AssetImage('asset/img/TMain.png')),
                            )
                          ]),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: allSubcribeOnTap,
                              child: Column(
                                children: [
                                  ClipOval(
                                    child: Image(
                                      image: AssetImage(
                                        'asset/img/allSubList.png',
                                      ),
                                      width: 78,
                                      height: 78,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Text(
                                    '모든 상품',
                                    style: ts.copyWith(
                                        color: Colors.black, fontSize: 12),
                                  )
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                ClipOval(
                                  child: Image(
                                    image: AssetImage(
                                      'asset/img/btnImage.jpeg',
                                    ),
                                    width: 72, // 이미지의 너비를 설정합니다.
                                    height: 72, // 이미지의 높이를 설정합니다.
                                    fit: BoxFit
                                        .cover, // 이미지가 부모 위젯의 크기에 맞게 조절되도록 합니다.)
                                  ),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  "HOT",
                                  style: ts.copyWith(
                                      color: Colors.black, fontSize: 12),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    print("test1");
                                  },
                                  child: ClipOval(
                                    child: Image(
                                      image: AssetImage(
                                        'asset/img/icon1.png',
                                      ),
                                      width: 72, // 이미지의 너비를 설정합니다.
                                      height: 72, // 이미지의 높이를 설정합니다.
                                      fit: BoxFit
                                          .cover, // 이미지가 부모 위젯의 크기에 맞게 조절되도록 합니다.)
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Text("Around",
                                    style: ts.copyWith(
                                        color: Colors.black, fontSize: 12))
                              ],
                            ),
                            GestureDetector(
                              onTap: mySubScribe,
                              child: Column(
                                children: [
                                  ClipOval(
                                    child: Image(
                                      image: AssetImage(
                                        'asset/img/btnImage.jpeg',
                                      ),
                                      width: 72, // 이미지의 너비를 설정합니다.
                                      height: 72, // 이미지의 높이를 설정합니다.
                                      fit: BoxFit
                                          .cover, // 이미지가 부모 위젯의 크기에 맞게 조절되도록 합니다.)
                                    ),
                                  ),
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Text(
                                    "나의 구독",
                                    style: ts.copyWith(
                                        color: Colors.black, fontSize: 12),
                                  )
                                ],
                              ),
                            ),

                            //Image(image: AssetImage('asset/img/TMain.png')),
                          ],
                        ),
                      ),
                      Image(
                        image: AssetImage('asset/img/TMain2.png'),
                        width: MediaQuery.of(context).size.width,
                      ),
                    ],
                  ),
                  //BottomDrag()
                ],
              ),
          ),

         BottomDrag()
        ],
      ),
    );
  }

  void mySubScribe() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return MySubScribe(
        ts: ts,
      );
    }));
  }

  void onPressed() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return MyApp();
    }));
  }
  void allSubcribeOnTap() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return MySubScribe(ts: ts);
    }));
  }
}
