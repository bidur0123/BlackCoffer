import 'dart:io';
import 'package:blackcoffer/components/round_button.dart';
import 'package:blackcoffer/screen/VideoUpload/upload_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';


class UploadVideoScreen extends StatefulWidget {
  const UploadVideoScreen({Key? key}) : super(key: key);

  @override
  State<UploadVideoScreen> createState() => _UploadVideoScreenState();
}

class _UploadVideoScreenState extends State<UploadVideoScreen> {

  final picker = ImagePicker();

  getVideoFile(ImageSource sourceImg) async {
    final videoFile = await ImagePicker().pickVideo(source: sourceImg);

    if(videoFile !=null){
      // video upload form
      Get.to(
          UploadForm(
            videoFile : File(videoFile.path),
            videoPath : videoFile.path,
          )
      );
    }
  }

  void dialog(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            content: Container(
              decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(20)),
              height: 126,
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      getVideoFile(ImageSource.camera);
                      Navigator.pop(context);
                    },
                    child: ListTile(
                      tileColor: Colors.indigoAccent.shade200,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(width: 2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      leading: const Icon(Icons.camera),
                      title: const Text(
                        "Camera",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 6.0,
                  ),
                  InkWell(
                    onTap: () {
                      getVideoFile(ImageSource.gallery);
                      Navigator.pop(context);
                    },
                    child: ListTile(
                      tileColor: Colors.indigoAccent.shade200,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(width: 2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      leading: const Icon(Icons.photo_library),
                      title: const Text("Gallery",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
  @override
  Widget build(BuildContext context) {
    TextEditingController descriptionController= TextEditingController();
    TextEditingController titleController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 24.0),
          child: Column(
            children: [
             const SizedBox(
                height: 230.0,
              ),
              // InkWell(
              //   onTap: (){
              //     dialog(context);
              //   },
              //   child: Container(
              //     margin: EdgeInsets.only(left: 80),
              //     height: 80,
              //     width: 150,
              //     child: Image.asset("assets/upload.png"),
              //   )
              // ),
              Container(
                margin: EdgeInsets.only(left: 60),
                height: 60,
                width: 200,
                child: RoundButton(
                    title: "    Upload \n Your Video",
                    onPress: (){
                      dialog(context);
                    }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

