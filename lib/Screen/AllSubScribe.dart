import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../Component/SimpleAppBar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AllSubScribe extends StatefulWidget {
  final TextStyle ts;

  const AllSubScribe({required this.ts, Key? key}) : super(key: key);

  @override
  State<AllSubScribe> createState() => _AllSubScribeState();
}

class _AllSubScribeState extends State<AllSubScribe> {
  var selectedValue = '모든 구독 상품 유형';
  var selectedValue2 = '추천순';
  final valueList = ['모든 구독 상품 유형', '모든 구독 상품 유형2'];
  final valueList2 = ['추천순', '별점순'];
  static final LatLng companyLatLng = LatLng(37.560295, 126.998269);
  static final CameraPosition initialPosition =
      CameraPosition(zoom: 15, target: companyLatLng);

  @override
  Widget build(BuildContext context) {
    final DraggableScrollableController _scrollableController =
        DraggableScrollableController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        double sheetHeight = constraints.maxHeight * 0.6;
        return Stack(
          children: [
            Column(
              children: [
                SimpleAppBar(iconBtnCase: 3, titleText: "모든 구독 상품"),
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
                          value: selectedValue2,
                          items: valueList2.map(
                            (value) {
                              return DropdownMenuItem(
                                child: Text(value),
                                value: value,
                              );
                            },
                          ).toList(),
                          onChanged: (value) {
                            setState(() {
                              selectedValue2 = value.toString();
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: FutureBuilder(
                      future: checkPermision(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (snapshot.data == '위치 권한이 허가 되었습니다.') {
                          return Container(
                            height:
                                MediaQuery.of(context).size.height * 0.6 - 148,
                            child: CustomGoogleMap(
                              initialPosition: initialPosition,
                            ),
                          );
                        }
                        return Center(
                          child: Text(snapshot.data),
                        );
                        print(snapshot.data);
                        print(snapshot.connectionState);
                      }),
                ),
              ],
            ),
            DraggableScrollableSheet(
              initialChildSize: 0.4,
              minChildSize: 0.4,
              maxChildSize: 0.85,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return SafeArea(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 10,
                            offset: Offset(0, 0)),
                      ],
                    ),
                    child: Column(
                      children: [
                        Center(
                          child: Icon(
                            Icons.maximize_rounded,
                            size: 32,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "가게 목록",
                                style: widget.ts.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "거리순",
                                    style: widget.ts.copyWith(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Icon(Icons.expand_more_outlined),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 16),
                        Expanded(
                          child: ListView.builder(
                            controller: scrollController,
                            itemCount: 25,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(16.0, 16, 16, 16),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: Row(
                                        children: [
                                          ClipOval(
                                            child: Image(
                                              image: AssetImage(
                                                'asset/img/caffe115.jpeg',
                                              ),
                                              width: 56, // 이미지의 너비를 설정합니다.
                                              height: 56, // 이미지의 높이를 설정합니다.
                                              fit: BoxFit
                                                  .cover, // 이미지가 부모 위젯의 크기에 맞게 조절되도록 합니다.)
                                            ),
                                          ),
                                          SizedBox(width: 8),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "피플스카페 충무로점",
                                                style: widget.ts.copyWith(
                                                    color: Colors.black,
                                                    fontSize: 18),
                                              ),
                                              SizedBox(height: 8),
                                              Text(
                                                "592M",
                                                style: widget.ts.copyWith(
                                                    fontSize: 15,
                                                    color: Colors.grey,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 12),
                                    DividerDefault(),
                                  ],
                                ),
                              );
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
        );
      }),
    );
  }

  Future<String> checkPermision() async {
    final isLocationEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isLocationEnabled) {
      return '위치 서비스를 활성화 해주세요.';
    }
    LocationPermission checkedPermision = await Geolocator.checkPermission();
    if (checkedPermision == LocationPermission.denied) {
      checkedPermision = await Geolocator.requestPermission();
      if (checkedPermision == LocationPermission.denied) {
        return '위치 권한을 허가해주세요.';
      }
    }
    if (checkedPermision == LocationPermission.deniedForever) {
      return '앱의 위치 권한을 세팅에서 허가해주세요.';
    }
    return '위치 권한이 허가 되었습니다.';
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

class CustomGoogleMap extends StatelessWidget {
  final CameraPosition initialPosition;

  const CustomGoogleMap({required this.initialPosition, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      myLocationButtonEnabled: false,
      myLocationEnabled: true,
      mapType: MapType.normal,
      initialCameraPosition: initialPosition,
    );
  }
}
