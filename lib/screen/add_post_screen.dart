import 'package:flutter/material.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
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
              Icons.search,
              color: Colors.white,
            ),
            iconSize: 28,
            tooltip: 'Search',
            onPressed: () {

            },
          ),
        ],
      ),
    );
  }
}

