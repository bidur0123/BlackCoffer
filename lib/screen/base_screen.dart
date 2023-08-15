import 'package:blackcoffer/login/login_screen.dart';
import 'package:blackcoffer/screen/VideoUpload/video_post.dart';
import 'package:blackcoffer/screen/add_post_screen.dart';
import 'package:blackcoffer/screen/drawer_screen.dart';
import 'package:blackcoffer/screen/home_page.dart';
import 'package:blackcoffer/screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:blackcoffer/constants/color_constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class BaseScreen extends StatefulWidget {
  const  BaseScreen({Key? key}) : super(key: key);

  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int _selectedIndex = 0;

  static  final List<Widget> _widgetOptions = <Widget>[
      HomePage(),
      AddPostScreen(),
      UploadVideoScreen(),
      ProfileScreen(),
  ];

  void _userHome() async {
    Get.to(
        LoginPage());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff133D59),
        title: const Text(
            "BLACKCOFFER",
          style: TextStyle(
            color: Colors.white
          ),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(
                Icons.notifications,
              color: Colors.white,
            ),
            iconSize: 28,
            tooltip: 'notifications',
            onPressed: () {

            },
          ),
        ],
      ),
      drawer: DrawerScreen(),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor:Color(0xff133D59) ,
          type: BottomNavigationBarType.shifting,
          selectedItemColor: kPrimaryColor,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.home),             label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.upload),           label: "Upload"),
            BottomNavigationBarItem(
                icon: Icon(Icons.image),                       label: "VideoPost"),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_rounded),      label: "Profile")
          ],
          currentIndex: _selectedIndex,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          }
      ),
    );
  }
}
