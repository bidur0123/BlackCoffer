import 'dart:io';
import 'package:blackcoffer/components/round_button.dart';
import 'package:blackcoffer/screen/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {

  bool showSpinner = false;
  final postRef = FirebaseDatabase.instance.reference().child('Posts');
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;
  File? _image;
  final picker = ImagePicker();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  Future getImageGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print("No Image Selected");
      }
    });
  }

  Future getCameraImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print("No Image Selected");
      }
    });
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
                    //  getCameraImage();
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
                      getImageGallery();
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
    return ModalProgressHUD(
      inAsyncCall:showSpinner,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 24.0),
            child: Column(
              children: [
                InkWell(
                  onTap: (){
                    dialog(context);
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * .3,
                    width: MediaQuery.of(context).size.width * 1,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: Colors.black,
                        width: 2.0,
                      ),
                    ),
                    child: _image != null
                        ? ClipRRect(
                      child: Image.file(
                        _image!.absolute,
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    )
                        : Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.black87, width: 1.5),
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10.0)),
                      height: 180,
                      width: 100,
                      child: const Icon(
                        Icons.add_a_photo,
                        color: Colors.indigoAccent,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
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
                    onPress: () async {
                      setState(() {
                        showSpinner = true;
                      });
                      try {
                        int date = DateTime.now().millisecondsSinceEpoch;
                        firebase_storage.Reference ref = firebase_storage
                            .FirebaseStorage.instance
                            .ref(("/BlackCoffer$date"));
                        UploadTask uploadTask = ref.putFile(_image!.absolute);
                        await Future.value(uploadTask);
                        var newUrl = await ref.getDownloadURL();
                        final User ? user = _auth.currentUser;
                        postRef.child("Post List").child(date.toString()).set({
                          'pId': date.toString(),
                          'pImage': newUrl.toString(),
                          'pTime': date.toString(),
                          'pTitle': titleController.text.toString(),
                          'pDescription': descriptionController.text.toString(),
                          'uEmail': user!.email.toString(),
                          'uid': user.uid.toString(),
                        }).then((value) {
                          toastMessages("Post Uploaded");
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                          setState(() {
                            showSpinner = false;
                          });
                        }).onError((error, stackTrace) {
                          toastMessages(error.toString());
                          setState(() {
                            showSpinner = true;
                          });
                        });
                      } catch (e) {
                        setState(() {
                          showSpinner = false;
                        });
                        toastMessages(e.toString());
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
  void toastMessages(String message) {
    Fluttertoast.showToast(
        msg: message.toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.indigoAccent,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}

