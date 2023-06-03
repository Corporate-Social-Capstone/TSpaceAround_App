import 'package:flutter/material.dart';
import 'package:t_space_around/Component/SimpleAppBar.dart';
import 'package:t_space_around/Component/alerDialog.dart';
import 'package:t_space_around/Component/color.dart';

import '../url_name/data.dart';
import 'MyApp.dart';

class MySubScribe extends StatefulWidget {
  final String loginId;

  const MySubScribe({required this.loginId, Key? key}) : super(key: key);

  @override
  State<MySubScribe> createState() => _MySubScribeState();
}

class _MySubScribeState extends State<MySubScribe> {
  int buttonState = 0;
  int buttonState2 = 0;

  @override
  Widget build(BuildContext context) {
    final TextStyle ts = TextStyle(
        fontSize: 20, color: Colors.black, fontWeight: FontWeight.w600);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SimpleAppBar(
                loginId: widget.loginId,
                iconBtnCase: 3,
                titleText: "피플스카페 충무로점"),
            Container(
              height: MediaQuery.of(context).size.height - 56.0000,
              child: Stack(
                children: [
                  Image.asset('asset/img/subScribe.jpeg'),
                  Positioned(
                    top: 250,
                    // top: 250.0, //이미지 아래에서 시작하는 위치를 지정
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      //화면 높이를 조정
                      height: 600,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 7,
                              offset: Offset(0, 0)),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 16),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "구독 상품 유형",
                                style: ts,
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            ConstrainedBox(
                              constraints:
                                  BoxConstraints(minHeight: 170, minWidth: 750),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    SizedBox(width: 8),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          buttonState = 1;
                                        });
                                      },
                                      child: ContainerBox(
                                          count: "25회",
                                          ts: ts,
                                          typeSub: "음료 구독",
                                          id: 1,
                                          btnState: buttonState,
                                          imgName: 'asset/img/sub1Icon.png'),
                                    ),
                                    SizedBox(width: 16),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          buttonState = 2;
                                        });
                                      },
                                      child: ContainerBox(
                                          count: "15회",
                                          ts: ts,
                                          typeSub: "샌드위치 구독",
                                          id: 2,
                                          btnState: buttonState,
                                          imgName: 'asset/img/sub2Icon.png'),
                                    ),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          buttonState = 3;
                                        });
                                      },
                                      child: ContainerBox(
                                        count: "25회",
                                        ts: ts,
                                        typeSub: "원두 구독",
                                        id: 3,
                                        btnState: buttonState,
                                        imgName: 'asset/img/sub3Icon.png',
                                      ),
                                    ),
                                    SizedBox(
                                      width: 8,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "구독 주기",
                                style: ts,
                              ),
                            ),
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    buttonState2 = 1;
                                  });
                                },
                                child: LongButton(
                                  title: "월간",
                                  cost: "월 44,900원",
                                  ts: ts,
                                  id: 1,
                                  btnState: buttonState2,
                                )),
                            const SizedBox(
                              height: 8,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  buttonState2 = 2;
                                });
                              },
                              child: LongButton(
                                title: "주간",
                                cost: "월 440,000원",
                                ts: ts,
                                id: 2,
                                btnState: buttonState2,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 32.0),
                              child: BottonButton(
                                btnState: buttonState,
                                loginId: widget.loginId,
                                ts: ts,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContainerBox extends StatelessWidget {
  final String typeSub;
  final int id;
  final int btnState;
  final String imgName;
  final TextStyle ts;
  final String count;

  const ContainerBox(
      {required this.count,
      required this.ts,
      required this.typeSub,
      required this.id,
      required this.btnState,
      required this.imgName,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      //height: MediaQuery.of(context).size.height / 2,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: btnState == id
            ? Border.all(color: PrimaryColor)
            : Border.all(color: Colors.white),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 7,
              offset: Offset(0, 0)),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            typeSub,
            style: ts.copyWith(fontSize: 16),
          ),
          ClipOval(
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
                border: Border.all(
                  color: Colors.black,
                  width: 1.0,
                ),
              ),
              child: ClipOval(
                child: Image(
                  image: AssetImage(
                    imgName,
                  ),
                  width: 44,
                  height: 44,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Text(count)
        ],
      ),
    );
  }
}

class LongButton extends StatelessWidget {
  final int id;
  final int btnState;
  final String cost;
  final String title;
  final TextStyle ts;

  const LongButton(
      {required this.id,
      required this.btnState,
      required this.title,
      required this.cost,
      required this.ts,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          width: MediaQuery.of(context).size.width,
          //화면 높이를 조정
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: btnState == id
                ? Border.all(color: PrimaryColor)
                : Border.all(color: Colors.white),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: Offset(0, 0)),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 8, 16, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                id == btnState ?
                Text(
                  title,
                  style: ts.copyWith(fontSize: 18, fontWeight: FontWeight.w600, color: PrimaryColor),
                ) : Text(
                  title,
                  style: ts.copyWith(fontSize: 18, fontWeight: FontWeight.w600, color : Colors.grey),
                ),
                id == btnState ?
                Text(
                  cost,
                  style: ts.copyWith(fontSize: 18, fontWeight: FontWeight.w600, color: PrimaryColor),
                ) : Text(
                  cost,
                  style: ts.copyWith(fontSize: 18, fontWeight: FontWeight.w600, color: PrimaryColor),
                ),
              ],
            ),
          )),
    );
  }
}

class BottonButton extends StatelessWidget {
  final int btnState;

  final String loginId;
  final TextStyle ts;

  const BottonButton(
      {required this.btnState,
      required this.loginId,
      required this.ts,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50,
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: PrimaryColor,
            ),
            onPressed: () {
              set = 1;
              if(btnState == 1) {
                menu = "음료 구독";
                leftCount= "잔여 25/25";
              }
              else if(btnState == 2) {
                menu = "샌드위치 구독";
                leftCount= "잔여 15/15";
              }
              else if(btnState == 3) {
                menu = "원두 구독";
                leftCount= "잔여 15/15";
              }
              DialogShow(context,"구독 완료",loginId);

            },
            //               getAiRecomendData,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("가입하기",
                      style: ts.copyWith(fontSize: 16, color: Colors.white)),
                ])));
  }
}
