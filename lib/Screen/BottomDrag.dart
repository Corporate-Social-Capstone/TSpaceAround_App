import 'package:flutter/material.dart';
import 'package:t_space_around/Component/AILayoutBuilder.dart';
import 'package:t_space_around/Component/StackCircleIcon.dart';
import 'package:t_space_around/Component/color.dart';
import 'package:t_space_around/Screen/MyLifeStyleDetail.dart';
import 'package:dio/dio.dart';
import 'package:t_space_around/Screen/MySubscribe.dart';
import '../Component/IconButtonWithSize.dart';
import '../url_name/data.dart';
import 'MyApp.dart';

class BottomDrag extends StatefulWidget {
  final String loginId;

  BottomDrag({Key? key, required this.loginId}) : super(key: key);

  @override
  State<BottomDrag> createState() => _BottomDragState();
}

class _BottomDragState extends State<BottomDrag> {
  final ts =
      TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.black);

  Future getBottomDragData() async {
    final dio = Dio();
    final resp = await dio.get("");
  }

  Future getAiRecomendData() async {
    final dio = Dio();
    final resp = await dio
        .get("http://211.62.179.135:4001/user/category?name=" + widget.loginId);
    print(resp.data);
    return resp.data;
  }

  @override
  Widget build(BuildContext context) {
    final ContainerBorderDecoration = BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 7,
            offset: Offset(0, 0)),
      ],
    );
    return SafeArea(child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return DraggableScrollableSheet(
          initialChildSize: 0.1,
          minChildSize: 0.1,
          maxChildSize: 1.0,
          builder: (BuildContext context, ScrollController scrollController) {
            return CustomScrollView(controller: scrollController, slivers: <
                Widget>[
              SliverAppBar(
                  backgroundColor: LightPurpleS,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(10.0),
                    ),
                  ),
                  pinned: true,
                  // 상단에 고정
                  floating: false,
                  // 스크롤에 따라 숨기거나 표시하지 않음
                  flexibleSpace: Column(
                      //mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(
                            alignment: Alignment.topLeft,
                            child: Center(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(Icons.minimize,
                                  size: 40, color: Colors.grey[400]),
                            )))
                      ])),
              SliverList(
                  delegate: SliverChildListDelegate([
                Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          LightPurpleS,
                          LightPurpleE,
                          LightPurpleE,
                        ],
                      ),
                    ),
                    child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(height: 2),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(children: [
                                      Container(
                                          width: 72,
                                          height: 32,
                                          decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius:
                                                BorderRadius.circular(16),
                                          ),
                                          child: Center(
                                              child: Text(
                                            "할인형",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ))),
                                      SizedBox(width: 8),
                                      Text(widget.loginId + "님",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 24,
                                              fontWeight: FontWeight.w700)),
                                      SizedBox(width: 8),
                                      Text("VIP",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700)),
                                    ]),
                                    SizedBox(width: 72),
                                    Text("010-65**-71**",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w700))
                                  ]),
                              SizedBox(
                                height: 16,
                              ),
                              Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 144,
                                  decoration: ContainerBorderDecoration,
                                  child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                                child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                  Text("연간 누적 할인",
                                                      style: ts.copyWith(
                                                          fontSize: 14)),
                                                  SizedBox(height: 8),
                                                  Text("1500원 >",
                                                      style: ts.copyWith(
                                                          color: Colors.blue,
                                                          fontSize: 18))
                                                ])),
                                            Container(
                                                height: 68,
                                                width: 2,
                                                color: Colors.grey),
                                            Expanded(
                                                child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                  Text("사용가능 T플러스포인트",
                                                      style: ts.copyWith(
                                                          fontSize: 14)),
                                                  const SizedBox(
                                                    height: 8,
                                                  ),
                                                  Text(
                                                    "0원 >",
                                                    style: ts.copyWith(
                                                        color: Colors.red,
                                                        fontSize: 18),
                                                  )
                                                ]))
                                          ]))),
                              SizedBox(height: 16),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("혜택부터 결제까지 한번에",
                                        style: ts, textAlign: TextAlign.start),
                                    const SizedBox(height: 1)
                                  ]),
                              const SizedBox(height: 16),
                              Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 80,
                                  decoration: ContainerBorderDecoration,
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                            width: 170,
                                            child: Center(
                                                child: Stack(children: [
                                              Positioned(
                                                right: 20,
                                                top: 20,
                                                child: CircleShapeContainer(
                                                    imageKind:
                                                        "DKKN_LOGO.jpeg"),
                                              ),
                                              Positioned(
                                                right: 50,
                                                // adjust this value as needed
                                                top: 20,
                                                child: CircleShapeContainer(
                                                    imageKind:
                                                        "TOUSLESJOURS_LOGO.jpeg"),
                                              ),
                                              Positioned(
                                                right: 80,
                                                // adjust this value as needed
                                                top: 20,
                                                child: CircleShapeContainer(
                                                    imageKind:
                                                        "7ELEVEN_LOGO.png"),
                                              ),
                                              Positioned(
                                                right: 110,
                                                // adjust this value as needed
                                                top: 20,
                                                child: CircleShapeContainer(
                                                    imageKind: "PB1_LOGO.jpeg"),
                                              )
                                            ]))),
                                        Row(
                                          children: [
                                            Text("+4", style: ts),
                                            Icon(Icons.expand_more,
                                                size: 40,
                                                color: Colors.grey[400]),
                                          ],
                                        ),
                                        Spacer(),
                                        Row(children: [
                                          //이미지 대체
                                          const SizedBox(width: 8),
                                          Image(
                                            image: AssetImage(
                                                'asset/img/toggle_test_img.png'),
                                            width: 66.6,
                                            height: 23.4,
                                          ),
                                          const SizedBox(width: 8)
                                        ])
                                      ])),
                              const SizedBox(height: 16),
                              GestureDetector(
                                onTap: mySubscribeIconBtn,
                                child: Container(
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("나의 구독", style: ts),
                                        Icon(Icons.trending_flat,
                                            size: 40, color: Colors.black),
                                      ]),
                                ),
                              ),
                              set == 1
                                  ? Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 80,
                                      decoration: ContainerBorderDecoration,
                                      child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    ClipOval(
                                                      child: Image(
                                                          image: AssetImage(
                                                            'asset/img/subScribe.jpeg',
                                                          ),
                                                          width: 44,
                                                          // 이미지의 너비를 설정합니다.
                                                          height: 44,
                                                          // 이미지의 높이를 설정합니다.
                                                          fit: BoxFit
                                                              .cover // 이미지가 부모 위젯의 크기에 맞게 조절되도록 합니다.)
                                                          ),
                                                    ),
                                                    Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal:
                                                                    8.0),
                                                        child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                        "피플스카페 동국대점",
                                                                        style:
                                                                            ts),
                                                                    SizedBox(
                                                                        height:
                                                                            4),
                                                                    Row(
                                                                      children: [
                                                                        Text(
                                                                          menu,
                                                                          style: ts.copyWith(
                                                                              fontSize: 12,
                                                                              fontWeight: FontWeight.w500,
                                                                              color: PrimaryColor),
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              16,
                                                                        ),
                                                                        Text(
                                                                          leftCount,
                                                                          style: ts.copyWith(
                                                                              fontSize: 12,
                                                                              fontWeight: FontWeight.w500),
                                                                        ),
                                                                      ],
                                                                    )
                                                                  ])
                                                            ])),
                                                  ],
                                                ),
                                                Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Image(
                                                          image: AssetImage(
                                                            'asset/img/bacord.png',
                                                          ),
                                                          width: 128.8,
                                                          height: 29.6),
                                                      Text("A1234567890A",
                                                          style: ts.copyWith(
                                                              fontSize: 8,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500))
                                                    ])
                                              ])))
                                  : Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 80,
                                      decoration: ContainerBorderDecoration,
                                      child: Center(
                                        child: Text("아직은 구독한 상품이 없습니다.",style: ts,),
                                      )),
                              Padding(
                                  padding: const EdgeInsets.only(
                                      top: 32, bottom: 16),
                                  child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 330,
                                      decoration: ContainerBorderDecoration,
                                      child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20.0),
                                          child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Image(
                                                  image: AssetImage(
                                                      'asset/img/bacord.png'),
                                                ),
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    SizedBox(height: 24),
                                                    Icon(
                                                      Icons.refresh,
                                                      size: 18,
                                                    ),
                                                    SizedBox(width: 8),
                                                    Text(
                                                      "17:59",
                                                      style: ts.copyWith(
                                                          color: Colors.purple,
                                                          fontSize: 12),
                                                    ),
                                                    SizedBox(width: 16),
                                                    Text(
                                                      "2140 5693 6716 2057",
                                                      style: ts.copyWith(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors.grey),
                                                    ),
                                                    SizedBox(width: 4)
                                                  ],
                                                ),
                                                SizedBox(height: 48),
                                                SizedBox(
                                                    width: 300,
                                                    child: ElevatedButton(
                                                        style: ElevatedButton.styleFrom(
                                                            primary: Colors
                                                                .purpleAccent,
                                                            shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            16.0))),
                                                        onPressed: () {},
                                                        //               getAiRecomendData,
                                                        child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceAround,
                                                            children: [
                                                              Text(
                                                                  "🎖 T멤버십 결제바코드 이용언내",
                                                                  style: ts.copyWith(
                                                                      fontSize:
                                                                          16,
                                                                      color: Colors
                                                                          .white)),
                                                              Icon(
                                                                Icons
                                                                    .arrow_forward,
                                                                color: Colors
                                                                    .white,
                                                                size: 24,
                                                              )
                                                            ])))
                                              ])))),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  IconButtonWithSize(
                                      onPressed: onPressed,
                                      iconCase: 1,
                                      textString: "이용내역"),
                                  IconButtonWithSize(
                                      onPressed: onPressed,
                                      iconCase: 5,
                                      textString: "혜택 쿠폰함"),
                                  IconButtonWithSize(
                                      onPressed: onPressed,
                                      iconCase: 4,
                                      textString: "관심브랜드"),
                                  IconButtonWithSize(
                                      onPressed: mySubscribeIconBtn,
                                      iconCase: 6,
                                      textString: "나의구독"),
                                ],
                              ),
                              const SizedBox(height: 32),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text("나의 라이프 스타일", style: ts),
                                      SizedBox(width: 8),
                                      Text("22.12.01 ~ 23.02.28",
                                          style: ts.copyWith(
                                              fontSize: 12,
                                              color: Colors.grey)),
                                    ],
                                  ),
                                  GestureDetector(
                                    onTap: myLifeStyleIconBtn,
                                    child: Icon(Icons.chevron_right,
                                        color: Colors.black, size: 24),
                                  ),
                                ],
                              ),
                              SizedBox(height: 16),
                              FutureBuilder(
                                  future: getAiRecomendData(),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return CircularProgressIndicator();
                                    }
                                    if (snapshot.hasError) {
                                      return Text("Error: ${snapshot.error}");
                                    }
                                    var categories = snapshot.data['category'];

                                    print(categories);
                                    //print(snapshot.data);
                                    return Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 250,
                                        decoration: ContainerBorderDecoration,
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 32.0,
                                                    left: 32.0,
                                                    bottom: 16),
                                                child:
                                                    Text("AI분석 키워드", style: ts),
                                              ),
                                              AILayoutBuilder(
                                                  Text1: " #" +
                                                      categories[3].toString() +
                                                      " ",
                                                  Text2: " #" +
                                                      categories[0].toString() +
                                                      " ",
                                                  Text3: "#" +
                                                      categories[6].toString() +
                                                      " ",
                                                  textStyle: 1),
                                              const SizedBox(height: 12),
                                              AILayoutBuilder(
                                                  Text1: " #" +
                                                      categories[4].toString() +
                                                      " ",
                                                  Text2: " #" +
                                                      categories[1].toString() +
                                                      " ",
                                                  Text3: " #" +
                                                      categories[7].toString() +
                                                      " ",
                                                  textStyle: 2),
                                              const SizedBox(height: 12),
                                              AILayoutBuilder(
                                                  Text1: " #" +
                                                      categories[5].toString() +
                                                      " ",
                                                  Text2: " #" +
                                                      categories[2].toString() +
                                                      " ",
                                                  Text3: " #" +
                                                      categories[8].toString() +
                                                      " ",
                                                  textStyle: 3),
                                            ]));
                                  })
                            ])))
              ]))
            ]);
          });
    }));
  }

  void onPressed() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return MyApp(loginId: widget.loginId);
    }));
  }

  void myLifeStyleIconBtn() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return MyLifeStyle(
        loginId: widget.loginId,
      );
    }));
  }

  void mySubscribeIconBtn() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return MySubScribe(
        loginId: widget.loginId,
      );
    }));
  }
}
