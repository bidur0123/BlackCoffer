import 'dart:io';

import 'package:blackcoffer/components/round_button.dart';
import 'package:blackcoffer/global.dart';
import 'package:blackcoffer/screen/VideoUpload/upload_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'package:video_player/video_player.dart';

class UploadForm extends StatefulWidget {

  final File videoFile;
  final String videoPath;
  UploadForm({required this.videoFile , required this.videoPath});

  @override
  State<UploadForm> createState() => _UploadFormState();
}

class _UploadFormState extends State<UploadForm> {

  UploadController uploadController = Get.put(UploadController());
  VideoPlayerController? playerController;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      playerController = VideoPlayerController.file(widget.videoFile);
    });
    playerController!.initialize();
    playerController!.play();
    playerController!.setVolume(2);
    playerController!.setLooping(true);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    playerController!.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height /2,
                child: VideoPlayer(playerController!),
              ),
              showProgressBarAnimation == true
               ? Container(
                margin: EdgeInsets.only(top: 100),
                  child: const SimpleCircularProgressBar(
                    progressColors : [
                      Colors.green,
                      Colors.blueAccent,
                      Colors.red,
                      Colors.amber,
                      Colors.purpleAccent,
                    ],
                    animationDuration: 20,
                    backColor: Colors.white,
                  ),
                 )
               :Padding(
                 padding: const EdgeInsets.all(28.0),
                 child: Column(
                    children: [
                            const SizedBox(
                              height: 30,
                            ),
                            Form(
                              child: Column(
                                children: [
                                  TextFormField(
                                    controller: titleController,
                                    keyboardType: TextInputType.text,
                                    decoration: const InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide:
                                        BorderSide(width: 2, color: Colors.black87),
                                      ),
                                      labelText: "Title",
                                      hintText: "Enter Title",
                                      border: OutlineInputBorder(),
                                      hintStyle: TextStyle(
                                          color: Colors.grey, fontWeight: FontWeight.normal),
                                      labelStyle: TextStyle(
                                          color: Colors.grey, fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  TextFormField(
                                    controller: descriptionController,
                                    keyboardType: TextInputType.text,
                                    minLines: 1,
                                    maxLength: 250,
                                    decoration: const InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide:
                                        BorderSide(width: 2, color: Colors.black87),
                                      ),
                                      labelText: "Description",
                                      hintText: "Enter Description",
                                      border: OutlineInputBorder(),
                                      hintStyle: TextStyle(
                                          color: Colors.grey, fontWeight: FontWeight.normal),
                                      labelStyle: TextStyle(
                                          color: Colors.grey, fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                              const SizedBox(
                                height: 30,
                              ),
                             RoundButton(
                                title: "UPLOAD",
                                onPress: () {
                                  if(titleController.text.isEmpty
                                        && descriptionController.text.isEmpty)
                                    {
                                      uploadController.saveVideoInformationToFirestoreDatabase(
                                          titleController.text,
                                          descriptionController.text, widget.videoPath,
                                          context
                                      );
                                    }
                                  setState(() {
                                    showProgressBarAnimation = true;
                                  });
                                }
                                ),
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
