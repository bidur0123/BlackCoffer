import 'package:blackcoffer/login_screen.dart';
import 'package:blackcoffer/screen/VideoUpload/video_post.dart';
import 'package:blackcoffer/screen/add_post_screen.dart';
import 'package:blackcoffer/screen/home_page.dart';
import 'package:blackcoffer/screen/post_screen.dart';
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
      UploadVideoScreen(),
      PostScreen(),
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
        title: Text(
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
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          padding: const EdgeInsets.all(0),
          children:  [
            const DrawerHeader (
              padding: EdgeInsets.all(0.0),
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color:Colors.indigoAccent,
                ),
                accountName: Text(
                  "Bidur Gupta",
                  style: TextStyle(
                    fontFamily: 'Mulish',
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                accountEmail: Text(
                  "7398682731",
                  style: TextStyle(
                    fontFamily: 'Mulish',
                    color: Colors.white,
                  ),
                ),
                currentAccountPictureSize: Size.square(70),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.black,
                  child: Text(
                    "BG",
                    style: TextStyle(
                      fontSize: 30.0,
                      fontFamily: 'Mulish',
                      color: Colors.white,
                    ),
                  ), //Text
                ),
              ),
            ),
           const ListTile(
              leading: Icon(Icons.my_library_books_rounded),
              title: Text(' FAQs'),
            ),
            const ListTile(
              leading: Icon(Icons.book),
              title: Text(' About Us'),
            ),
            const ListTile(
              leading: Icon(Icons.contact_phone),
              title: Text(' Contact Us '),
            ),
            const ListTile(
              leading: Icon(Icons.privacy_tip),
              title: Text(' Privacy and Policy  '),
            ),
            const ListTile(
              leading: Icon(Icons.pin_end),
              title: Text(' Terms and Condition  '),
            ),
            ListTile(
              onTap: () {
                _userHome();
              },
              leading: Icon(Icons.logout),
              title: Text(' Log Out  '),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(45.0, 200.0, 40.0, 20.0),
                child: Text (
                  'Made By Bidur Gupta..',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'Mulish',
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
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
                icon: Icon(FontAwesomeIcons.home),          label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.upload),           label: "Upload"),
            BottomNavigationBarItem(
                icon: Icon(Icons.image),                    label: "YourPost"),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_rounded),   label: "Profile")
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
