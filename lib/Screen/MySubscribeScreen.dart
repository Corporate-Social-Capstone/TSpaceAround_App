import 'package:flutter/material.dart';

import '../Component/SimpleAppBar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MySubScribe extends StatefulWidget {
  final TextStyle ts;

  const MySubScribe({required this.ts, Key? key}) : super(key: key);

  @override
  State<MySubScribe> createState() => _MySubScribeState();
}

class _MySubScribeState extends State<MySubScribe> {
  var selectedValue = '첫 번째';
  final valueList = ['첫 번째', '두번째'];

  //latitude - 위도 , longitude - 경도
  static final LatLng companyLatLng = LatLng(37.5233273, 126.921252);
  static final CameraPosition initialPosition =
      CameraPosition(zoom: 15, target: companyLatLng);

  @override
  Widget build(BuildContext context) {
    final DraggableScrollableController _scrollableController =
        DraggableScrollableController();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            children: [
              SimpleAppBar(iconBtnCase: 3, titleText: "모든 구독 상품"),
              // 여기에 기존의 위젯을 배치
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("전체",
                          style: widget.ts.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 14)),
                      DividerCicle(),
                      Text("우주패스",
                          style: widget.ts.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 14)),
                      DividerCicle(),
                      Text(
                        "Around",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.deepPurpleAccent),
                      ),
                      DividerCicle(),
                      Text("정기배송",
                          style: widget.ts.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 14)),
                      DividerCicle(),
                      Text("플러스",
                          style: widget.ts.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 14)),
                      DividerCicle(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.card_giftcard,
                          ),
                          Text("선물하기",
                              style: widget.ts.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              DividerDefault(),
              Container(
                height: 30,
                child: IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("월간/연간"),
                      VericalDeiverDefault(),
                      DropdownButton(
                        elevation: 1,
                        value: selectedValue,
                        items: valueList.map(
                          (value) {
                            return DropdownMenuItem(
                              child: Text(value),
                              value: value,
                            );
                          },
                        ).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedValue = value.toString();
                          });
                        },
                      ),
                      VericalDeiverDefault(),
                      DropdownButton(
                        elevation: 1,
                        value: selectedValue,
                        items: valueList.map(
                          (value) {
                            return DropdownMenuItem(
                              child: Text(value),
                              value: value,
                            );
                          },
                        ).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedValue = value.toString();
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              //DividerDefault(),
              Container(
                height: 300, // 원하는 높이를 설정하세요.
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: GoogleMap(
                        mapType: MapType.normal,
                        initialCameraPosition: initialPosition,
                      ),
                    ),
                    Expanded(child: Text("")),
                  ],
                ),
              ),

            ],
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.15, // 초기 사이즈: 10%로 설정 (이 부분을 조절해보세요)
            minChildSize: 0.15, // 최소 사이즈: 10%로 설정
            maxChildSize: 0.85, // 최대 사이즈: 70%로 설정 (이 부분을 조절해보세요)
            builder: (BuildContext context, ScrollController scrollController) {
              return SafeArea(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.grey),
                  child: Column(
                    children: [
                      Text("-"),
                      Expanded(
                        child: ListView.builder(
                          controller: scrollController,
                          itemCount: 25,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(title: Text('Item $index'));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class DividerCicle extends StatelessWidget {
  const DividerCicle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 4,
      height: 4,
      decoration: BoxDecoration(color: Colors.grey, shape: BoxShape.circle),
    );
  }
}

class DividerDefault extends StatelessWidget {
  const DividerDefault({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Colors.grey,
      //height: 30,
      thickness: 1,
      //indent: 1,
      //endIndent: 1,
    );
  }
}

class VericalDeiverDefault extends StatelessWidget {
  const VericalDeiverDefault({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VerticalDivider(
      color: Colors.grey,
      thickness: 1,
    );
  }
}
