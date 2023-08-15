import 'package:blackcoffer/login/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  final dbRef = FirebaseDatabase.instance.ref().child('Posts');
  FirebaseAuth auth = FirebaseAuth.instance;
  void _userHome() async {
    Get.to(
        LoginPage());
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
          child: ListView(
            padding: const EdgeInsets.all(0),
            children:  [
              DrawerHeader (
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
                    "bidurgupta125@gmail.com",
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
              ListTile(
                leading: Icon(Icons.my_library_books_rounded),
                title: Text(' FAQs'),
              ),
              ListTile(
                leading: Icon(Icons.book),
                title: Text(' About Us'),
              ),
              ListTile(
                leading: Icon(Icons.contact_phone),
                title: Text(' Contact Us '),
              ),
              ListTile(
                leading: Icon(Icons.privacy_tip),
                title: Text(' Privacy and Policy  '),
              ),
              ListTile(
                leading: Icon(Icons.pin_end),
                title: Text(' Terms and Condition  '),
              ),
              InkWell(
                onTap: (){
                  _userHome();
                },
                child: ListTile(
                  leading: Icon(Icons.logout),
                  title: Text(' Log Out  '),
                ),
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
     );
  }
}
