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
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  margin: const EdgeInsets.all(20.0),
                  child:  Column(
                    children: [
                      const Row(
                        children: [
                          CircleAvatar(
                            child: Icon(Icons.account_circle_rounded),
                          ),
                          SizedBox(width: 15.0),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "bidur_05",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16
                                ),
                              ),
                              Text(
                                "Shimla",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 40.0),
                            child: Text(
                              "View of Himalaya",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      Container(
                        height: 210,
                        child: Image(
                            image: NetworkImage("https://wallpapercave.com/wp/wp2752213.jpg"),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        children: [
                          IconButton(
                              onPressed: (){}
                              , icon: Icon(Icons.preview_sharp)
                          ),
                          Text(
                            "2000",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15
                            ),
                          ),
                          const SizedBox(width: 20.0,),
                          Text(
                            "#Adventure",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 18.0),
                            child: Text(
                              "2 days ago",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  margin: const EdgeInsets.all(20.0),
                  child:  Column(
                    children: [
                      const Row(
                        children: [
                          CircleAvatar(
                            child: Icon(Icons.account_circle_rounded),
                          ),
                          SizedBox(width: 15.0),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "bidur_05",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16
                                ),
                              ),
                              Text(
                                "New Delhi",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 40.0),
                            child: Text(
                              "Morning Time",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      Container(
                        height: 210,
                        child: Image(
                          image: NetworkImage("https://th.bing.com/th/id/R.b1afe59f6c921a33b399f8430cae03cd?rik=HXoGx2F1LEfs0A&riu=http%3a%2f%2fwww.photoaxe.com%2fwp-content%2fuploads%2f2014%2f08%2fcofffecup.jpg&ehk=kjRd5mD5E19VA8q56bXzpxFGEaadsbSpZ7zSiHyHmMQ%3d&risl=&pid=ImgRaw&r=0"),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        children: [
                          IconButton(
                              onPressed: (){}
                              , icon: Icon(Icons.preview_sharp)
                          ),
                          Text(
                            "2000",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15
                            ),
                          ),
                          const SizedBox(width: 20.0,),
                          Text(
                            "#Adventure",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 18.0),
                            child: Text(
                              "2 days ago",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  margin: const EdgeInsets.all(20.0),
                  child:  Column(
                    children: [
                      const Row(
                        children: [
                          CircleAvatar(
                            child: Icon(Icons.account_circle_rounded),
                          ),
                          SizedBox(width: 15.0),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "bidur_05",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16
                                ),
                              ),
                              Text(
                                "New Delhi",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 40.0),
                            child: Text(
                              "Morning Time",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      Container(
                        height: 210,
                        child: Image(
                          image: NetworkImage("https://th.bing.com/th/id/R.b1afe59f6c921a33b399f8430cae03cd?rik=HXoGx2F1LEfs0A&riu=http%3a%2f%2fwww.photoaxe.com%2fwp-content%2fuploads%2f2014%2f08%2fcofffecup.jpg&ehk=kjRd5mD5E19VA8q56bXzpxFGEaadsbSpZ7zSiHyHmMQ%3d&risl=&pid=ImgRaw&r=0"),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        children: [
                          IconButton(
                              onPressed: (){}
                              , icon: Icon(Icons.preview_sharp)
                          ),
                          Text(
                            "2000",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15
                            ),
                          ),
                          const SizedBox(width: 20.0,),
                          Text(
                            "#Adventure",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 18.0),
                            child: Text(
                              "2 days ago",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  margin: const EdgeInsets.all(20.0),
                  child:  Column(
                    children: [
                      const Row(
                        children: [
                          CircleAvatar(
                            child: Icon(Icons.account_circle_rounded),
                          ),
                          SizedBox(width: 15.0),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "bidur_05",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16
                                ),
                              ),
                              Text(
                                "New Delhi",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 40.0),
                            child: Text(
                              "Morning Time",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      Container(
                        height: 210,
                        child: Image(
                          image: NetworkImage("https://th.bing.com/th/id/R.b1afe59f6c921a33b399f8430cae03cd?rik=HXoGx2F1LEfs0A&riu=http%3a%2f%2fwww.photoaxe.com%2fwp-content%2fuploads%2f2014%2f08%2fcofffecup.jpg&ehk=kjRd5mD5E19VA8q56bXzpxFGEaadsbSpZ7zSiHyHmMQ%3d&risl=&pid=ImgRaw&r=0"),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        children: [
                          IconButton(
                              onPressed: (){}
                              , icon: Icon(Icons.preview_sharp)
                          ),
                          Text(
                            "2000",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15
                            ),
                          ),
                          const SizedBox(width: 20.0,),
                          Text(
                            "#Adventure",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 18.0),
                            child: Text(
                              "2 days ago",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  margin: const EdgeInsets.all(20.0),
                  child:  Column(
                    children: [
                      const Row(
                        children: [
                          CircleAvatar(
                            child: Icon(Icons.account_circle_rounded),
                          ),
                          SizedBox(width: 15.0),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "bidur_05",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16
                                ),
                              ),
                              Text(
                                "New Delhi",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 40.0),
                            child: Text(
                              "Morning Time",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      Container(
                        height: 210,
                        child: Image(
                          image: NetworkImage("https://th.bing.com/th/id/R.b1afe59f6c921a33b399f8430cae03cd?rik=HXoGx2F1LEfs0A&riu=http%3a%2f%2fwww.photoaxe.com%2fwp-content%2fuploads%2f2014%2f08%2fcofffecup.jpg&ehk=kjRd5mD5E19VA8q56bXzpxFGEaadsbSpZ7zSiHyHmMQ%3d&risl=&pid=ImgRaw&r=0"),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Row(
                        children: [
                          IconButton(
                              onPressed: (){}
                              , icon: Icon(Icons.preview_sharp)
                          ),
                          Text(
                            "2000",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15
                            ),
                          ),
                          const SizedBox(width: 20.0,),
                          Text(
                            "#Adventure",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 18.0),
                            child: Text(
                              "2 days ago",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
