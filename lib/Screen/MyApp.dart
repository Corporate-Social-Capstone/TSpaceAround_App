import 'package:flutter/material.dart';
import 'package:t_space_around/Component/IconButton.dart';
import 'package:t_space_around/Component/color.dart';
import 'package:t_space_around/Screen/BottomDrag.dart';
import 'package:t_space_around/Screen/AllSubScribe.dart';
import 'package:t_space_around/Screen/MySubscribe.dart';
import 'package:simple_shadow/simple_shadow.dart';

class MyApp extends StatefulWidget {
  final String loginId;

  const MyApp({required this.loginId, Key? key}) : super(key: key);

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
                  backgroundColor: PrimaryColor,
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
                              color: PrimaryColor,
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
                        Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 64,
                              ),
                              Container(
                                child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0),
                                    child: SimpleShadow(
                                      child: Image.asset('asset/img/mainimage.png'),
                                      opacity: 0.8,
                                      // Default: 0.5
                                      color: Colors.black87,
                                      // Default: Black
                                      offset: Offset(0, 5),
                                      // Default: Offset(2, 2)
                                      sigma: 8, // Default: 2
                                    )
                                    /*Image(
                                      image: AssetImage('asset/img/image.png')),*/
                                    ),
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
                            onTap: mySubScribe,
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
                                    'asset/img/HotIcon.png',
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
                                      'asset/img/AroundIcon.png',
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
                                      'asset/img/MySubIcon.png',
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
          BottomDrag(
            loginId: widget.loginId,
          )
        ],
      ),
    );
  }

  void mySubScribe() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return MySubScribe(loginId: widget.loginId,);
    }));
  }

  void onPressed() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return MyApp(loginId: widget.loginId);
    }));
  }

}
