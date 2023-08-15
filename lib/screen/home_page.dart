import 'package:blackcoffer/login/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final dbRef = FirebaseDatabase.instance.ref().child('Posts');
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController searchController = TextEditingController();
  String search = "";
  late Position _currentPosition;
  String _locationText = '';

  Future<void> _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      setState(() {
        _locationText = "Latitude: ${position.latitude}, Longitude: ${position.longitude}";
      });
    } catch (e) {
      print("Error getting location: $e");
    }
  }

  void _userHome() async {
    Get.to(
        LoginPage());
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 40.0,
                margin: EdgeInsets.fromLTRB(20.0, 20.0,20.0, 20.0),
                child: TextFormField(
                  //  controller: descriptionController,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                      BorderSide(width: 2, color: Colors.indigoAccent),
                    ),
                    hintText: "Search",
                    border: OutlineInputBorder(),
                    hintStyle: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.normal),
                    labelStyle: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.normal),
                  ),
                ),
              ),
              Expanded(
                child: FirebaseAnimatedList(
                  query: dbRef.child('Post List'),
                  itemBuilder: (BuildContext context, DataSnapshot snapshot,
                      Animation<double> animation, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              color: Colors.indigoAccent, width: 2),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        elevation: 10.0,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                        "NewDelhi",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
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
                                    padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Text(
                                      snapshot.child('pTitle').value.toString(),
                                      style: const TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black87),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: FadeInImage.assetNetwork(
                                    fit: BoxFit.cover,
                                    width: MediaQuery.of(context).size.width * 1,
                                    height:
                                    MediaQuery.of(context).size.width * .5,
                                    placeholder: "assets/loading.gif",
                                    image: snapshot
                                        .child('pImage')
                                        .value
                                        .toString()),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                                child: Text(
                                  snapshot
                                      .child('pDescription')
                                      .value
                                      .toString(),
                                  style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
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
                      ),
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
  final ButtonStyle style = ElevatedButton.styleFrom(
      minimumSize: Size(188, 48),
      backgroundColor: Color(0xFF051B8B),
      elevation: 6,
      textStyle: const TextStyle(fontSize: 16),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          )));
}

//backgroundColor: Color(0xff0F2B2F),
//   body: Center(
//     child: SingleChildScrollView(
//       scrollDirection: Axis.vertical,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: <Widget>[
//           const SizedBox(
//             height: 10.0,
//           ),
//           Container(
//             margin: const EdgeInsets.all(20.0),
//             child:  Column(
//               children: [
//                 const Row(
//                   children: [
//                     CircleAvatar(
//                       child: Icon(Icons.account_circle_rounded),
//                     ),
//                     SizedBox(width: 15.0),
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "bidur_05",
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 16
//                           ),
//                         ),
//                         Text(
//                           "Shimla",
//                           style: TextStyle(
//                               fontWeight: FontWeight.w500,
//                               fontSize: 12
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 10.0),
//                 Row(
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.only(left: 40.0),
//                       child: Text(
//                         "View of Himalaya",
//                         style: TextStyle(
//                             fontWeight: FontWeight.w500,
//                             fontSize: 15
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 10.0),
//                 Container(
//                   height: 210,
//                   child: Image(
//                       image: NetworkImage("https://wallpapercave.com/wp/wp2752213.jpg"),
//                   ),
//                 ),
//                 const SizedBox(height: 10.0),
//                 Row(
//                   children: [
//                     IconButton(
//                         onPressed: (){}
//                         , icon: Icon(Icons.preview_sharp)
//                     ),
//                     Text(
//                       "2000",
//                       style: TextStyle(
//                           fontWeight: FontWeight.w500,
//                           fontSize: 15
//                       ),
//                     ),
//                     const SizedBox(width: 20.0,),
//                     Text(
//                       "#Adventure",
//                       style: TextStyle(
//                           fontWeight: FontWeight.w500,
//                           fontSize: 15
//                       ),
//                     ),
//                   ],
//                 ),
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(left: 18.0),
//                       child: Text(
//                         "2 days ago",
//                         style: TextStyle(
//                             fontWeight: FontWeight.w500,
//                             fontSize: 15
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(
//             height: 10.0,
//           ),
//           Container(
//             margin: const EdgeInsets.all(20.0),
//             child:  Column(
//               children: [
//                 const Row(
//                   children: [
//                     CircleAvatar(
//                       child: Icon(Icons.account_circle_rounded),
//                     ),
//                     SizedBox(width: 15.0),
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "bidur_05",
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 16
//                           ),
//                         ),
//                         Text(
//                           "New Delhi",
//                           style: TextStyle(
//                               fontWeight: FontWeight.w500,
//                               fontSize: 12
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 10.0),
//                 Row(
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.only(left: 40.0),
//                       child: Text(
//                         "Morning Time",
//                         style: TextStyle(
//                             fontWeight: FontWeight.w500,
//                             fontSize: 15
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 10.0),
//                 Container(
//                   height: 210,
//                   child: Image(
//                     image: NetworkImage("https://th.bing.com/th/id/R.b1afe59f6c921a33b399f8430cae03cd?rik=HXoGx2F1LEfs0A&riu=http%3a%2f%2fwww.photoaxe.com%2fwp-content%2fuploads%2f2014%2f08%2fcofffecup.jpg&ehk=kjRd5mD5E19VA8q56bXzpxFGEaadsbSpZ7zSiHyHmMQ%3d&risl=&pid=ImgRaw&r=0"),
//                   ),
//                 ),
//                 const SizedBox(height: 10.0),
//                 Row(
//                   children: [
//                     IconButton(
//                         onPressed: (){}
//                         , icon: Icon(Icons.preview_sharp)
//                     ),
//                     Text(
//                       "2000",
//                       style: TextStyle(
//                           fontWeight: FontWeight.w500,
//                           fontSize: 15
//                       ),
//                     ),
//                     const SizedBox(width: 20.0,),
//                     Text(
//                       "#Adventure",
//                       style: TextStyle(
//                           fontWeight: FontWeight.w500,
//                           fontSize: 15
//                       ),
//                     ),
//                   ],
//                 ),
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(left: 18.0),
//                       child: Text(
//                         "2 days ago",
//                         style: TextStyle(
//                             fontWeight: FontWeight.w500,
//                             fontSize: 15
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     ),
//   ),

