import 'package:blackcoffer/components/round_button.dart';
import 'package:flutter/material.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {

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
                    //  getImageGallery();
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
                  child: Icon(
                    Icons.add_a_photo,
                    color: Colors.blueAccent.shade700,
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
                  title: "UPlOAD",
                  onPress: (){

                  }
              ),
            ],
          ),
        ),
      ),
    );
  }
}

