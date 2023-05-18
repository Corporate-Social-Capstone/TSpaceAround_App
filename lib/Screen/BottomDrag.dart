import 'package:flutter/material.dart';
import 'package:t_space_around/Component/StackCircleIcon.dart';
import 'dart:math';
class BottomDrag extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ts = TextStyle(
        fontSize: 16, fontWeight: FontWeight.w700, color: Colors.black);

    return SafeArea(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return DraggableScrollableSheet(
            initialChildSize: 0.1,
            minChildSize: 0.1,
            maxChildSize: 1.0,
            builder: (BuildContext context, ScrollController scrollController) {
              return CustomScrollView(
                controller: scrollController,
                slivers: <Widget>[
                  SliverAppBar(
                    backgroundColor: Colors.deepPurpleAccent,

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
                              child: Icon(
                                Icons.minimize,
                                size: 40,
                                color: Colors.grey[400],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        Container(
                          decoration: BoxDecoration(color: Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 16,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
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
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            )),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Text("김건휘님",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 24,
                                                fontWeight: FontWeight.w700)),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Text("VIP",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w700)),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 72,
                                    ),
                                    Text(
                                      "010-65**-71**",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w700),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 7,
                                        offset: Offset(0, 0),
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "연간 누적 할인",
                                                style:
                                                    ts.copyWith(fontSize: 12),
                                              ),
                                              SizedBox(
                                                height: 8,
                                              ),
                                              Text(
                                                "0원 >",
                                                style: ts.copyWith(
                                                    color: Colors.blue),
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          height: 60,
                                          width: 2,
                                          color: Colors.grey,
                                        ),
                                        Expanded(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "사용가능 T플러스포인트",
                                                style:
                                                    ts.copyWith(fontSize: 12),
                                              ),
                                              SizedBox(
                                                height: 8,
                                              ),
                                              Text(
                                                "0원 >",
                                                style: ts.copyWith(
                                                    color: Colors.red),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(height: 16),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "혜택부터 결제까지 한번에",
                                      style: ts,
                                      textAlign: TextAlign.start,
                                    ),
                                    SizedBox(
                                      height: 1,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 7,
                                        offset: Offset(0, 0),
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 170,
                                        child: Center(
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                right: 20,
                                                top: 20,
                                                child: CircleShapeContainer(
                                                  imageKind: "DKKN_LOGO.jpeg",
                                                ),
                                              ),
                                              Positioned(
                                                right:
                                                    50, // adjust this value as needed
                                                top: 20,
                                                child: CircleShapeContainer(
                                                  imageKind:
                                                      "TOUSLESJOURS_LOGO.jpeg",
                                                ),
                                              ),
                                              Positioned(
                                                right:
                                                    80, // adjust this value as needed
                                                top: 20,
                                                child: CircleShapeContainer(
                                                  imageKind: "7ELEVEN_LOGO.png",
                                                ),
                                              ),
                                              Positioned(
                                                right:
                                                    110, // adjust this value as needed
                                                top: 20,
                                                child: CircleShapeContainer(
                                                  imageKind: "PB1_LOGO.jpeg",
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "+4",
                                            style: ts,
                                          ),
                                          Icon(
                                            Icons.expand_more,
                                            size: 40,
                                            color: Colors.grey[400],
                                          ),
                                        ],
                                      ),
                                      Spacer(),
                                      Row(
                                        children: [
                                          
                                          //이미지 대체
                                          
                                          SizedBox(width: 8),
                                          Image(
                                            image: AssetImage(
                                                'asset/img/toggle_test_img.png'),
                                            width: 66.6,
                                            height: 23.4,
                                          ),
                                          SizedBox(width: 16,)
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
