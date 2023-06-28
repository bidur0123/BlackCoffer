import 'package:blackcoffer/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final ButtonStyle style = ElevatedButton.styleFrom(
      minimumSize: Size(188, 48),
      backgroundColor: Color(0xFF051B8B),
      elevation: 6,
      textStyle: const TextStyle(fontSize: 16),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
        Radius.circular(50),
      )));

  void _userHome() async {
    Get.to(LoginPage());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
      //  backgroundColor: Color(0xff0F2B2F),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              // const Text(
              //   'Welcome to Flutter!',
              //   style: TextStyle(fontSize: 24, color: Colors.white),
              // ),
              // SizedBox(height: 16),
              // ElevatedButton(
              //     style: style,
              //     onPressed: _userHome,
              //     child: const Text(
              //       'TEST AGAIN',
              //       style: TextStyle(fontSize: 14, color: Colors.white),
              //     )),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                margin: const EdgeInsets.all(20.0),
                child: const Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          child: Icon(Icons.account_circle_rounded),
                        ),
                        SizedBox(width: 15.0),
                        Text(
                            "bidur_05",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
