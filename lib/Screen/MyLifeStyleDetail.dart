import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:t_space_around/Component/Chart.dart';
import 'package:t_space_around/Screen/AroundRecoListView.dart';
import 'package:t_space_around/Screen/MyApp.dart';
import '../Component/IconButton.dart';
import 'package:dio/dio.dart';

class MyLifeStyle extends StatefulWidget {
  //final List<charts.Series<Sales, String>> seriesList;
  final String loginId;

  const MyLifeStyle({
    required this.loginId,
    Key? key,
  }) : super(key: key);

  @override
  State<MyLifeStyle> createState() => _MyLifeStyleState();
}

class _MyLifeStyleState extends State<MyLifeStyle> {
  Future getMyLifeStyle() async {
    final dio = Dio();
    final resp = await dio.get(
        "http://43.200.183.214:4001/user/myLifeStyle?name=" + widget.loginId);
    print(resp.data);
    return resp.data;
  }

  @override
  Widget build(BuildContext context) {
    final ts = TextStyle(
        fontSize: 16, fontWeight: FontWeight.w700, color: Colors.black);
    final ContainerBorderDecoration = BoxDecoration(
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
    );
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: FutureBuilder(
            future: getMyLifeStyle(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Text("Error: ${snapshot.error}");
              }
              var categories = snapshot.data['ex'];
              var ment = snapshot.data['ment'];
              var storeName = snapshot.data['store'];
              print(storeName);
              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                    title: Text(
                      "나의 라이프 스타일",
                      style: ts.copyWith(fontSize: 20),
                    ),
                    iconTheme: IconThemeData(color: Colors.black),
                    backgroundColor: Colors.white,
                    centerTitle: false,
                    actions: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child:
                            CustomIconButton(iconCase: 3, onPressed: onPressed),
                      )
                    ],
                  ),
                  SliverPadding(
                    padding: EdgeInsets.all(16),
                    sliver: SliverToBoxAdapter(
                      child: TopPart(
                          data: categories,
                          loginId: widget.loginId,
                          ContainerBorderDecoration: ContainerBorderDecoration,
                          ts: ts),
                    ),
                  ),
                  BottomPart(
                    loginId: widget.loginId,
                    storeName: storeName,
                    ment: ment,
                    ts: ts,
                    ContainerBorderDecoration: ContainerBorderDecoration,
                  ),
                ],
              );
            }));
  }

  void onPressed() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            //페이지 스택 제거
            builder: (BuildContext context) => MyApp(
                  loginId: widget.loginId,
                )),
        (route) => false);
  }
}

class TopPart extends StatelessWidget {
  final String loginId;
  final TextStyle ts;
  final BoxDecoration ContainerBorderDecoration;
  final dynamic data;

  const TopPart(
      {required this.data,
      required this.loginId,
      required this.ts,
      required this.ContainerBorderDecoration,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: ContainerBorderDecoration,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "4월 지출",
                  style: ts.copyWith(fontSize: 24),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Colors.black,
                  ),
                ),
              ],
            ),

            // 이부분
            CustomChart(
              ex1: int.parse(data[0]),
              ex2: int.parse(data[1]),
              ex3: int.parse(data[2]),
              ex4: int.parse(data[3]),
              ex5: int.parse(data[4]),
              ex6: int.parse(data[5]),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipOval(
                    child: Image(
                      image: AssetImage(
                        'asset/img/SamsungCard.jpeg',
                      ),
                      width: 48, // 이미지의 너비를 설정합니다.
                      height: 48, // 이미지의 높이를 설정합니다.
                      fit: BoxFit.cover, // 이미지가 부모 위젯의 크기에 맞게 조절되도록 합니다.)
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "헤베커피(Hebe Coffee)",
                        style: ts.copyWith(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "오늘, 삼성카드 결제",
                        style: ts.copyWith(
                            fontSize: 15,
                            color: Colors.grey,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  Spacer(),
                  Text(
                    "-6,000원",
                    style: ts.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            GestureDetector(
              onTap: () {
                print("sadf");
              },
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 75,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          child: Image(
                            image: AssetImage(
                              'asset/img/Scard1.jpeg',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "카드별 지출 내역",
                                style: ts,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "삼성카드&POINT",
                                    style: ts.copyWith(
                                        fontSize: 15, color: Colors.grey[700]),
                                  ),
                                  Text(
                                    " 외 1개",
                                    style: ts.copyWith(
                                        fontSize: 15, color: Colors.grey[700]),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.chevron_right)
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomPart extends StatelessWidget {
  final String loginId;
  final dynamic ment;
  final dynamic storeName;
  final TextStyle ts;
  final BoxDecoration ContainerBorderDecoration;

  const BottomPart(
      {
        required this.loginId,
        required this.storeName,
        required this.ment,
      required this.ts,
      required this.ContainerBorderDecoration,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(16.0),
      sliver: SliverToBoxAdapter(
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: ContainerBorderDecoration,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 32, 0, 16),
                child: Text("Around 추천", style: ts.copyWith(fontSize: 20)),
              ),
              MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 8.0, left: 16, right: 16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(ment, style: ts),
                                    ],
                                  ),
                                ),
                              ),
                              AroundRecoListView(
                                loginId: loginId,
                                  cafeDis: 592,

                                  storeName: storeName),
                              // Divider(
                              //   color: Colors.grey,
                              //   height: 30,
                              //   thickness: 0.5,
                              // ),
                              // AroundRecoListView(
                              //   loginId: loginId,
                              //   cafeDis: 966,
                              //   storeName: storeName,
                              //   cafeImage: "caffe115.jpeg",
                              // ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                    child: GestureDetector(
                                  onTap: () {},
                                  child: Text(
                                    "더보기",
                                    style: ts.copyWith(
                                        color: Colors.grey[700],
                                        fontWeight: FontWeight.w500,
                                        decoration: TextDecoration.underline),
                                  ),
                                )),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
