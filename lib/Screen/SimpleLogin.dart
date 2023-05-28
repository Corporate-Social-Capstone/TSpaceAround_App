import 'package:flutter/material.dart';
import 'MyApp.dart';

class LoginMode extends StatelessWidget {
  const LoginMode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String loginId = "";
    final ts = TextStyle(
        fontSize: 20, fontWeight: FontWeight.w700, color: Colors.black);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 176,
              height: 64,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0))),
                onPressed: () {
                  loginId = "김건휘";
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          //페이지 스택 제거
                          builder: (BuildContext context) => MyApp(
                                loginId: loginId,
                              )),
                      (route) => false);
                },
                child: Text("김건휘", style: ts.copyWith(color: Colors.white)),
              ),
            ),
            SizedBox(height: 32),
            SizedBox(
              width: 176,
              height: 64,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0))),
                onPressed: () {
                  loginId = "김형국";
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          //페이지 스택 제거
                          builder: (BuildContext context) => MyApp(
                                loginId: loginId,
                              )),
                      (route) => false);
                },
                child: Text("김형국", style: ts.copyWith(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
